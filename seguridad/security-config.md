# Configuración de Seguridad para Flujo de Integración

## 1. Autenticación y Autorización

### 1.1. Mecanismo de Autenticación
- **Protocolo**: OAuth 2.0 con FAPI (Financial-grade API) Profile
- **Alcance**: `openid profile payments`
- **Endpoints**:
  - Autorización: `https://auth.banco.com/realms/master/protocol/openid-connect/auth`
  - Token: `https://auth.banco.com/realms/master/protocol/openid-connect/token`
  - Introspección: `https://auth.banco.com/realms/master/protocol/openid-connect/token/introspect`

### 1.2. Políticas de Acceso
| Rol               | Alcance de Permisos                                                                 | Métodos HTTP Permitidos |
|-------------------|------------------------------------------------------------------------------------|-------------------------|
| `developer`       | Lectura de contratos OpenAPI, ejecución de pipelines CI/CD                        | GET, POST               |
| `secops`          | Configuración de políticas de seguridad, revisión de logs                         | GET, PUT, POST          |
| `integration_team`| Modificación de mapeos de datos, despliegue de versiones                          | GET, POST, PATCH        |
| `auditor`         | Acceso de solo lectura a todos los recursos                                        | GET                     |

### 1.3. Cifrado de Datos
- **En Tránsito**: TLS 1.3 con suites de cifrado `TLS_AES_256_GCM_SHA384` y `TLS_CHACHA20_POLY1305_SHA256`
- **En Reposo**:
  - Base de datos: AES-256 con claves gestionadas por AWS KMS
  - Archivos estáticos: Cifrado server-side con S3 SSE-KMS

### 1.4. Validación de Tokens
```yaml
# Ejemplo de configuración para validación de tokens JWT
security:
  jwt:
    issuer: "https://auth.banco.com/realms/master"
    audience: "integracion-api"
    algorithms: ["RS256"]
    clockSkew: 30
    jwksUri: "https://auth.banco.com/realms/master/protocol/openid-connect/certs"
```

### 1.5. Protección contra Ataques
- **Rate Limiting**: 1000 solicitudes por minuto por IP
- **CORS**: Orígenes permitidos `https://*.banco.com`, `https://*.gitlab.com`
- **CSRF**: Tokens CSRF en formularios de configuración
- **OWASP ZAP**: Escaneo automatizado en cada despliegue (ver `documentacion/propuesta-flujo-ci.md`)

### 1.6. Registro y Monitoreo
- **Logs**: Estructurados en formato JSON con campos:
  ```json
  {
    "timestamp": "ISO8601",
    "level": "INFO|WARN|ERROR",
    "service": "integracion-api",
    "correlationId": "UUID",
    "userId": "string",
    "action": "string",
    "metadata": {}
  }
  ```
- **Métricas**: Prometheus con endpoints `/metrics` (ver `documentacion/propuesta-flujo-ci.md`)

### 1.7. Integración con DevOps
- **GitLab CI/CD**:
  - Variables de entorno cifradas con `SOPS`
  - Escaneo de vulnerabilidades con `Trivy` en etapa de build
  - Firma de artefactos con `Cosign`

- **Prometheus + Grafana**:
  - Dashboards para métricas de seguridad:
    - Tasa de autenticación fallida
    - Tiempo de respuesta de endpoints protegidos
    - Número de solicitudes bloqueadas por WAF

## 2. Estándares y Cumplimiento
- **ISO 20022**: Validación de esquemas de mensajes financieros
- **FAPI**: Perfil de seguridad para APIs financieras
- **SLSA**: Supply-chain Levels for Software Artifacts (nivel 3)
- **OWASP API Security Top 10**: Mitigación de riesgos

## 3. Ejemplo de Configuración para Herramientas
### 3.1. OWASP ZAP en GitLab CI
```yaml
# .gitlab-ci.yml (fragmento)
zap_scan:
  stage: security
  image: owasp/zap2docker-weekly
  script:
    - zap-baseline.py -t "https://integracion-api.banco.com" -r zap_report.html
    - if [ $(grep "High Alerts" zap_report.html | grep -v "0") ]; then exit 1; fi
  artifacts:
    paths:
      - zap_report.html
```

### 3.2. Prometheus AlertManager
```yaml
# prometheus/alert.rules.yml
groups:
- name: security-alerts
  rules:
  - alert: HighAuthenticationFailureRate
    expr: rate(http_requests_total{status=~"401|403"}[5m]) > 0.1
    for: 5m
    labels:
      severity: critical
    annotations:
      summary: "Alta tasa de autenticación fallida en {{ $labels.service }}"
      description: "El servicio {{ $labels.service }} tiene una tasa de fallos de autenticación del {{ $value }} por minuto"
```

### 3.3. Configuración de AWS KMS
```json
{
  "KeyMetadata": {
    "AWSAccountId": "123456789012",
    "KeyId": "alias/integracion-api",
    "Arn": "arn:aws:kms:us-east-1:123456789012:key/abcd1234-5678-90ef-ghij-klmnopqrstuv",
    "Description": "Clave para cifrado de datos sensibles en integración",
    "KeyUsage": "ENCRYPT_DECRYPT",
    "KeyState": "Enabled",
    "Enabled": true
  }
}
```

## 4. Superficie de Práctica

### 4.1. Tareas Pendientes
- [ ] Implementar política de rotación automática de claves KMS cada 90 días
- [ ] Configurar WAF con reglas OWASP Core Rule Set
- [ ] Definir proceso de escalamiento para incidentes de seguridad
- [ ] Documentar procedimiento de recuperación ante desastres

### 4.2. Preguntas para Reflexión
- ¿Cómo garantizarías la trazabilidad de los tokens JWT durante 5 años?
- ¿Qué estrategias usarías para manejar secretos en pipelines CI/CD?
- ¿Cómo validarías el cumplimiento de FAPI en los endpoints de la API?