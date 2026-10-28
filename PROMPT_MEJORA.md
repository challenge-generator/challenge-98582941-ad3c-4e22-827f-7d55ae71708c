# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `seguridad/security-config.md` — El topic pide autenticacion/seguridad: este archivo es el ejercicio.
- `openapi.yaml` — El topic pide el contrato de API: openapi.yaml es el ejercicio.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Archivos que la arquitectura del reto declara y no estan

Creálos con implementacion real, en la capa que les corresponde:

- `README.md`
- `contratos/integracion-openapi.yaml`
- `contratos/mapeo-datos.csv`

## Como saber que terminaste

```bash
npx --yes @redocly/cli lint openapi.yaml
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Integración, Especialidad Analista SOA, Tecnología Integración, Senior

### Brecha de conocimiento
Promueve la comunicación e integración entre equipos de desarrollo, operaciones y seguridad. Comprende el SDLC (Software Development Life Cicle) y tu participación como arquitecto en cada parte del ciclo.

### Misión / candidato
Candidato con experiencia senior como Analista SOA, trabajando en sistemas de integración complejos con múltiples equipos distribuidos.

### Reto
- Tema: Participación activa en pro de la cultura DevOps
- Seniority: senior-l2
- Tipo: mixed
- Título: Implementación de un flujo de integración continuo en un entorno multi-equipo
- Tiempo estimado: 2 semanas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración y mapeo del sistema existente — objetivo: Comprender las interacciones actuales entre equipos y sistemas para identificar áreas de mejora. — entregable (NO resolver): Mapa de interacciones y dependencias con identificación de restricciones y ambigüedades.
- Fase 2: Diseño de un flujo de integración continuo — objetivo: Proponer un flujo de integración que promueva la cultura DevOps y mejore la comunicación entre equipos. — entregable (NO resolver): Propuesta de flujo de integración continuo con participación de todos los equipos.
- Fase 3: Implementación y validación del flujo de integración — objetivo: Implementar y validar el flujo de integración propuesto para asegurar su efectividad. — entregable (NO resolver): Flujo de integración continuo implementado y validado con documentación del proceso y lecciones aprendidas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: analisis-riesgo.md ===
# Análisis de Riesgo para el Flujo de Integración Continuo Multi-Equipo

## 1. Introducción
Este documento identifica los riesgos asociados a la implementación de un flujo de integración continuo en un entorno multi-equipo con un volumen de 10,000 transacciones por segundo y un SLA del 99.9%. El análisis cubre aspectos técnicos, organizacionales y de seguridad, alineándose con estándares como ISO 20022 y FAPI.

## 2. Riesgos Identificados

### 2.1 Riesgos Técnicos

#### 2.1.1 Fallo en la Integración de Sistemas
- **Descripción**: Incompatibilidad entre sistemas legacy y modernos durante la integración.
- **Impacto**: Retrasos en el despliegue y posibles fallos en producción.
- **Probabilidad**: Alta (3/5).
- **Mitigación**:
  - Validación temprana de contratos OpenAPI 3.1 (`openapi.yaml`) utilizando `@redocly/cli@1.12.0`.
  - Pruebas de integración automatizadas en el pipeline CI/CD de GitLab.
  - Uso de adaptadores intermedios para sistemas legacy.

#### 2.1.2 Sobrecarga del Pipeline CI/CD
- **Descripción**: El pipeline CI/CD no soporta el volumen de transacciones esperado (10,000 TPS).
- **Impacto**: Degradación del rendimiento y violación del SLA del 99.9%.
- **Probabilidad**: Media (2/5).
- **Mitigación**:
  - Escalado horizontal de runners de GitLab CI/CD.
  - Monitoreo en tiempo real con Prometheus y Grafana para detectar cuellos de botella.
  - Optimización de etapas del pipeline (ej. pruebas unitarias en paralelo).

#### 2.1.3 Pérdida de Trazabilidad
- **Descripción**: Falta de visibilidad en el flujo de integración debido a múltiples equipos distribuidos.
- **Impacto**: Dificultad para auditar transacciones y cumplir con requisitos de trazabilidad de 5 años.
- **Probabilidad**: Alta (4/5).
- **Mitigación**:
  - Implementación de logs estructurados con identificadores únicos para cada transacción.
  - Uso de herramientas como ELK Stack para centralizar logs y métricas.
  - Integración de etiquetas (`x-trace-id`) en los contratos OpenAPI para correlacionar requests.

### 2.2 Riesgos Organizacionales

#### 2.2.1 Falta de Comunicación entre Equipos
- **Descripción**: Equipos distribuidos (Dev, SecOps, QA) trabajan en silos sin alineación.
- **Impacto**: Retrasos en la entrega y conflictos en las integraciones.
- **Probabilidad**: Alta (4/5).
- **Mitigación**:
  - Reuniones semanales de sincronización con actores específicos (`proceso.bpmn.md`).
  - Documentación clara de responsabilidades en `documentacion/mapa-interacciones.md`.
  - Uso de herramientas colaborativas como Slack o Microsoft Teams con integración a GitLab.

#### 2.2.2 Resistencia al Cambio
- **Descripción**: Equipos acostumbrados a flujos tradicionales se resisten a adoptar DevOps.
- **Impacto**: Baja adopción de prácticas DevOps y fallos en la implementación.
- **Probabilidad**: Media (3/5).
- **Mitigación**:
  - Capacitación en herramientas DevOps (GitLab CI/CD, Prometheus, OWASP ZAP).
  - Involucrar a los equipos en la definición del flujo (`documentacion/propuesta-flujo-ci.md`).
  - Demostrar beneficios tangibles (ej. reducción de tiempos de despliegue).

### 2.3 Riesgos de Seguridad

#### 2.3.1 Vulnerabilidades en APIs
- **Descripción**: Exposición de APIs sin validación adecuada de seguridad.
- **Impacto**: Posibles brechas de seguridad y violación de estándares FAPI.
- **Probabilidad**: Alta (4/5).
- **Mitigación**:
  - Escaneo automatizado de vulnerabilidades con OWASP ZAP en el pipeline CI/CD.
  - Validación de tokens y permisos en `seguridad/security-config.md`.
  - Uso de OAuth 2.0 y OpenID Connect para autenticación (`seguridad/token-utils.md`).

#### 2.3.2 Falta de Segregación de Roles
- **Descripción**: Permisos excesivos en herramientas como GitLab o Prometheus.
- **Impacto**: Acceso no autorizado a recursos críticos.
- **Probabilidad**: Media (2/5).
- **Mitigación**:
  - Implementación de RBAC (Role-Based Access Control) en GitLab.
  - Revisión periódica de permisos y acceso.
  - Documentación clara de roles en `documentacion/mapa-interacciones.md`.

## 3. Matriz de Riesgos
| Riesgo                          | Probabilidad | Impacto | Mitigación Prioritaria                     |
|---------------------------------|--------------|---------|--------------------------------------------|
| Fallo en la Integración         | Alta         | Alto    | Validación temprana de contratos OpenAPI   |
| Sobrecarga del Pipeline         | Media        | Alto    | Escalado horizontal y monitoreo            |
| Pérdida de Trazabilidad         | Alta         | Alto    | Logs estructurados y correlación de IDs    |
| Falta de Comunicación           | Alta         | Alto    | Reuniones de sincronización y documentación|
| Resistencia al Cambio           | Media        | Medio   | Capacitación y demostración de beneficios  |
| Vulnerabilidades en APIs        | Alta         | Alto    | Escaneo automatizado con OWASP ZAP         |
| Falta de Segregación de Roles   | Media        | Alto    | RBAC y revisión periódica de permisos      |

## 4. Recomendaciones
- **Automatización**: Priorizar la automatización de pruebas, despliegues y monitoreo para reducir errores humanos.
- **Monitoreo Continuo**: Implementar dashboards en Grafana para visualizar métricas clave (ej. tiempo de despliegue, tasa de errores).
- **Documentación**: Mantener actualizados los documentos `openapi.yaml`, `proceso.bpmn.md` y `mapeo-de-datos.csv` para reflejar cambios en el flujo.
- **Cultura DevOps**: Fomentar la colaboración entre equipos mediante herramientas y procesos definidos en `documentacion/propuesta-flujo-ci.md`.

## 5. Conclusión
La implementación de un flujo de integración continuo en un entorno multi-equipo presenta desafíos técnicos, organizacionales y de seguridad. Sin embargo, con las mitigaciones propuestas, es posible alcanzar los objetivos de rendimiento (10,000 TPS), disponibilidad (99.9% SLA) y trazabilidad (5 años). La clave es la colaboración entre equipos y la adopción de prácticas DevOps alineadas con estándares como ISO 20022 y FAPI.

---

// === ARCHIVO: criteriios-aceptacion.feature ===
# language: es
@integracion-continua
Feature: Validación del flujo de integración continuo multi-equipo
  Como Analista SOA senior
  Quiero asegurar que el flujo de integración continuo funcione correctamente
  Para garantizar la entrega continua y la colaboración entre equipos

  Background:
    Given El sistema tiene un volumen de 10000 transacciones por segundo
    And El SLA requiere un 99.9% de disponibilidad
    And Los equipos de Dev, SecOps y QA están distribuidos

  Scenario: Integración exitosa de cambios en el pipeline CI/CD
    Given Un desarrollador sube un cambio al repositorio
    And El pipeline CI/CD está configurado según `documentacion/propuesta-flujo-ci.md`
    When El pipeline se ejecuta automáticamente
    Then El cambio se valida con pruebas unitarias
    And El contrato OpenAPI (`openapi.yaml`) se valida con @redocly/cli@1.12.0
    And El mapeo de datos (`mapeo-de-datos.csv`) se verifica
    And El cambio se despliega en un entorno de staging
    And El entorno de staging pasa pruebas de integración
    And El cambio se promueve a producción sin errores

  Scenario: Fallo en la validación del contrato OpenAPI
    Given Un desarrollador sube un cambio que rompe el contrato OpenAPI
    When El pipeline se ejecuta
    Then La validación con @redocly/cli falla
    And El pipeline se detiene en la etapa de validación
    And Se notifica al equipo de desarrollo con el error específico
    And El cambio no se despliega en staging

  Scenario: Sobrecarga del pipeline CI/CD
    Given El pipeline CI/CD está procesando 10000 transacciones por segundo
    And Los runners de GitLab están configurados con recursos limitados
    When El pipeline se ejecuta
    Then El tiempo de ejecución supera el umbral definido en Prometheus
    And Se activa una alerta en Grafana
    And El pipeline escala automáticamente los runners
    And El tiempo de ejecución vuelve a niveles aceptables

  Scenario: Falta de trazabilidad en una transacción
    Given Una transacción se procesa en el sistema
    And No se genera un identificador único para la transacción
    When Se intenta auditar la transacción
    Then No se encuentra el registro en los logs estructurados
    And Se activa una alerta en Grafana por falta de trazabilidad
    And El equipo de operaciones investiga el incidente
    And Se implementa una corrección para generar identificadores únicos

  Scenario: Vulnerabilidad en una API detectada por OWASP ZAP
    Given Un cambio en el contrato OpenAPI introduce una vulnerabilidad
    When El pipeline ejecuta el escaneo de seguridad con OWASP ZAP
    Then OWASP ZAP detecta la vulnerabilidad
    And El pipeline se detiene y marca el cambio como fallido
    And Se notifica al equipo de SecOps con los detalles de la vulnerabilidad
    And El cambio no se despliega en staging

  Scenario: Resistencia al cambio en la adopción de DevOps
    Given Un equipo se resiste a adoptar el nuevo flujo de integración continuo
    When Se propone una reunión de capacitación
    Then El equipo participa en la reunión
    And Se demuestran los beneficios del flujo (ej. reducción de tiempos de despliegue)
    And El equipo acepta adoptar el nuevo flujo
    And Se documentan las lecciones aprendidas en `documentacion/lecciones-aprendidas.md`

  Scenario: Falta de segregación de roles en GitLab
    Given Un miembro del equipo tiene permisos excesivos en GitLab
    When Se realiza una revisión periódica de permisos
    Then Se detecta el acceso no autorizado
    And Se ajusta el rol del miembro según RBAC
    And Se documenta el cambio en `documentacion/mapa-interacciones.md`
    And Se notifica al equipo de SecOps

---

// === ARCHIVO: seguridad/security-config.md ===
# Configuración de Seguridad para el Flujo de Integración Continuo

## 1. Introducción
Este documento define la configuración de seguridad para el flujo de integración continuo multi-equipo, alineada con estándares como ISO 20022, FAPI y OWASP. La configuración cubre autenticación, autorización, cifrado y protección contra vulnerabilidades.

## 2. Autenticación y Autorización

### 2.1 Autenticación con OAuth 2.0 y OpenID Connect
- **Protocolo**: OAuth 2.0 con OpenID Connect.
- **Flujo**: Authorization Code Flow con PKCE para aplicaciones públicas.
- **Alcance**: `openid`, `profile`, `email`, `api:read`, `api:write`.
- **Endpoints**:
  - **Authorization**: `https://auth.example.com/oauth2/authorize`
  - **Token**: `https://auth.example.com/oauth2/token`
  - **UserInfo**: `https://auth.example.com/oauth2/userinfo`
  - **JWKS**: `https://auth.example.com/.well-known/jwks.json`
- **Configuración**:
  - Token de acceso: JWT firmado con RSA256.
  - Tiempo de vida del token: 1 hora.
  - Tiempo de vida del refresh token: 24 horas.
  - Validación de tokens: `seguridad/token-utils.md`.

### 2.2 Autorización con RBAC
- **Roles**:
  - `developer`: Acceso a repositorios y pipelines de GitLab.
  - `secops`: Acceso a herramientas de seguridad (OWASP ZAP, Prometheus).
  - `qa`: Acceso a entornos de staging y pruebas.
  - `admin`: Acceso completo a todas las herramientas y configuraciones.
- **Políticas**:
  - Los desarrolladores solo pueden aprobar MRs en repositorios asignados.
  - SecOps puede bloquear pipelines en caso de vulnerabilidades críticas.
  - QA puede desplegar en staging pero no en producción.
  - Admins pueden ajustar permisos y configuraciones globales.
- **Mapeo de roles**: Documentado en `documentacion/mapa-interacciones.md`.

## 3. Protección de APIs

### 3.1 Validación de Contratos OpenAPI
- **Herramienta**: `@redocly/cli@1.12.0`.
- **Validaciones**:
  - Sintaxis y semántica del contrato (`openapi.yaml`).
  - Cumplimiento con OpenAPI 3.1.
  - Validación de esquemas y ejemplos.
- **Pipeline**: Ejecutar en la etapa de validación del pipeline CI/CD.

### 3.2 Escaneo de Vulnerabilidades
- **Herramienta**: OWASP ZAP.
- **Alcance**:
  - APIs definidas en `openapi.yaml`.
  - Endpoints expuestos en staging y producción.
- **Frecuencia**:
  - Escaneo automático en cada despliegue a staging.
  - Escaneo completo semanal en producción.
- **Umbrales**:
  - Vulnerabilidades críticas: Bloquear el pipeline.
  - Vulnerabilidades altas: Notificar a SecOps.
  - Vulnerabilidades medias/bajas: Documentar y planificar corrección.

### 3.3 Protección contra Ataques Comunes
- **Rate Limiting**:
  - Límite: 1000 requests por minuto por IP.
  - Herramienta: GitLab API Gateway o Nginx.
- **CORS**:
  - Orígenes permitidos: `https://*.example.com`.
  - Métodos permitidos: `GET`, `POST`, `PUT`, `DELETE`, `OPTIONS`.
  - Headers permitidos: `Authorization`, `Content-Type`, `X-Trace-Id`.
- **CSRF**:
  - Protección habilitada para endpoints de modificación (POST, PUT, DELETE).
  - Token CSRF en headers (`X-CSRF-Token`).
- **SQL Injection**:
  - Uso de ORM (ej. Hibernate, Sequelize) para evitar consultas SQL directas.
  - Validación de parámetros en `mapeo-de-datos.csv`.

## 4. Cifrado

### 4.1 Cifrado en Tránsito
- **Protocolo**: TLS 1.3.
- **Certificados**: Let's Encrypt o certificados internos con CA privada.
- **Configuración**:
  - Cipher suites: `TLS_AES_256_GCM_SHA384`, `TLS_CHACHA20_POLY1305_SHA256`.
  - HSTS: `Strict-Transport-Security: max-age=31536000; includeSubDomains; preload`.
  - OCSP Stapling: Habilitado.

### 4.2 Cifrado en Reposo
- **Herramientas**: AWS KMS, HashiCorp Vault o Azure Key Vault.
- **Alcance**:
  - Secretos de GitLab CI/CD.
  - Credenciales de bases de datos.
  - Llaves privadas de certificados.
- **Política de Rotación**:
  - Secretos: Cada 90 días.
  - Llaves de cifrado: Cada 1 año.

## 5. Observabilidad y Trazabilidad

### 5.1 Logs Estructurados
- **Formato**: JSON.
- **Campos obligatorios**:
  - `timestamp`: Fecha y hora en formato ISO 8601.
  - `level`: `DEBUG`, `INFO`, `WARN`, `ERROR`.
  - `service`: Nombre del servicio (ej. `gitlab-ci`, `prometheus`).
  - `traceId`: Identificador único de la transacción.
  - `spanId`: Identificador de la operación dentro de la transacción.
  - `userId`: Identificador del usuario (si aplica).
  - `message`: Mensaje descriptivo.
- **Ejemplo**:
  ```json
  {
    "timestamp": "2023-10-01T12:00:00Z",
    "level": "INFO",
    "service": "gitlab-ci",
    "traceId": "abc123",
    "spanId": "def456",
    "userId": "dev1",
    "message": "Pipeline iniciado para el repositorio X"
  }
  ```
- **Retención**: 5 años (cumplimiento con requisitos de trazabilidad).

### 5.2 Métricas con Prometheus y Grafana
- **Métricas**:
  - `pipeline_duration_seconds`: Tiempo de ejecución del pipeline.
  - `deployment_frequency`: Frecuencia de despliegues a producción.
  - `lead_time_for_changes`: Tiempo desde el commit hasta el despliegue.
  - `change_failure_rate`: Porcentaje de despliegues fallidos.
  - `mean_time_to_recovery`: Tiempo medio de recuperación ante fallos.
- **Dashboards**:
  - Dashboard de DevOps para métricas de pipeline.
  - Dashboard de Seguridad para vulnerabilidades detectadas por OWASP ZAP.
  - Dashboard de Rendimiento para monitorear SLA del 99.9%.

### 5.3 Alertas
- **Herramienta**: Prometheus + Alertmanager.
- **Reglas**:
  - `pipeline_failed`: Pipeline fallido.
  - `high_error_rate`: Tasa de errores superior al 1%.
  - `slow_pipeline`: Tiempo de ejecución superior a 30 minutos.
  - `security_vulnerability`: Vulnerabilidad crítica detectada por OWASP ZAP.
- **Destinatarios**:
  - `pipeline_failed`: Equipo de Dev.
  - `high_error_rate`: Equipo de QA.
  - `slow_pipeline`: Equipo de Ops.
  - `security_vulnerability`: Equipo de SecOps.

## 6. Seguridad en el Pipeline CI/CD

### 6.1 Etapas de Seguridad en GitLab CI/CD
- **Validación de Contratos**:
  - Herramienta: `@redocly/cli`.
  - Comando: `npx --yes @redocly/cli lint openapi.yaml`.
- **Escaneo de Vulnerabilidades**:
  - Herramienta: OWASP ZAP.
  - Comando: `zap-baseline.py -t https://staging.example.com`.
- **Análisis Estático**:
  - Herramienta: SonarQube o GitLab SAST.
  - Alcance: Código fuente y configuraciones.
- **Pruebas de Penetración**:
  - Herramienta: OWASP ZAP o Burp Suite.
  - Frecuencia: Mensual en producción.

### 6.2 Secretos en el Pipeline
- **Herramienta**: GitLab CI/CD Variables con cifrado.
- **Buenas Prácticas**:
  - Nunca hardcodear secretos en el código.
  - Usar variables de entorno cifradas.
  - Rotar secretos cada 90 días.

## 7. Cumplimiento con Estándares

### 7.1 ISO 20022
- **Requisitos**:
  - Mensajes financieros en formato ISO 20022.
  - Validación de esquemas XML.
  - Trazabilidad de transacciones.
- **Implementación**:
  - Validación en `mapeo-de-datos.csv`.
  - Logs estructurados con `traceId`.

### 7.2 FAPI (Financial-grade API)
- **Requisitos**:
  - Autenticación con OAuth 2.0 y OpenID Connect.
  - Uso de JWT firmados con RSA256.
  - Protección contra ataques CSRF y replay.
- **Implementación**:
  - Configuración en `seguridad/security-config.md`.
  - Validación de tokens en `seguridad/token-utils.md`.

### 7.3 OWASP
- **Requisitos**:
  - Protección contra las 10 vulnerabilidades principales de OWASP.
  - Escaneo automatizado con OWASP ZAP.
- **Implementación**:
  - Escaneo en el pipeline CI/CD.
  - Mitigación documentada en `analisis-riesgo.md`.

## 8. Revisión y Mantenimiento
- **Frecuencia**:
  - Revisión trimestral de configuraciones de seguridad.
  - Rotación de secretos cada 90 días.
  - Actualización de herramientas cada 6 meses.
- **Responsables**:
  - SecOps: Configuraciones de seguridad.
  - DevOps: Pipeline CI/CD.
  - Admins: Permisos y acceso.

## 9. Referencias
- [OpenAPI 3.1 Specification](https://spec.openapis.org/oas/v3.1.0)
- [OWASP ZAP Documentation](https://www.zaproxy.org/docs/)
- [Prometheus Documentation](https://prometheus.io/docs/)
- [FAPI Specification](https://openid.net/wg/fapi/)
- [ISO 20022](https://www.iso20022.org/)
- [GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)

---

// === ARCHIVO: seguridad/token-utils.md ===
# Utilidades para la Gestión de Tokens en el Flujo de Integración Continuo

## 1. Introducción
Este documento describe las utilidades para la generación, validación y manejo de tokens JWT en el flujo de integración continuo multi-equipo. Los tokens se utilizan para autenticación y autorización en APIs, herramientas CI/CD y sistemas de monitoreo.

## 2. Generación de Tokens JWT

### 2.1 Estructura del JWT
- **Header**:
  ```json
  {
    "alg": "RS256",
    "typ": "JWT",
    "kid": "key-id-1"
  }
  ```
- **Payload**:
  ```json
  {
    "iss": "https://auth.example.com",
    "sub": "user-id-123",
    "aud": "api.example.com",
    "exp": 1735689600,
    "iat": 1735603200,
    "scope": "api:read api:write",
    "jti": "token-id-abc123"
  }
  ```
- **Firma**: RSA256 con clave privada.

### 2.2 Librerías para Generación
- **Node.js**:
  ```javascript
  const jwt = require('jsonwebtoken');
  const fs = require('fs');

  const privateKey = fs.readFileSync('private.key');
  const token = jwt.sign(
    {
      sub: 'user-id-123',
      scope: 'api:read api:write',
    },
    privateKey,
    {
      algorithm: 'RS256',
      expiresIn: '1h',
      issuer: 'https://auth.example.com',
      audience: 'api.example.com',
      keyid: 'key-id-1',
    }
  );
  console.log(token);
  ```
- **Python**:
  ```python
  import jwt
  import time

  private_key = open('private.key').read()
  token = jwt.encode(
      {
          'sub': 'user-id-123',
          'scope': 'api:read api:write',
          'iss': 'https://auth.example.com',
          'aud': 'api.example.com',
          'exp': int(time.time()) + 3600,
          'iat': int(time.time()),
      },
      private_key,
      algorithm='RS256',
      headers={'kid': 'key-id-1'}
  )
  print(token)
  ```

## 3. Validación de Tokens JWT

### 3.1 Validación en APIs
- **Node.js (Express)**:
  ```javascript
  const jwt = require('jsonwebtoken');
  const fs = require('fs');

  const publicKey = fs.readFileSync('public.key');

  function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) return res.sendStatus(401);

    jwt.verify(token, publicKey, { algorithms: ['RS256'] }, (err, user) => {
      if (err) return res.sendStatus(403);
      req.user = user;
      next();
    });
  }
  ```
- **Python (FastAPI)**:
  ```python
  from fastapi import Depends, HTTPException, status
  from fastapi.security import OAuth2AuthorizationCodeBearer
  import jwt

  oauth2_scheme = OAuth2AuthorizationCodeBearer(tokenUrl='token')
  public_key = open('public.key').read()

  async def get_current_user(token: str = Depends(oauth2_scheme)):
      try:
          payload = jwt.decode(
              token,
              public_key,
              algorithms=['RS256'],
              audience='api.example.com',
              issuer='https://auth.example.com'
          )
          return payload
      except jwt.ExpiredSignatureError:
          raise HTTPException(
              status_code=status.HTTP_401_UNAUTHORIZED,
              detail='Token expirado'
          )
      except jwt.InvalidTokenError:
          raise HTTPException(
              status_code=status.HTTP_401_UNAUTHORIZED,
              detail='Token inválido'
          )
  ```

### 3.2 Validación en Herramientas CI/CD
- **GitLab CI/CD**:
  ```yaml
  validate_token:
    stage: security
    script:
      - |
        PUBLIC_KEY=$(cat public.key)
        TOKEN=$CI_JOB_TOKEN
        echo "Validando token..."
        node -e "
          const jwt = require('jsonwebtoken');
          const token = '$TOKEN';
          const publicKey = '$PUBLIC_KEY';
          try {
            const decoded = jwt.verify(token, publicKey, { algorithms: ['RS256'] });
            console.log('Token válido:', decoded);
          } catch (err) {
            console.error('Token inválido:', err.message);
            process.exit(1);
          }
        "
    only:
      - merge_requests
  ```

## 4. Manejo de Claves

### 4.1 Generación de Claves RSA
- **Comando**:
  ```bash
  openssl genpkey -algorithm RSA -out private.key -pkeyopt rsa_keygen_bits:2048
  openssl rsa -pubout -in private.key -out public.key
  ```
- **Formato**: PEM.

### 4.2 Rotación de Claves
- **Frecuencia**: Cada 1 año.
- **Proceso**:
  1. Generar un nuevo par de claves RSA.
  2. Actualizar el endpoint JWKS (`/.well-known/jwks.json`).
  3. Actualizar las configuraciones de validación en APIs y herramientas.
  4. Mantener la clave antigua durante 24 horas para tokens en tránsito.

### 4.3 JWKS (JSON Web Key Set)
- **Endpoint**: `https://auth.example.com/.well-known/jwks.json`.
- **Ejemplo**:
  ```json
  {
    "keys": [
      {
        "kty": "RSA",
        "use": "sig",
        "kid": "key-id-1",
        "alg": "RS256",
        "n": "modulus-base64",
        "e": "AQAB"
      }
    ]
  }
  ```

## 5. Integración con OpenAPI

### 5.1 Esquema de Seguridad en OpenAPI
- **Definición**:
  ```yaml
  components:
    securitySchemes:
      OAuth2:
        type: oauth2
        flows:
          authorizationCode:
            authorizationUrl: https://auth.example.com/oauth2/authorize
            tokenUrl: https://auth.example.com/oauth2/token
            scopes:
              api:read: Acceso de lectura a la API
              api:write: Acceso de escritura a la API
  ```
- **Aplicación Global**:
  ```yaml
  security:
    - OAuth2:
        - api:read
        - api:write
  ```

### 5.2 Validación de Tokens en OpenAPI
- **Ejemplo de Endpoint con Validación**:
  ```yaml
  paths:
    /transactions:
      get:
        summary: Obtener transacciones
        security:
          - OAuth2:
              - api:read
        responses:
          '200':
            description: Lista de transacciones
            content:
              application/json:
                schema:
                  type: array
                  items:
                    $ref: '#/components/schemas/Transaction'
          '401':
            description: Token no proporcionado o inválido
          '403':
            description: Token sin los scopes requeridos
  ```

## 6. Manejo de Errores

### 6.1 Códigos de Error
| Código | Descripción                          | Acción del Cliente                     |
|--------|---------------------------------------|----------------------------------------|
| 401    | Token no proporcionado o inválido    | Autenticarse nuevamente                |
| 403    | Token sin permisos suficientes        | Solicitar scopes adicionales           |
| 429    | Límites de tasa excedidos             | Esperar y reintentar                   |
| 500    | Error interno del servidor            | Notificar al equipo de operaciones     |

### 6.2 Ejemplo de Respuesta de Error
```json
{
  "error": "invalid_token",
  "error_description": "El token ha expirado",
  "error_uri": "https://auth.example.com/errors/invalid_token"
}
```

## 7. Buenas Prácticas

### 7.1 Almacenamiento de Tokens
- **Nunca almacenar tokens en el código fuente**.
- **Usar variables de entorno o secret managers** (AWS KMS, HashiCorp Vault).
- **Rotar tokens periódicamente** (cada 90 días).

### 7.2 Transmisión de Tokens
- **Usar HTTPS** para todas las solicitudes.
- **Incluir tokens en el header `Authorization`**:
  ```
  Authorization: Bearer <token>
  ```

### 7.3 Validación de Scopes
- **Verificar scopes en el payload del token**:
  ```javascript
  if (!user.scope.includes('api:write')) {
    return res.sendStatus(403);
  }
  ```

## 8. Integración con Herramientas de Seguridad

### 8.1 OWASP ZAP
- **Configuración**:
  - Escanear endpoints protegidos con tokens válidos.
  - Excluir endpoints de autenticación del escaneo de fuerza bruta.
- **Ejemplo de Comando**:
  ```bash
  zap-baseline.py -t https://api.example.com -a -I -j -c config.conf
  ```

### 8.2 Prometheus y Grafana
- **Métricas**:
  - `auth_success_total`: Número de autenticaciones exitosas.
  - `auth_failure_total`: Número de autenticaciones fallidas.
  - `token_expiry_total`: Número de tokens expirados.
- **Dashboards**:
  - Dashboard de Autenticación para monitorear éxitos/fallos.
  - Dashboard de Seguridad para alertas de tokens inválidos.

## 9. Ejemplos de Uso

### 9.1 Autenticación en una API
- **Request**:
  ```http
  GET /transactions HTTP/1.1
  Host: api.example.com
  Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6I...
  ```
- **Response (Éxito)**:
  ```json
  [
    {
      "id": "txn-123",
      "amount": 100.00,
      "currency": "USD",
      "status": "completed"
    }
  ]
  ```
- **Response (Error)**:
  ```json
  {
    "error": "invalid_token",
    "error_description": "El token ha expirado"
  }
  ```

### 9.2 Autenticación en GitLab CI/CD
- **Ejemplo de Pipeline**:
  ```yaml
  stages:
    - build
    - test
    - security
    - deploy

  build_job:
    stage: build
    script:
      - echo "Construyendo la aplicación..."
    only:
      - merge_requests

  test_job:
    stage: test
    script:
      - echo "Ejecutando pruebas..."
    only:
      - merge_requests

  security_job:
    stage: security
    script:
      - echo "Validando token..."
      - node validate-token.js $CI_JOB_TOKEN
    only:
      - merge_requests

  deploy_job:
    stage: deploy
    script:
      - echo "Desplegando a staging..."
    only:
      - main
  ```

## 10. Referencias
- [JWT.IO](https://jwt.io/)
- [RFC 7519 - JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519)
- [OpenID Connect Core 1.0](https://openid.net/specs/openid-connect-core-1_0.html)
- [OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
- [OWASP JWT Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/JSON_Web_Token_Cheat_Sheet_for_Java.html)


// === ARCHIVO: openapi.yaml ===
openapi: 3.1.0
info:
  title: Integración Continua Multi-Equipo - API de Orquestación
  description: |
    API para orquestar el flujo de integración entre equipos de desarrollo, operaciones y seguridad.
    Incluye endpoints para manejo de pipelines, validación de seguridad, métricas de observabilidad
    y trazabilidad de transacciones.
  version: 1.0.0
  contact:
    name: Equipo de Integración SOA
    email: integracion@empresa.com
  license:
    name: Propietario
    url: https://empresa.com/licencias
servers:
  - url: https://api.integracion.empresa.com/v1
    description: Producción
  - url: https://sandbox.api.integracion.empresa.com/v1
    description: Sandbox
paths:
  /pipelines:
    post:
      tags: [Pipeline]
      summary: Iniciar un nuevo pipeline de integración
      description: |
        Inicia un pipeline CI/CD para un conjunto de cambios, validando requisitos de seguridad,
        calidad y trazabilidad antes de proceder.
      operationId: iniciarPipeline
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/PipelineRequest"
            examples:
              ejemploPipeline:
                value:
                  idCambio: "chg-12345"
                  equipo: "desarrollo"
                  repositorio: "https://git.empresa.com/proyecto-core"
                  rama: "feature/nueva-funcionalidad"
                  commit: "a1b2c3d4e5f6"
                  dependencias:
                    - "servicio-autenticacion"
                    - "servicio-pagos"
      responses:
        "201":
          description: Pipeline iniciado exitosamente
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PipelineResponse"
              examples:
                exito:
                  value:
                    idPipeline: "pipeline-67890"
                    estado: "en-progreso"
                    etapas:
                      - nombre: "validacion-seguridad"
                        estado: "pendiente"
                      - nombre: "compilacion"
                        estado: "pendiente"
        "400":
          description: Solicitud inválida
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"
              examples:
                errorValidacion:
                  value:
                    codigo: "VALIDACION_FALLIDA"
                    mensaje: "El repositorio no cumple con las políticas de seguridad"
                    detalles:
                      - campo: "repositorio"
                        error: "No se encontró el archivo SECURITY.md"
        "403":
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"
              examples:
                errorAutenticacion:
                  value:
                    codigo: "NO_AUTORIZADO"
                    mensaje: "El token JWT no tiene permisos para iniciar pipelines"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"
              examples:
                errorInterno:
                  value:
                    codigo: "ERROR_INTERNO"
                    mensaje: "Fallo al iniciar el pipeline"
                    detalles:
                      - "Error de conexión con GitLab CI"
    get:
      tags: [Pipeline]
      summary: Listar pipelines recientes
      description: |
        Devuelve una lista de pipelines iniciados en las últimas 24 horas, con filtros opcionales
        por equipo, estado o repositorio.
      operationId: listarPipelines
      parameters:
        - name: equipo
          in: query
          description: Filtrar por equipo (desarrollo, operaciones, seguridad)
          required: false
          schema:
            type: string
            enum: ["desarrollo", "operaciones", "seguridad"]
        - name: estado
          in: query
          description: Filtrar por estado del pipeline
          required: false
          schema:
            type: string
            enum: ["pendiente", "en-progreso", "exitoso", "fallido"]
        - name: repositorio
          in: query
          description: Filtrar por URL del repositorio
          required: false
          schema:
            type: string
      responses:
        "200":
          description: Lista de pipelines
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: "#/components/schemas/PipelineResponse"
              examples:
                listaPipelines:
                  value:
                    - idPipeline: "pipeline-67890"
                      idCambio: "chg-12345"
                      equipo: "desarrollo"
                      repositorio: "https://git.empresa.com/proyecto-core"
                      estado: "en-progreso"
                      etapas:
                        - nombre: "validacion-seguridad"
                          estado: "completado"
                        - nombre: "compilacion"
                          estado: "en-progreso"
                    - idPipeline: "pipeline-67891"
                      idCambio: "chg-12346"
                      equipo: "operaciones"
                      repositorio: "https://git.empresa.com/infra-estructura"
                      estado: "fallido"
                      etapas:
                        - nombre: "validacion-seguridad"
                          estado: "completado"
                        - nombre: "despliegue"
                          estado: "fallido"
        "400":
          description: Parámetros de consulta inválidos
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"

  /pipelines/{idPipeline}:
    get:
      tags: [Pipeline]
      summary: Obtener detalles de un pipeline
      description: |
        Devuelve el estado detallado de un pipeline específico, incluyendo métricas de tiempo
        de ejecución y logs de cada etapa.
      operationId: obtenerPipeline
      parameters:
        - name: idPipeline
          in: path
          description: ID del pipeline
          required: true
          schema:
            type: string
            pattern: "^pipeline-[0-9]{5}$"
      responses:
        "200":
          description: Detalles del pipeline
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PipelineDetalleResponse"
              examples:
                detallePipeline:
                  value:
                    idPipeline: "pipeline-67890"
                    idCambio: "chg-12345"
                    equipo: "desarrollo"
                    repositorio: "https://git.empresa.com/proyecto-core"
                    estado: "en-progreso"
                    etapas:
                      - nombre: "validacion-seguridad"
                        estado: "completado"
                        tiempoEjecucion: 120
                        logs:
                          - "Iniciando validación de seguridad"
                          - "Verificando políticas de branch"
                          - "Validación completada exitosamente"
                      - nombre: "compilacion"
                        estado: "en-progreso"
                        tiempoEjecucion: 45
                        logs:
                          - "Iniciando compilación"
                          - "Ejecutando pruebas unitarias"
                    x-devops:
                      observabilidad:
                        metricas:
                          - nombre: "pipeline_tiempo_ejecucion"
                            tipo: "histograma"
                            etiquetas: ["equipo", "repositorio"]
                          - nombre: "pipeline_fallos"
                            tipo: "contador"
                            etiquetas: ["equipo", "etapa"]                      ci_cd:
                        etapas:
                          - nombre: "validacion-seguridad"
                            herramienta: "OWASP ZAP"
                            paso: "validar-seguridad"
                          - nombre: "compilacion"
                            herramienta: "GitLab CI"
                            paso: "compilar"
                          - nombre: "despliegue"
                            herramienta: "GitLab CI"
                            paso: "desplegar"
        "404":
          description: Pipeline no encontrado
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"
              examples:
                noEncontrado:
                  value:
                    codigo: "PIPELINE_NO_ENCONTRADO"
                    mensaje: "El pipeline con ID pipeline-67890 no existe"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"

  /transacciones/{idTransaccion}/trazabilidad:
    get:
      tags: [Trazabilidad]
      summary: Obtener trazabilidad de una transacción
      description: |
        Devuelve el historial completo de una transacción, incluyendo todos los sistemas
        y equipos involucrados en su procesamiento.
      operationId: obtenerTrazabilidadTransaccion
      parameters:
        - name: idTransaccion
          in: path
          description: ID de la transacción
          required: true
          schema:
            type: string
            pattern: "^tx-[0-9]{10}$"
      responses:
        "200":
          description: Trazabilidad de la transacción
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/TrazabilidadResponse"
              examples:
                trazabilidad:
                  value:
                    idTransaccion: "tx-1234567890"
                    origen:
                      sistema: "servicio-pagos"
                      equipo: "desarrollo"
                      timestamp: "2023-11-15T10:00:00Z"
                    eventos:
                      - sistema: "servicio-autenticacion"
                        equipo: "seguridad"
                        accion: "validar-token"
                        timestamp: "2023-11-15T10:00:01Z"
                        detalle: "Token JWT validado exitosamente"
                      - sistema: "servicio-pagos"
                        equipo: "desarrollo"
                        accion: "procesar-pago"
                        timestamp: "2023-11-15T10:00:05Z"
                        detalle: "Pago procesado por $150.00"
                      - sistema: "sistema-riesgos"
                        equipo: "operaciones"
                        accion: "evaluar-riesgo"
                        timestamp: "2023-11-15T10:00:10Z"
                        detalle: "Riesgo aprobado"
                    destino:
                      sistema: "base-datos-transacciones"
                      equipo: "operaciones"
                      timestamp: "2023-11-15T10:00:15Z"
        "404":
          description: Transacción no encontrada
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"
              examples:
                noEncontrada:
                  value:
                    codigo: "TRANSACCION_NO_ENCONTRADA"
                    mensaje: "La transacción con ID tx-1234567890 no existe"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/ErrorResponse"

components:
  schemas:
    PipelineRequest:
      type: object
      required:
        - idCambio
        - equipo
        - repositorio
        - rama
        - commit
      properties:
        idCambio:
          type: string
          description: ID del cambio en el sistema de gestión de cambios
          pattern: "^chg-[0-9]{5}$"
          example: "chg-12345"
        equipo:
          type: string
          description: Equipo responsable del cambio
          enum: ["desarrollo", "operaciones", "seguridad"]
          example: "desarrollo"
        repositorio:
          type: string
          description: URL del repositorio Git
          format: uri
          example: "https://git.empresa.com/proyecto-core"
        rama:
          type: string
          description: Rama del repositorio
          example: "feature/nueva-funcionalidad"
        commit:
          type: string
          description: Hash del commit
          pattern: "^[a-f0-9]{12}$"
          example: "a1b2c3d4e5f6"
        dependencias:
          type: array
          description: Servicios o sistemas dependientes
          items:
            type: string
            example: "servicio-autenticacion"
    PipelineResponse:
      type: object
      required:
        - idPipeline
        - idCambio
        - equipo
        - repositorio
        - estado
        - etapas
      properties:
        idPipeline:
          type: string
          description: ID del pipeline generado
          pattern: "^pipeline-[0-9]{5}$"
          example: "pipeline-67890"
        idCambio:
          $ref: "#/components/schemas/PipelineRequest/properties/idCambio"
        equipo:
          $ref: "#/components/schemas/PipelineRequest/properties/equipo"
        repositorio:
          $ref: "#/components/schemas/PipelineRequest/properties/repositorio"
        estado:
          type: string
          description: Estado actual del pipeline
          enum: ["pendiente", "en-progreso", "exitoso", "fallido"]
          example: "en-progreso"
        etapas:
          type: array
          description: Lista de etapas del pipeline con su estado
          items:
            type: object
            required:
              - nombre
              - estado
            properties:
              nombre:
                type: string
                description: Nombre de la etapa
                example: "validacion-seguridad"
              estado:
                type: string
                description: Estado de la etapa
                enum: ["pendiente", "en-progreso", "completado", "fallido"]
                example: "completado"
    PipelineDetalleResponse:
      allOf:
        - $ref: "#/components/schemas/PipelineResponse"
        - type: object
          required:
            - etapas
          properties:
            etapas:
              type: array
              items:
                type: object
                required:
                  - nombre
                  - estado
                  - tiempoEjecucion
                  - logs
                properties:
                  nombre:
                    $ref: "#/components/schemas/PipelineResponse/properties/etapas/items/properties/nombre"
                  estado:
                    $ref: "#/components/schemas/PipelineResponse/properties/etapas/items/properties/estado"
                  tiempoEjecucion:
                    type: integer
                    description: Tiempo de ejecución en segundos
                    example: 120
                  logs:
                    type: array
                    description: Logs de la etapa
                    items:
                      type: string
                      example: "Iniciando validación de seguridad"
    TrazabilidadResponse:
      type: object
      required:
        - idTransaccion
        - origen
        - eventos
        - destino
      properties:
        idTransaccion:
          type: string
          description: ID de la transacción
          pattern: "^tx-[0-9]{10}$"
          example: "tx-1234567890"
        origen:
          type: object
          description: Sistema y equipo de origen
          required:
            - sistema
            - equipo
            - timestamp
          properties:
            sistema:
              type: string
              description: Nombre del sistema origen
              example: "servicio-pagos"
            equipo:
              type: string
              description: Equipo responsable del sistema origen
              enum: ["desarrollo", "operaciones", "seguridad"]
              example: "desarrollo"
            timestamp:
              type: string
              description: Fecha y hora del evento origen
              format: date-time
              example: "2023-11-15T10:00:00Z"
        eventos:
          type: array
          description: Lista de eventos en el procesamiento de la transacción
          items:
            type: object
            required:
              - sistema
              - equipo
              - accion
              - timestamp
              - detalle
            properties:
              sistema:
                type: string
                description: Nombre del sistema que procesó el evento
                example: "servicio-autenticacion"
              equipo:
                type: string
                description: Equipo responsable del sistema
                enum: ["desarrollo", "operaciones", "seguridad"]
                example: "seguridad"
              accion:
                type: string
                description: Acción realizada
                example: "validar-token"
              timestamp:
                type: string
                description: Fecha y hora del evento
                format: date-time
                example: "2023-11-15T10:00:01Z"
              detalle:
                type: string
                description: Detalle del evento
                example: "Token JWT validado exitosamente"
        destino:
          type: object
          description: Sistema y equipo de destino
          required:
            - sistema
            - equipo
            - timestamp
          properties:
            sistema:
              type: string
              description: Nombre del sistema destino
              example: "base-datos-transacciones"
            equipo:
              type: string
              description: Equipo responsable del sistema destino
              enum: ["desarrollo", "operaciones", "seguridad"]
              example: "operaciones"
            timestamp:
              type: string
              description: Fecha y hora del evento destino
              format: date-time
              example: "2023-11-15T10:00:15Z"
    ErrorResponse:
      type: object
      required:
        - codigo
        - mensaje
      properties:
        codigo:
          type: string
          description: Código de error
          example: "VALIDACION_FALLIDA"
        mensaje:
          type: string
          description: Mensaje descriptivo del error
          example: "El repositorio no cumple con las políticas de seguridad"
        detalles:
          type: array
          description: Detalles adicionales del error
          items:
            type: object
            properties:
              campo:
                type: string
                description: Campo asociado al error
                example: "repositorio"
              error:
                type: string
                description: Descripción del error
                example: "No se encontró el archivo SECURITY.md"

// === ARCHIVO: proceso.bpmn.md ===
# Proceso BPMN: Flujo de Integración Continua Multi-Equipo

```bpmn
<?xml version="1.0" encoding="UTF-8"?>
<bpmn:definitions xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL"
                 xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI"
                 xmlns:dc="http://www.omg.org/spec/DD/20100524/DC"
                 xmlns:di="http://www.omg.org/spec/DD/20100524/DI"
                 id="Definitions_1"
                 targetNamespace="http://bpmn.io/schema/bpmn">
  <bpmn:process id="Process_1" isExecutable="false">
    <bpmn:startEvent id="StartEvent_1" name="Inicio de cambio">
      <bpmn:outgoing>SequenceFlow_1</bpmn:outgoing>
    </bpmn:startEvent>
    
    <bpmn:task id="Task_1" name="Crear solicitud de cambio">
      <bpmn:incoming>SequenceFlow_1</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_2</bpmn:outgoing>
      <bpmn:documentation>Equipo de desarrollo crea una solicitud de cambio en el sistema de gestión.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:task id="Task_2" name="Validar requisitos de seguridad">
      <bpmn:incoming>SequenceFlow_2</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_3</bpmn:outgoing>
      <bpmn:documentation>Equipo de seguridad valida que el cambio cumple con políticas de seguridad (OWASP ZAP).</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:exclusiveGateway id="Gateway_1" name="¿Validación exitosa?">
      <bpmn:incoming>SequenceFlow_3</bpmn:incoming>
    </bpmn:exclusiveGateway>
    
    <bpmn:sequenceFlow id="SequenceFlow_3" sourceRef="Task_2" targetRef="Gateway_1" />
    
    <bpmn:task id="Task_3" name="Rechazar cambio">
      <bpmn:incoming>SequenceFlow_4</bpmn:incoming>
      <bpmn:documentation>Equipo de seguridad rechaza el cambio y notifica al equipo de desarrollo.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_4" sourceRef="Gateway_1" targetRef="Task_3">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">
        ${!validacionExitosa}
      </bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    
    <bpmn:task id="Task_4" name="Compilar y ejecutar pruebas">
      <bpmn:incoming>SequenceFlow_5</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_6</bpmn:outgoing>
      <bpmn:documentation>GitLab CI compila el código y ejecuta pruebas unitarias e integración.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_5" sourceRef="Gateway_1" targetRef="Task_4">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">
        ${validacionExitosa}
      </bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    
    <bpmn:exclusiveGateway id="Gateway_2" name="¿Pruebas exitosas?">
      <bpmn:incoming>SequenceFlow_6</bpmn:incoming>
    </bpmn:exclusiveGateway>
    
    <bpmn:sequenceFlow id="SequenceFlow_6" sourceRef="Task_4" targetRef="Gateway_2" />
    
    <bpmn:task id="Task_5" name="Notificar fallo de pruebas">
      <bpmn:incoming>SequenceFlow_7</bpmn:incoming>
      <bpmn:documentation>GitLab CI notifica al equipo de desarrollo sobre fallos en pruebas.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_7" sourceRef="Gateway_2" targetRef="Task_5">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">
        ${!pruebasExitosas}
      </bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    
    <bpmn:task id="Task_6" name="Desplegar en entorno de staging">
      <bpmn:incoming>SequenceFlow_8</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_9</bpmn:outgoing>
      <bpmn:documentation>GitLab CI despliega el cambio en el entorno de staging.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_8" sourceRef="Gateway_2" targetRef="Task_6">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">
        ${pruebasExitosas}
      </bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    
    <bpmn:task id="Task_7" name="Validar en staging">
      <bpmn:incoming>SequenceFlow_9</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_10</bpmn:outgoing>
      <bpmn:documentation>Equipo de operaciones valida el cambio en staging con Prometheus/Grafana.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_9" sourceRef="Task_6" targetRef="Task_7" />
    
    <bpmn:exclusiveGateway id="Gateway_3" name="¿Validación exitosa en staging?">
      <bpmn:incoming>SequenceFlow_10</bpmn:incoming>
    </bpmn:exclusiveGateway>
    
    <bpmn:sequenceFlow id="SequenceFlow_10" sourceRef="Task_7" targetRef="Gateway_3" />
    
    <bpmn:task id="Task_8" name="Revertir despliegue">
      <bpmn:incoming>SequenceFlow_11</bpmn:incoming>
      <bpmn:documentation>Equipo de operaciones revierte el despliegue en staging y notifica.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_11" sourceRef="Gateway_3" targetRef="Task_8">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">
        ${!validacionStagingExitosa}
      </bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    
    <bpmn:task id="Task_9" name="Desplegar en producción">
      <bpmn:incoming>SequenceFlow_12</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_13</bpmn:outgoing>
      <bpmn:documentation>GitLab CI despliega el cambio en producción con monitoreo en tiempo real.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_12" sourceRef="Gateway_3" targetRef="Task_9">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">
        ${validacionStagingExitosa}
      </bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    
    <bpmn:task id="Task_10" name="Monitorear en producción">
      <bpmn:incoming>SequenceFlow_13</bpmn:incoming>
      <bpmn:outgoing>SequenceFlow_14</bpmn:outgoing>
      <bpmn:documentation>Equipo de operaciones monitorea métricas en producción con Prometheus/Grafana.</bpmn:documentation>
    </bpmn:task>
    
    <bpmn:sequenceFlow id="SequenceFlow_13" sourceRef="Task_9" targetRef="Task_10" />
    
    <bpmn:endEvent id="EndEvent_1" name="Cambio implementado">
      <bpmn:incoming>SequenceFlow_14</bpmn:incoming>
    </bpmn:endEvent>
    
    <bpmn:sequenceFlow id="SequenceFlow_14" sourceRef="Task_10" targetRef="EndEvent_1" />
    
    <bpmn:sequenceFlow id="SequenceFlow_1" sourceRef="StartEvent_1" targetRef="Task_1" />
    <bpmn:sequenceFlow id="SequenceFlow_2" sourceRef="Task_1" targetRef="Task_2" />
  </bpmn:process>
  
  <bpmndi:BPMNDiagram id="BPMNDiagram_1">
    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_1">
      <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="StartEvent_1">
        <dc:Bounds x="173" y="102" width="36" height="36" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_1_di" bpmnElement="Task_1">
        <dc:Bounds x="270" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_2_di" bpmnElement="Task_2">
        <dc:Bounds x="430" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_1_di" bpmnElement="Gateway_1">
        <dc:Bounds x="590" y="100" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_3_di" bpmnElement="Task_3">
        <dc:Bounds x="690" y="180" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_4_di" bpmnElement="Task_4">
        <dc:Bounds x="690" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_2_di" bpmnElement="Gateway_2">
        <dc:Bounds x="850" y="100" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_5_di" bpmnElement="Task_5">
        <dc:Bounds x="950" y="180" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_6_di" bpmnElement="Task_6">
        <dc:Bounds x="950" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_7_di" bpmnElement="Task_7">
        <dc:Bounds x="1110" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_3_di" bpmnElement="Gateway_3">
        <dc:Bounds x="1270" y="100" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_8_di" bpmnElement="Task_8">
        <dc:Bounds x="1370" y="180" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_9_di" bpmnElement="Task_9">
        <dc:Bounds x="1370" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_10_di" bpmnElement="Task_10">
        <dc:Bounds x="1530" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="_BPMNShape_EndEvent_2" bpmnElement="EndEvent_1">
        <dc:Bounds x="1690" y="102" width="36" height="36" />
      </bpmndi:BPMNShape>
      
      <bpmndi:BPMNEdge id="SequenceFlow_1_di" bpmnElement="SequenceFlow_1">
        <di:waypoint x="209" y="120" />
        <di:waypoint x="270" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_2_di" bpmnElement="SequenceFlow_2">
        <di:waypoint x="370" y="120" />
        <di:waypoint x="430" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_3_di" bpmnElement="SequenceFlow_3">
        <di:waypoint x="530" y="120" />
        <di:waypoint x="590" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_4_di" bpmnElement="SequenceFlow_4">
        <di:waypoint x="615" y="150" />
        <di:waypoint x="615" y="220" />
        <di:waypoint x="690" y="220" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_5_di" bpmnElement="SequenceFlow_5">
        <di:waypoint x="640" y="120" />
        <di:waypoint x="690" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_6_di" bpmnElement="SequenceFlow_6">
        <di:waypoint x="790" y="120" />
        <di:waypoint x="850" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_7_di" bpmnElement="SequenceFlow_7">
        <di:waypoint x="875" y="150" />
        <di:waypoint x="875" y="220" />
        <di:waypoint x="950" y="220" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_8_di" bpmnElement="SequenceFlow_8">
        <di:waypoint x="900" y="120" />
        <di:waypoint x="950" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_9_di" bpmnElement="SequenceFlow_9">
        <di:waypoint x="1050" y="120" />
        <di:waypoint x="1110" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_10_di" bpmnElement="SequenceFlow_10">
        <di:waypoint x="1210" y="120" />
        <di:waypoint x="1270" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_11_di" bpmnElement="SequenceFlow_11">
        <di:waypoint x="1295" y="150" />
        <di:waypoint x="1295" y="220" />
        <di:waypoint x="1370" y="220" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_12_di" bpmnElement="SequenceFlow_12">
        <di:waypoint x="1320" y="120" />
        <di:waypoint x="1370" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_13_di" bpmnElement="SequenceFlow_13">
        <di:waypoint x="1470" y="120" />
        <di:waypoint x="1530" y="120" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="SequenceFlow_14_di" bpmnElement="SequenceFlow_14">
        <di:waypoint x="1630" y="120" />
        <di:waypoint x="1690" y="120" />
      </bpmndi:BPMNEdge>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</bpmn:definitions>
```

## Actores del Proceso

| Actor               | Responsabilidad                                                                 | Herramientas Utilizadas               |
|---------------------|---------------------------------------------------------------------------------|---------------------------------------|
| Equipo de Desarrollo | Crear solicitudes de cambio, implementar funcionalidades                        | Git, GitLab CI, IDE                   |
| Equipo de Seguridad  | Validar requisitos de seguridad, rechazar cambios no conformes                | OWASP ZAP, Políticas de Seguridad     |
| Equipo de Operaciones| Validar despliegues en staging, monitorear producción                          | Prometheus, Grafana, GitLab CI       |

## Puntos de Decisión

1. **Validación de seguridad**: 
   - Decisión: ¿El cambio cumple con las políticas de seguridad?
   - Consecuencia: Si no cumple, el cambio es rechazado.

2. **Pruebas de integración**:
   - Decisión: ¿Las pruebas unitarias e integración pasan exitosamente?
   - Consecuencia: Si fallan, se notifica al equipo de desarrollo.

3. **Validación en staging**:
   - Decisión: ¿El cambio funciona correctamente en el entorno de staging?
   - Consecuencia: Si no pasa, se revierte el despliegue.

## Extensiones DevOps

- **x-devops**:
  - **ci_cd**: Cada tarea del proceso está asociada a una etapa específica en GitLab CI.
  - **observabilidad**: Métricas de tiempo de ejecución y fallos son monitoreadas con Prometheus y visualizadas en Grafana.
  - **seguridad**: Validaciones de seguridad son realizadas con OWASP ZAP en cada cambio.

// === ARCHIVO: mapeo-de-datos.csv ===
campo_origen,sistema_origen,tipo_origen,obligatorio_origen,campo_destino,sistema_destino,tipo_destino,obligatorio_destino,regla_transformacion,ejemplo_origen,ejemplo_destino
idCambio,sistema-gestion,string,SÍ,idPipeline,api-integracion,string,SÍ,generarPrefijo:chg->pipeline-,chg-12345,pipeline-67890
equipo,sistema-gestion,string,SÍ,equipo,api-integracion,string,SÍ,,desarrollo,desarrollo
repositorio,sistema-gestion,string,SÍ,repositorio,api-integracion,string,SÍ,,https://git.empresa.com/proyecto-core,https://git.empresa.com/proyecto-core
rama,sistema-gestion,string,SÍ,rama,api-integracion,string,SÍ,,feature/nueva-funcionalidad,feature/nueva-funcionalidad
commit,sistema-gestion,string,SÍ,commit,api-integracion,string,SÍ,validarFormato:^[a-f0-9]{12}$,a1b2c3d4e5f6,a1b2c3d4e5f6
dependencias,sistema-gestion,array,NO,dependencias,api-integracion,array,NO,,servicio-autenticacion;servicio-pagos,"[\"servicio-autenticacion\",\"servicio-pagos\"]"
idTransaccion,servicio-pagos,string,SÍ,idTransaccion,api-integracion,string,SÍ,generarPrefijo:tx->tx-,1234567890,tx-1234567890
sistema,servicio-autenticacion,string,SÍ,sistema,trazabilidad-api,string,SÍ,,servicio-autenticacion,servicio-autenticacion
equipo,servicio-autenticacion,string,SÍ,equipo,trazabilidad-api,string,SÍ,,seguridad,seguridad
accion,servicio-autenticacion,string,SÍ,accion,trazabilidad-api,string,SÍ,,validar-token,validar-token
timestamp,servicio-autenticacion,datetime,SÍ,timestamp,trazabilidad-api,datetime,SÍ,formatoFecha:YYYY-MM-DDTHH:mm:ssZ,2023-11-15T10:00:01,2023-11-15T10:00:01Z
detalle,servicio-autenticacion,string,NO,detalle,trazabilidad-api,string,NO,,Token JWT validado exitosamente,Token JWT validado exitosamente
estado_pipeline,gitlab-ci,string,SÍ,estado,api-integracion,string,SÍ,mapearValores:created->pendiente;running->en-progreso;success->exitoso;failed->fallido,success,exitoso
tiempo_ejecucion,prometheus,integer,NO,tiempoEjecucion,api-integracion,integer,NO,,120,120
metricas_fallos,prometheus,integer,SÍ,pipeline_fallos,api-integracion,integer,SÍ,,5,5


// === ARCHIVO: diagramas/flujo-integracion.bpmn.md ===
# Flujo de Integración Continuo - BPMN

```mermaid
flowchart TD
    %% Definición de actores y herramientas
    A["Equipo Desarrollo"] -->|"Código + Tests"| B("Repositorio GitLab")
    B -->|"Trigger"| C["GitLab CI/CD"]
    C --> D{¿Build exitoso?}
    D -->|No| E["Notificación Slack
+ Jira Ticket"]
    D -->|Sí| F["Análisis de Seguridad
(OWASP ZAP)"]
    F --> G{¿Seguridad aprobada?}
    G -->|No| E
    G -->|Sí| H["Despliegue en Entorno de
Pruebas (Kubernetes)"]
    H --> I["Pruebas Automatizadas
(Postman/Newman)"]
    I --> J{¿Pruebas aprobadas?}
    J -->|No| E
    J -->|Sí| K["Despliegue en Entorno de
Preproducción"]
    K --> L["Pruebas de Integración
(SoapUI)"]
    L --> M{¿Integración exitosa?}
    M -->|No| E
    M -->|Sí| N["Equipo Operaciones"]
    N -->|"Aprobación manual"| O["Despliegue en Producción"]
    O --> P["Monitoreo en Tiempo Real
(Prometheus + Grafana)"]
    P --> Q{¿Métricas dentro de SLA?}
    Q -->|No| R["Rollback Automático
+ Alerta PagerDuty"]
    Q -->|Sí| S["Equipo Seguridad"]
    S -->|"Revisión de logs
(Splunk)"| T["Cierre de Ciclo"]
    R --> T
    
    %% Puntos de decisión con herramientas
    style D fill:#f9f,stroke:#333
    style G fill:#f9f,stroke:#333
    style J fill:#f9f,stroke:#333
    style M fill:#f9f,stroke:#333
    style Q fill:#f9f,stroke:#333
    
    %% Herramientas clave
    click B "https://docs.gitlab.com/ee/ci/" "GitLab CI/CD" _blank
    click F "https://www.zaproxy.org/" "OWASP ZAP" _blank
    click P "https://prometheus.io/" "Prometheus" _blank
```

## Descripción Detallada del Flujo

### **1. Desarrollo (Equipo Desarrollo)**
- **Responsabilidades**:
  - Implementar cambios en el código siguiendo los contratos definidos en `openapi.yaml` y `mapeo-de-datos.csv`.
  - Asegurar que cada cambio incluya pruebas unitarias y de integración.
  - Documentar las dependencias entre equipos en `documentacion/mapa-interacciones.md`.

- **Herramientas**:
  - GitLab (repositorio y merge requests).
  - IDE con plugins de OpenAPI (para validación de contratos).
  - Postman (pruebas manuales de endpoints).

- **Puntos de Decisión**:
  - **Build exitoso**: Validado por GitLab CI/CD. Si falla, se notifica al equipo vía Slack y se crea un ticket en Jira.
  - **Seguridad**: OWASP ZAP analiza vulnerabilidades en el código y dependencias. Si se detectan riesgos altos, el flujo se detiene.

### **2. Operaciones (Equipo Operaciones)**
- **Responsabilidades**:
  - Gestionar los entornos de pruebas, preproducción y producción.
  - Validar que el despliegue cumple con los requisitos de infraestructura (ej. Kubernetes, Helm charts).
  - Monitorear métricas de rendimiento (latencia, throughput) con Prometheus y Grafana.

- **Herramientas**:
  - Kubernetes (orquestación de contenedores).
  - ArgoCD (despliegues GitOps).
  - Grafana (visualización de métricas).

- **Puntos de Decisión**:
  - **Pruebas automatizadas**: Ejecutadas con Postman/Newman. Si fallan, se notifica al equipo de desarrollo.
  - **Integración**: Validada con SoapUI para escenarios complejos (ej. transacciones financieras).
  - **Aprobación manual**: Requerida para despliegues en producción. El equipo de operaciones verifica que las métricas de preproducción cumplen con el SLA (99.9% de disponibilidad).

### **3. Seguridad (Equipo Seguridad)**
- **Responsabilidades**:
  - Revisar logs y alertas generadas por herramientas como Splunk.
  - Validar que el despliegue cumple con estándares financieros (ISO 20022, FAPI) y DevOps (SLSA, OWASP).
  - Documentar riesgos y mitigaciones en `documentacion/analisis-riesgo.md`.

- **Herramientas**:
  - OWASP ZAP (análisis de vulnerabilidades).
  - Splunk (análisis de logs).
  - PagerDuty (alertas críticas).

- **Puntos de Decisión**:
  - **Métricas SLA**: Si las métricas de producción (ej. latencia > 500ms) violan el SLA, se activa un rollback automático.
  - **Revisión de logs**: Se verifica que no haya fugas de datos o accesos no autorizados.

### **4. Herramientas Transversales**
| Herramienta          | Propósito                                                                 | Etapa del Flujo               |
|-----------------------|--------------------------------------------------------------------------|-------------------------------|
| GitLab CI/CD         | Automatizar builds, pruebas y despliegues.                              | Build → Despliegue            |
| OWASP ZAP            | Escaneo de vulnerabilidades en código y dependencias.                   | Build                          |
| Prometheus + Grafana | Monitoreo en tiempo real de métricas de rendimiento y disponibilidad.   | Producción                    |
| Splunk               | Análisis de logs para detección de anomalías.                            | Producción                    |
| PagerDuty            | Alertas para incidentes críticos (ej. caída de servicio).               | Producción                    |
| Jira                 | Gestión de tickets para seguimiento de incidencias.                      | Todas                         |
| Slack                | Notificaciones en tiempo real a los equipos.                             | Todas                         |

### **5. Extensiones OpenAPI para DevOps (`x-devops`)**
El contrato `openapi.yaml` incluye extensiones personalizadas para documentar el flujo CI/CD:

```yaml
x-devops:
  pipelines:
    - name: build
      stages:
        - name: compile
          tools: ["Maven 3.8.6"]
        - name: unit-tests
          tools: ["JUnit 5"]
        - name: integration-tests
          tools: ["Postman", "Newman"]
    - name: deploy
      stages:
        - name: staging
          environment: "kubernetes-staging"
          approval: manual
        - name: production
          environment: "kubernetes-production"
          approval: manual
          metrics:
            - name: latency
              threshold: 500ms
            - name: availability
              threshold: 99.9%
```

### **6. Escenarios de Fallo y Mitigación**
| Escenario                                      | Impacto                          | Mitigación                                                                 |
|-----------------------------------------------|----------------------------------|----------------------------------------------------------------------------|
| Fallo en el build                             | Bloqueo del flujo                | Notificación automática + ticket Jira.                                   |
| Vulnerabilidades críticas detectadas por ZAP  | Riesgo de seguridad              | Detener el flujo y requerir revisión manual.                              |
| Pruebas de integración fallidas               | Inconsistencia en datos          | Rollback a la versión anterior y análisis de root cause.                  |
| Métricas de producción fuera de SLA           | Incumplimiento de contrato       | Rollback automático + alerta PagerDuty.                                  |
| Fallo en el despliegue (Kubernetes)           | Downtime                         | Usar ArgoCD para revertir a la última versión estable.                    |

### **7. Métricas Clave para Observabilidad**
| Métrica                     | Herramienta      | Umbral          | Acción si se Viola                     |
|----------------------------|------------------|------------------|-----------------------------------------|
| Latencia (P99)             | Prometheus       | < 500ms          | Rollback automático.                    |
| Throughput                 | Prometheus       | > 10,000 TPS     | Escalar pods en Kubernetes.             |
| Error Rate                 | Prometheus       | < 0.1%           | Investigar root cause.                  |
| Disponibilidad             | Grafana          | > 99.9%          | Activar alerta crítica.                 |
| Tiempo de despliegue       | GitLab CI/CD     | < 15 min         | Optimizar pipelines.                    |

### **8. Roles y Responsabilidades**
| Equipo            | Responsabilidades                                                                 | Herramientas Clave                     |
|-------------------|-------------------------------------------------------------------------------|-----------------------------------------|
| Desarrollo        | Implementar código, escribir tests, documentar dependencias.               | GitLab, Postman, OpenAPI Generator      |
| Operaciones       | Gestionar entornos, monitorear métricas, aprobar despliegues.              | Kubernetes, Grafana, ArgoCD            |
| Seguridad         | Revisar vulnerabilidades, analizar logs, validar cumplimiento de estándares.| OWASP ZAP, Splunk, PagerDuty            |

### **9. Ejemplo de Notificación en Slack**
```
🚨 *Alerta de Pipeline*

**Proyecto**: Integración Bancaria
**Etapa**: Build
**Estado**: ❌ Fallido
**Razón**: Pruebas unitarias fallidas (JUnit)
**Commit**: `a1b2c3d`
**Autor**: @desarrollador
**Acción**: Revisar ticket [JIRA-1234](https://jira.ejemplo.com/browse/JIRA-1234)
```

### **10. Validación del Flujo**
- **Criterios de Aceptación**: Definidos en `pruebas/criterios-aceptacion.feature` (ejemplo):
  ```gherkin
  Feature: Validación del flujo de integración continuo
    Scenario: Despliegue exitoso en producción
      Given que el código pasa todas las pruebas unitarias e integración
      And que OWASP ZAP no detecta vulnerabilidades críticas
      When el equipo de operaciones aprueba el despliegue
      Then el sistema se despliega en producción
      And las métricas de Prometheus cumplen con el SLA
      
    Scenario: Rollback automático por violación de SLA
      Given que el sistema está en producción
      And la latencia supera 500ms
      When Prometheus detecta la violación
      Then se activa el rollback automático
      And se envía una alerta a PagerDuty
  ```

### **11. Lecciones Aprendidas**
Documentadas en `documentacion/lecciones-aprendidas.md`:
- **Comunicación entre equipos**: La falta de sincronización entre desarrollo y operaciones retrasó despliegues en un 30%. Solución: reuniones diarias de 15 minutos.
- **Automatización de pruebas**: Las pruebas manuales introdujeron errores humanos. Solución: migrar a Postman/Newman.
- **Monitoreo proactivo**: Las métricas de latencia no se revisaban hasta que había quejas de usuarios. Solución: dashboards en Grafana con umbrales automáticos.

### **12. Riesgos y Mitigaciones**
Detallados en `documentacion/analisis-riesgo.md`:
- **Riesgo**: Fallo en el despliegue por configuración incorrecta de Kubernetes.
  - **Mitigación**: Usar Helm charts versionados y validación automática con `kubeval`.
- **Riesgo**: Vulnerabilidades en dependencias de terceros.
  - **Mitigación**: Escaneo automático con OWASP Dependency-Check en cada build.
- **Riesgo**: Incumplimiento de estándares financieros (ISO 20022).
  - **Mitigación**: Validación del contrato OpenAPI contra esquemas ISO 20022 antes de cada despliegue.

### **13. Diagrama de Secuencia (Opcional)**
```mermaid
sequenceDiagram
    participant Dev as Equipo Desarrollo
    participant CI as GitLab CI/CD
    participant Sec as OWASP ZAP
    participant Ops as Equipo Operaciones
    participant Prod as Producción
    
    Dev->>CI: Push código + tests
    CI->>Sec: Escaneo de seguridad
    Sec-->>CI: Vulnerabilidades?
    alt Vulnerabilidades detectadas
        CI->>Dev: Notificación Slack
    else Sin vulnerabilidades
        CI->>Ops: Despliegue en pruebas
        Ops->>Prod: Aprobación manual
        Prod->>CI: Métricas de producción
        alt Métricas fuera de SLA
            Prod->>Ops: Rollback automático
        end
    end
```

// === ARCHIVO: documentacion/mapa-interacciones.md ===
# Mapa de Interacciones y Dependencias del Sistema

## Contexto General
El sistema actual gestiona integraciones financieras entre múltiples equipos distribuidos, con un volumen de **10,000 transacciones por segundo** y un **SLA del 99.9%**. La trazabilidad de las integraciones debe garantizarse por **5 años**, lo que requiere un flujo de trabajo coordinado entre equipos de desarrollo, operaciones y seguridad.

## Equipos Involucrados y Responsabilidades
| Equipo               | Rol Principal                                                                 | Responsabilidades Clave                                                                                     | Herramientas Utilizadas                          |
|----------------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Desarrollo (Dev)** | Implementación de servicios y contratos de integración                       | - Diseño y mantenimiento de APIs (OpenAPI 3.1)
- Mapeo de datos entre sistemas
- Validación de criterios de aceptación
- Pruebas unitarias y de integración | GitLab, OpenAPI Generator, Postman          |
| **Operaciones (Ops)**| Despliegue, monitoreo y escalabilidad                                      | - Configuración de pipelines CI/CD
- Monitoreo de métricas (Prometheus/Grafana)
- Gestión de infraestructura
- Asegurar cumplimiento de SLA          | GitLab CI/CD, Prometheus, Grafana, Kubernetes |
| **Seguridad (SecOps)**| Cumplimiento de estándares y protección de datos                           | - Validación de seguridad (OWASP ZAP)
- Configuración de tokens y autenticación
- Asegurar trazabilidad y no repudio
- Análisis de riesgos                | OWASP ZAP, Vault, ISO 20022, FAPI            |
| **Negocio**          | Definición de requisitos y validación funcional                             | - Priorización de features
- Validación de flujos de negocio (BPMN)
- Aprobación de criterios de aceptación
- Coordinación entre equipos          | JIRA, Confluence, BPMN.js                   |

## Interacciones Actuales

### Flujo de Desarrollo a Producción
```mermaid
flowchart TD
    A[Desarrollo: Implementación] -->|PR Merge| B[GitLab CI: Build & Unit Tests]
    B -->|Éxito| C[GitLab CI: Pruebas de Integración]
    C -->|Éxito| D[SecOps: Validación de Seguridad]
    D -->|Éxito| E[Ops: Despliegue a Staging]
    E -->|Validación| F[Negocio: Aprobación Funcional]
    F -->|Aprobado| G[Ops: Despliegue a Producción]
    G -->|Monitoreo| H[Prometheus/Grafana: Métricas]
```

### Dependencias Críticas
1. **Contratos de Integración** (`openapi.yaml`)
   - **Dependencia**: Equipo Dev → Equipo SecOps → Equipo Ops
   - **Restricción**: Cualquier cambio en el contrato requiere validación de seguridad y actualización de mapeos de datos.
   - **Riesgo**: Desincronización entre equipos puede generar fallos en producción.

2. **Mapeo de Datos** (`mapeo-de-datos.csv`)
   - **Dependencia**: Equipo Dev → Equipo Negocio
   - **Restricción**: Los campos obligatorios y reglas de transformación deben alinearse con estándares ISO 20022.
   - **Riesgo**: Datos mal mapeados pueden causar inconsistencias en reportes regulatorios.

3. **Pipeline CI/CD** (`GitLab CI/CD`)
   - **Dependencia**: Equipo Ops → Equipo Dev → Equipo SecOps
   - **Restricción**: Las etapas de seguridad (OWASP ZAP) no pueden omitirse.
   - **Riesgo**: Vulnerabilidades no detectadas pueden exponer datos sensibles.

4. **Monitoreo y Observabilidad** (`Prometheus + Grafana`)
   - **Dependencia**: Equipo Ops → Equipo Dev
   - **Restricción**: Las métricas deben incluir latencia, tasa de errores y throughput.
   - **Riesgo**: Falta de visibilidad puede retrasar la detección de fallos.

## Restricciones Identificadas
| Área                | Restricción                                                                 | Impacto                                                                                     | Mitigación Propuesta                          |
|---------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|---------------------------------------------|
| **Contratos**       | Cambios en OpenAPI requieren aprobación de SecOps                          | Retrasos en despliegues                                                                    | Automatizar validación con Redocly CLI      |
| **Seguridad**       | Validación manual de vulnerabilidades con OWASP ZAP                        | Cuellos de botella en el pipeline                                                          | Integrar escaneo automático en CI/CD        |
| **Despliegue**      | Dependencia de aprobación manual para producción                           | Incumplimiento de SLA en despliegues urgentes                                             | Implementar canary releases con rollback    |
| **Trazabilidad**    | Logs dispersos en múltiples sistemas                                       | Dificultad para auditar integridad de datos                                                 | Centralizar logs con ELK Stack              |

## Ambigüedades y Riesgos
1. **Falta de definición clara de SLAs por equipo**
   - **Problema**: Los equipos Dev y Ops no tienen métricas alineadas para medir el éxito del despliegue.
   - **Impacto**: Dificultad para escalar el sistema bajo carga.
   - **Acción**: Definir SLAs por etapa (ej. "Tiempo máximo de despliegue: 15 minutos").

2. **Inconsistencia en versiones de dependencias**
   - **Problema**: Equipos usan diferentes versiones de OpenAPI Generator y Redocly CLI.
   - **Impacto**: Fallos en generación de clientes y validación de contratos.
   - **Acción**: Establecer un archivo `.tool-versions` en el repositorio.

3. **Falta de pruebas de carga en staging**
   - **Problema**: El entorno de staging no replica las condiciones de producción (10k TPS).
   - **Impacto**: Fallos no detectados hasta producción.
   - **Acción**: Implementar pruebas de carga con Gatling o Locust.

4. **Gobernanza de tokens de seguridad**
   - **Problema**: Los tokens de autenticación se gestionan manualmente en archivos locales.
   - **Impacto**: Riesgo de filtración de credenciales.
   - **Acción**: Migrar a Vault con rotación automática.

## Métricas Actuales (Baseline)
| Métrica                     | Valor Actual | Objetivo (SLA) | Brecha                     |
|----------------------------|--------------|----------------|----------------------------|
| Tiempo promedio de despliegue | 45 minutos   | <15 minutos    | -30 minutos                |
| Tasa de errores en producción | 0.5%         | <0.1%          | +0.4%                      |
| Cobertura de pruebas        | 75%          | 90%            | +15%                       |
| Tiempo de detección de fallos | 10 minutos   | <2 minutos     | -8 minutos                 |
| Cumplimiento de SLA         | 99.7%        | 99.9%          | -0.2%                      |

## Recomendaciones Iniciales
1. **Automatizar validación de contratos**
   - Integrar `redocly lint` en el pipeline para validar OpenAPI antes del merge.
   - Ejemplo de regla: `paths-required: error` (todos los paths deben estar documentados).

2. **Implementar despliegues canary**
   - Reducir riesgo de despliegues en producción mediante rollouts graduales.
   - Herramienta recomendada: Kubernetes con Istio.

3. **Centralizar logs y métricas**
   - Unificar logs de todos los equipos en un stack ELK.
   - Métricas clave: latencia, throughput, errores HTTP.

4. **Establecer reuniones de sincronización semanales**
   - Objetivo: Alinear prioridades entre Dev, Ops y SecOps.
   - Agenda: Revisión de métricas, bloqueos y riesgos.

---
*Nota: Este documento es la base para la Fase 2 (Diseño del flujo CI/CD).*

// === ARCHIVO: documentacion/propuesta-flujo-ci.md ===
# Propuesta de Flujo de Integración Continuo

## Objetivos del Flujo
1. **Reducir tiempo de despliegue** de 45 minutos a <15 minutos.
2. **Aumentar cobertura de pruebas** del 75% al 90%.
3. **Garantizar trazabilidad** de todas las integraciones con logs centralizados.
4. **Automatizar validaciones de seguridad** para cumplir con estándares FAPI e ISO 20022.
5. **Mejorar colaboración** entre equipos Dev, Ops y SecOps mediante etapas claras y métricas compartidas.

## Arquitectura del Flujo
```mermaid
flowchart LR
    A[Commit/PR] -->|Trigger| B[Build & Unit Tests]
    B -->|Éxito| C[Pruebas de Integración]
    C -->|Éxito| D[Validación de Seguridad]
    D -->|Éxito| E[Despliegue a Staging]
    E -->|Validación| F[Pruebas de Carga]
    F -->|Éxito| G[Despliegue Canary]
    G -->|Monitoreo| H[Despliegue a Producción]
    H -->|Métricas| I[Prometheus/Grafana]
    I -->|Alertas| J[Rollback Automático si SLA Violado]
```

## Etapas del Pipeline

### 1. Desarrollo (Dev)
**Herramientas**: GitLab CI/CD, OpenAPI Generator, Postman
**Responsables**: Equipo Dev
**Tareas**:
- Implementación de features en ramas feature/*
- Validación local con `redocly lint openapi.yaml`
- Pruebas unitarias con cobertura mínima del 90%
- Creación de PR con revisión por pares

**Ejemplo de validación OpenAPI en CI**:
```yaml
# .gitlab-ci.yml
validate_openapi:
  stage: build
  script:
    - npx @redocly/cli lint openapi.yaml
    - openapi-generator validate -i openapi.yaml
```

### 2. Build y Pruebas Unitarias
**Herramientas**: GitLab CI/CD, Jest/Unit Testing Framework
**Responsables**: Equipo Dev
**Métricas**:
- Tiempo de build: <5 minutos
- Cobertura de pruebas: >90%
- Fallos bloqueantes: 0

**Ejemplo de etapa en GitLab CI**:
```yaml
build:
  stage: build
  script:
    - npm install
    - npm run build
    - npm run test:coverage
  artifacts:
    reports:
      cobertura: coverage/cobertura-coverage.xml
```

### 3. Pruebas de Integración
**Herramientas**: GitLab CI/CD, Postman/Newman, BPMN.js
**Responsables**: Equipo Dev + Equipo Negocio
**Tareas**:
- Ejecución de escenarios Gherkin (`pruebas/criterios-aceptacion.feature`)
- Validación de mapeos de datos (`contratos/mapeo-datos.csv`)
- Pruebas de contrato con ejemplos concretos

**Ejemplo de escenario Gherkin**:
```gherkin
Feature: Validación de mapeo de datos
  Scenario: Mapeo de fecha incorrecto
    Given un registro con fecha "31/02/2023"
    When se mapea al formato ISO 8601
    Then debe retornar error "Fecha inválida"
```

### 4. Validación de Seguridad
**Herramientas**: OWASP ZAP, GitLab CI/CD
**Responsables**: Equipo SecOps
**Tareas**:
- Escaneo de vulnerabilidades en APIs (OWASP Top 10)
- Validación de tokens (`seguridad/token-utils.md`)
- Revisión de configuración de seguridad (`seguridad/security-config.md`)
- Cumplimiento de estándares FAPI e ISO 20022

**Ejemplo de configuración OWASP ZAP**:
```yaml
zap_scan:
  stage: security
  script:
    - zap-baseline.py -t https://staging.example.com -r report.html
    - if [ $(grep -c "High Risk" report.html) -gt 0 ]; then exit 1; fi
  artifacts:
    paths:
      - report.html
```

### 5. Despliegue a Staging
**Herramientas**: GitLab CI/CD, Kubernetes
**Responsables**: Equipo Ops
**Tareas**:
- Despliegue automático a entorno de staging
- Validación de configuración (`config/staging.yaml`)
- Pruebas de humo (smoke tests)

**Ejemplo de despliegue**:
```yaml
deploy_staging:
  stage: deploy
  script:
    - kubectl apply -f k8s/staging.yaml
    - kubectl rollout status deployment/api-deployment
    - curl -I https://staging.example.com/health
```

### 6. Pruebas de Carga
**Herramientas**: Gatling, Prometheus
**Responsables**: Equipo Ops
**Métricas**:
- Throughput: >10,000 TPS
- Latencia: <100ms p99
- Errores: <0.1%

**Ejemplo de prueba Gatling**:
```scala
class LoadTestSimulation extends Simulation {
  val httpProtocol = http.baseUrl("https://staging.example.com")
  val scenario = scenario("API Load Test")
    .exec(http("Get Transactions")
      .get("/transactions")
      .check(status.is(200)))

  setUp(scenario.inject(rampUsers(10000).during(60.seconds)))
    .protocols(httpProtocol)
    .assertions(
      global.responseTime.max.lt(500),
      global.successfulRequests.percent.gt(99.9)
    )
}
```

### 7. Despliegue Canary
**Herramientas**: Kubernetes, Istio
**Responsables**: Equipo Ops
**Estrategia**:
- Despliegue del 10% del tráfico a la nueva versión
- Monitoreo de métricas durante 15 minutos
- Rollback automático si se violan SLAs

**Ejemplo de configuración Istio**:
```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: api-service
spec:
  hosts:
    - api.example.com
  http:
    - route:
        - destination:
            host: api-v1
          weight: 90
        - destination:
            host: api-v2
          weight: 10
```

### 8. Despliegue a Producción
**Herramientas**: GitLab CI/CD, Kubernetes
**Responsables**: Equipo Ops
**Tareas**:
- Despliegue completo a producción
- Validación de salud del servicio
- Actualización de documentación (`README.md`)

### 9. Monitoreo y Observabilidad
**Herramientas**: Prometheus, Grafana, ELK Stack
**Responsables**: Equipo Ops
**Métricas Clave**:
- Latencia (p50, p90, p99)
- Throughput (TPS)
- Errores HTTP (4xx, 5xx)
- Saturación de recursos (CPU, memoria)
- Tiempo de despliegue

**Ejemplo de dashboard Grafana**:
```json
{
  "dashboard": {
    "title": "API Performance",
    "panels": [
      {
        "title": "Latencia (p99)",
        "type": "graph",
        "targets": [
          {
            "expr": "histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))",
            "legendFormat": "{{route}}"
          }
        ]
      }
    ]
  }
}
```

## Participación de Equipos
| Etapa                     | Dev | Ops | SecOps | Negocio |
|---------------------------|-----|-----|--------|---------|
| Desarrollo                | ✅  |     |        |         |
| Build y Pruebas Unitarias | ✅  |     |        |         |
| Pruebas de Integración    | ✅  |     |        | ✅      |
| Validación de Seguridad   |     |     | ✅     |         |
| Despliegue a Staging      |     | ✅  |        |         |
| Pruebas de Carga          |     | ✅  |        |         |
| Despliegue Canary         |     | ✅  |        |         |
| Despliegue a Producción   |     | ✅  |        |         |
| Monitoreo                 | ✅  | ✅  | ✅     | ✅      |

## Herramientas Recomendadas
| Herramienta          | Propósito                                                                 | Equipo Responsable |
|----------------------|--------------------------------------------------------------------------|--------------------|
| GitLab CI/CD         | Orquestación del pipeline                                                 | Ops                 |
| OpenAPI Generator    | Generación de clientes a partir de contratos                             | Dev                 |
| Redocly CLI          | Validación de contratos OpenAPI                                           | Dev                 |
| OWASP ZAP            | Escaneo de vulnerabilidades                                               | SecOps              |
| Prometheus + Grafana | Monitoreo de métricas                                                     | Ops                 |
| Kubernetes           | Orquestación de contenedores                                              | Ops                 |
| Istio                | Gestión de tráfico para despliegues canary                               | Ops                 |
| Gatling              | Pruebas de carga                                                          | Ops                 |
| ELK Stack            | Centralización de logs                                                     | Ops                 |
| Vault                | Gestión de secretos                                                       | SecOps              |

## Métricas de Éxito
| Métrica                     | Valor Inicial | Valor Objetivo | Herramienta de Medición |
|----------------------------|---------------|----------------|--------------------------|
| Tiempo de despliegue       | 45 minutos    | <15 minutos    | GitLab CI/CD             |
| Cobertura de pruebas       | 75%           | 90%            | Jest/Cobertura           |
| Tasa de errores en prod    | 0.5%          | <0.1%          | Prometheus/Grafana       |
| Throughput                 | 8,000 TPS     | >10,000 TPS    | Gatling                  |
| Tiempo de detección de fallos | 10 minutos  | <2 minutos     | Grafana Alerts          |
| Cumplimiento de SLA        | 99.7%         | 99.9%          | Prometheus               |

## Riesgos y Mitigaciones
| Riesgo                                 | Impacto                                  | Mitigación                                                                 |
|----------------------------------------|------------------------------------------|-----------------------------------------------------------------------------|
| Fallos en validación OpenAPI           | Despliegues bloqueados                   | Automatizar validación con Redocly CLI en PRs                              |
| Vulnerabilidades no detectadas         | Exposición de datos sensibles           | Integrar OWASP ZAP en el pipeline                                          |
| Desincronización entre equipos         | Retrasos en despliegues                 | Reuniones semanales de sincronización con métricas compartidas             |
| Pruebas de carga insuficientes         | Fallos en producción bajo carga         | Implementar Gatling con escenarios realistas                              |
| Falta de trazabilidad                  | Dificultad para auditar                  | Centralizar logs con ELK Stack                                             |

## Extensiones OpenAPI para DevOps
Para documentar el pipeline en el contrato OpenAPI, se proponen las siguientes extensiones (`x-devops`):

```yaml
# openapi.yaml
paths:
  /transactions:
    get:
      x-devops:
        pipeline:
          stages:
            - build
            - test
            - security
            - staging
            - load-test
            - canary
            - production
        metrics:
          - name: latency
            target: <100ms
          - name: errors
            target: <0.1%
          - name: throughput
            target: >10000 TPS
        participants:
          - Dev
          - Ops
          - SecOps
```

## Cronograma de Implementación
| Fase          | Duración | Responsables       | Entregables                          |
|---------------|----------|--------------------|--------------------------------------|
| Preparación   | 2 semanas| Dev + Ops          | Definición de SLAs y herramientas    |
| Implementación| 4 semanas| Dev + Ops + SecOps | Pipeline funcional en staging        |
| Validación    | 2 semanas| Todos              | Métricas de éxito alcanzadas         |
| Rollout       | 1 semana | Ops                | Despliegue a producción              |

---
*Nota: Este documento es la base para la Fase 3 (Implementación y validación).*

// === ARCHIVO: documentacion/lecciones-aprendidas.md ===
# Lecciones Aprendidas: Implementación y Validación del Flujo CI/CD

## Contexto
La implementación del flujo de integración continuo buscó mejorar la colaboración entre equipos Dev, Ops y SecOps en un entorno con **10,000 TPS** y **SLA del 99.9%**. El proyecto incluyó la automatización de validaciones, despliegues canary y monitoreo centralizado.

## Desafíos Encontrados

### 1. Desincronización entre Equipos
**Problema**:
- Los equipos Dev y Ops trabajaban con prioridades distintas, causando retrasos en despliegues.
- Ejemplo: El equipo Dev mergeaba PRs sin esperar validación de seguridad, generando fallos en staging.

**Solución**:
- Implementación de **gates de aprobación** en GitLab CI/CD:
  ```yaml
  # .gitlab-ci.yml
  validate_security:
    stage: security
    rules:
      - if: $CI_PIPELINE_SOURCE == "merge_request_event"
        when: manual
    script:
      - npx @redocly/cli lint openapi.yaml
      - zap-baseline.py -t https://staging.example.com
  ```
- Establecimiento de **SLAs por etapa** (ej. "Validación de seguridad: <30 minutos").

**Resultado**:
- Reducción del **30%** en conflictos entre equipos.
- Mejora en la **tasa de éxito de despliegues** del 85% al 95%.

### 2. Validación de Contratos OpenAPI
**Problema**:
- Los contratos OpenAPI (`openapi.yaml`) frecuentemente contenían errores de sintaxis o falta de ejemplos.
- Ejemplo: Paths sin parámetros requeridos o respuestas sin códigos de error.

**Solución**:
- Integración de `redocly lint` en el pipeline con reglas estrictas:
  ```yaml
  # redocly.yaml
  rules:
    info-required: error
    operation-operationId: error
    paths-kebab-case: error
    no-unused-components: error
  ```
- Creación de **plantillas reutilizables** para esquemas comunes (ej. `ErrorResponse`):
  ```yaml
  components:
    schemas:
      ErrorResponse:
        type: object
        properties:
          code:
            type: string
            example: "INVALID_DATE_FORMAT"
          message:
            type: string
            example: "Fecha debe estar en formato YYYY-MM-DD"
  ```

**Resultado**:
- Reducción del **90%** en errores de contrato detectados en staging.
- Generación automática de **clientes SDK** sin fallos.

### 3. Pruebas de Carga Insuficientes
**Problema**:
- El entorno de staging no replicaba las condiciones de producción (10k TPS), causando fallos no detectados.
- Ejemplo: La API fallaba al procesar **5,000 TPS** debido a saturación de conexiones a la base de datos.

**Solución**:
- Implementación de **pruebas de carga con Gatling** en staging:
  ```scala
  // LoadTestSimulation.scala
  setUp(
    scenario("High Load").inject(rampUsers(10000).during(300.seconds))
  ).protocols(
    http.baseUrl("https://staging.example.com")
  ).assertions(
    global.responseTime.max.lt(200),
    global.successfulRequests.percent.gt(99.9)
  )
  ```
- Configuración de **auto-scaling** en Kubernetes:
  ```yaml
  # k8s/staging.yaml
  resources:
    requests:
      cpu: "1000m"
      memory: "2Gi"
    limits:
      cpu: "2000m"
      memory: "4Gi"
  ```

**Resultado**:
- Detección temprana de **cuellos de botella** en la base de datos.
- Mejora en **latencia p99** de 300ms a 80ms.

### 4. Seguridad en el Pipeline
**Problema**:
- Las validaciones de seguridad (OWASP ZAP) se realizaban manualmente, causando retrasos.
- Ejemplo: Vulnerabilidades **SQL Injection** no detectadas hasta producción.

**Solución**:
- Automatización de escaneo OWASP ZAP en el pipeline:
  ```yaml
  # .gitlab-ci.yml
  zap_scan:
    stage: security
    script:
      - zap-baseline.py -t https://staging.example.com -r report.html
      - if [ $(grep -c "High Risk" report.html) -gt 0 ]; then exit 1; fi
    artifacts:
      paths:
        - report.html
  ```
- Configuración de **políticas de seguridad** en `security-config.md`:
  ```markdown
  ## Políticas de Seguridad
  1. **Tokens JWT**: Deben rotarse cada 24 horas.
  2. **Headers HTTP**: `X-Content-Type-Options: nosniff` obligatorio.
  3. **Autenticación**: FAPI compliant (RFC 7636).
  ```

**Resultado**:
- Reducción del **70%** en vulnerabilidades críticas.
- Cumplimiento de estándares **FAPI e ISO 20022**.

### 5. Trazabilidad de Integraciones
**Problema**:
- Los logs estaban dispersos en múltiples sistemas (CloudWatch, ELK, archivos locales).
- Ejemplo: Imposible rastrear una transacción fallida en producción.

**Solución**:
- Implementación de **ELK Stack** para centralizar logs:
  ```yaml
  # logstash.conf
  input {
    file {
      path => "/var/log/api/*.log"
      start_position => "beginning"
    }
  }
  filter {
    grok {
      match => { "message" => "%{TIMESTAMP_ISO8601:timestamp} %{LOGLEVEL:level} %{GREEDYDATA:message}" }
    }
  }
  output {
    elasticsearch {
      hosts => ["elasticsearch:9200"]
      index => "api-logs-%{+YYYY.MM.dd}"
    }
  }
  ```
- Inclusión de **correlation IDs** en todas las transacciones:
  ```yaml
  # openapi.yaml
  paths:
    /transactions:
      get:
        parameters:
          - name: X-Correlation-ID
            in: header
            required: true
            schema:
              type: string
              format: uuid
  ```

**Resultado**:
- Reducción del **80%** en tiempo de resolución de incidentes.
- Cumplimiento de **requisitos de trazabilidad por 5 años**.

## Métricas de Efectividad
| Métrica                          | Valor Inicial | Valor Final | Mejora                  |
|---------------------------------|---------------|-------------|-------------------------|
| Tiempo promedio de despliegue   | 45 minutos    | 12 minutos  | **73% más rápido**      |
| Tasa de errores en producción    | 0.5%          | 0.08%       | **84% menos errores**   |
| Cobertura de pruebas             | 75%           | 92%         | **23% más cobertura**   |
| Tiempo de detección de fallos    | 10 minutos    | 1.5 minutos | **85% más rápido**      |
| Throughput                       | 8,000 TPS     | 11,500 TPS  | **44% más capacidad**   |
| Cumplimiento de SLA              | 99.7%         | 99.92%      | **0.22% más confiable** |

## Lecciones Clave

### 1. Automatización es Cultura, no Tecnología
- **Aprendizaje**: La automatización del pipeline no resuelve problemas de colaboración por sí sola.
- **Acción**: Se implementaron **reuniones semanales de sincronización** con métricas compartidas para alinear prioridades.

### 2. Contratos como Fuente de Verdad
- **Aprendizaje**: Los contratos OpenAPI deben ser la **única fuente de verdad** para todos los equipos.
- **Acción**: Se estableció una **política de "contrato primero"** donde ningún cambio en la API se implementa sin actualizar `openapi.yaml`.

### 3. Seguridad desde el Diseño
- **Aprendizaje**: La seguridad no puede ser una etapa aislada en el pipeline.
- **Acción**: Se integraron validaciones de seguridad en **cada etapa** del CI/CD (ej. OWASP ZAP en PRs).

### 4. Observabilidad como Requisito No Funcional
- **Aprendizaje**: Sin métricas y logs centralizados, es imposible cumplir con SLAs.
- **Acción**: Se definieron **métricas clave** para cada etapa del pipeline (latencia, throughput, errores).

### 5. Pruebas de Carga Realistas
- **Aprendizaje**: Las pruebas de carga deben replicar **escenarios reales** de producción.
- **Acción**: Se implementaron pruebas con **Gatling** usando perfiles de tráfico reales.

## Recomendaciones Futuras
1. **Implementar Feature Flags**
   - Permitir despliegues sin exponer features a todos los usuarios.
   - Herramienta recomendada: **LaunchDarkly**.

2. **Adoptar GitOps**
   - Usar repositorios Git como fuente de verdad para configuraciones de infraestructura.
   - Herramienta recomendada: **Argo CD**.

3. **Mejorar Pruebas de Resiliencia**
   - Simular fallos en dependencias (ej. base de datos, servicios externos).
   - Herramienta recomendada: **Chaos Mesh**.

4. **Automatizar Rollbacks**
   - Implementar rollbacks automáticos cuando se violen SLAs.
   - Configuración recomendada: **Istio + Prometheus Alerts**.

5. **Documentar Decisiones de Arquitectura**
   - Registrar trade-offs y justificaciones de decisiones técnicas.
   - Formato recomendado: **ADRs (Architecture Decision Records)**.

## Conclusión
La implementación del flujo CI/CD logró:
- **Reducir el tiempo de despliegue en un 73%** (de 45 a 12 minutos).
- **Aumentar la cobertura de pruebas del 75% al 92%**.
- **Mejorar el cumplimiento del SLA del 99.7% al 99.92%**.
- **Centralizar logs y métricas**, mejorando la trazabilidad.
- **Automatizar validaciones de seguridad**, reduciendo vulnerabilidades críticas.

El éxito del proyecto dependió de:
1. **Colaboración continua** entre equipos Dev, Ops y SecOps.
2. **Automatización de validaciones** en cada etapa del pipeline.
3. **Pruebas realistas** (carga, seguridad, integración).
4. **Observabilidad** con métricas y logs centralizados.

---
*Documento generado como parte de la Fase 3 del reto.*

// === ARCHIVO: documentacion/analisis-riesgo.md ===
# Análisis de Riesgos en la Integración Continua Multi-Equipo

## Introducción
Este documento identifica los modos de falla críticos en el flujo de integración continuo para un sistema de transacciones financieras con un volumen de 10,000 TPS y SLA del 99.9%. Se analizan los riesgos técnicos, operativos y de seguridad, junto con estrategias de mitigación alineadas con estándares DevOps y financieros (ISO 20022, FAPI, OWASP).

## Metodología
- **Enfoque**: Análisis de modos de falla basado en FMEA (Failure Mode and Effects Analysis).
- **Alcance**: Cubre todas las etapas del SDLC (planificación, desarrollo, integración, despliegue y monitoreo).
- **Herramientas**: GitLab CI/CD, Prometheus, Grafana, OWASP ZAP.

## Riesgos Identificados

### 1. Fallo en la Validación del Contrato OpenAPI
**Descripción**: Errores en el esquema OpenAPI (ej. campos faltantes, tipos incorrectos) que generan inconsistencias entre equipos.
**Causa**: Cambios no coordinados en el contrato sin validación automática.
**Impacto**:
- Bloqueo en la integración de nuevos servicios.
- Fallos en tiempo de ejecución (ej. deserialización de payloads).
- Violación del SLA por downtime.

**Mitigación**:
- Validación automática del contrato OpenAPI en cada commit usando `@redocly/cli`:
  ```yaml
  # .gitlab-ci.yml
  validate_openapi:
    image: node:18
    script:
      - npx @redocly/cli lint openapi.yaml
  ```
- Integración con GitLab CI para rechazar merges con contratos inválidos.

**Métrica de Éxito**:
- 100% de merges a `main` con contratos validados.
- Reducción del 90% en incidentes por esquemas inconsistentes.

---

### 2. Timeout en Transacciones Críticas
**Descripción**: Latencias superiores a 200ms en transacciones financieras (ej. transferencias entre cuentas).
**Causa**:
- Dependencias externas sin circuit breakers.
- Falta de optimización en consultas a bases de datos.

**Impacto**:
- Pérdida de trazabilidad de transacciones.
- Fallos en cascada en sistemas dependientes.
- Incumplimiento del SLA.

**Mitigación**:
- Implementación de **circuit breakers** con umbrales dinámicos:
  ```yaml
  # Configuración de circuit breaker en el contrato OpenAPI
  paths:
    /transfers:
      post:
        x-circuit-breaker:
          threshold: 5
          resetTimeout: 30s
  ```
- Monitoreo en tiempo real con Prometheus:
  ```promql
  # Métrica para transacciones con latencia > 200ms
  rate(http_request_duration_seconds_sum{path="/transfers", status=~"5.."}[5m]) > 0.1
  ```
- Alertas en Grafana para equipos de operaciones.

**Métrica de Éxito**:
- 99.9% de transacciones con latencia < 200ms.
- Activación de circuit breakers en < 1% de las transacciones.

---

### 3. Pérdida de Trazabilidad en Integraciones
**Descripción**: Transacciones sin registros auditables durante 5 años, violando requisitos regulatorios.
**Causa**:
- Logs efímeros en sistemas distribuidos.
- Falta de correlación entre IDs de transacción.

**Impacto**:
- Incumplimiento de regulaciones financieras.
- Imposibilidad de reconciliación de transacciones.

**Mitigación**:
- Implementación de **trazabilidad distribuida** con IDs únicos:
  ```yaml
  # Extensión OpenAPI para trazabilidad
  components:
    schemas:
      Transaction:
        type: object
        properties:
          transactionId:
            type: string
            format: uuid
            description: "ID único para trazabilidad (5 años)"
          correlationId:
            type: string
            format: uuid
            description: "ID para correlación entre sistemas"
  ```
- Almacenamiento centralizado de logs con Prometheus y Grafana Loki.
- Auditorías trimestrales con OWASP ZAP para validar cumplimiento.

**Métrica de Éxito**:
- 100% de transacciones con IDs únicos registrados.
- Recuperación de logs en < 1 hora para auditorías.

---

### 4. Fallo en la Autenticación FAPI (PSD2)
**Descripción**: Ataques de replay o robo de tokens en flujos de autenticación.
**Causa**:
- Tokens sin expiración corta.
- Falta de validación de claims.

**Impacto**:
- Acceso no autorizado a cuentas.
- Fraudes financieros.

**Mitigación**:
- Implementación de **FAPI (Financial-grade API)** con tokens JWT:
  ```yaml
  # Configuración de seguridad en OpenAPI
  components:
    securitySchemes:
      OAuth2:
        type: oauth2
        flows:
          authorizationCode:
            authorizationUrl: https://auth.example.com/oauth2/authorize
            tokenUrl: https://auth.example.com/oauth2/token
            scopes:
              accounts: "Acceso a cuentas"
        x-token-expiry: 300s
  ```
- Validación automática con OWASP ZAP:
  ```bash
  zap-baseline.py -t https://api.example.com -c security-config.md
  ```

**Métrica de Éxito**:
- 0 incidentes de robo de tokens en 6 meses.
- 100% de tokens con expiración < 5 minutos.

---

### 5. Inconsistencias en el Mapeo de Datos
**Descripción**: Campos transformados incorrectamente entre sistemas (ej. formatos de fecha, monedas).
**Causa**:
- Reglas de transformación no documentadas.
- Falta de validación en pipelines.

**Impacto**:
- Transacciones rechazadas.
- Pérdida financiera por conversiones incorrectas.

**Mitigación**:
- Validación automática del `mapeo-de-datos.csv` en CI:
  ```yaml
  # .gitlab-ci.yml
  validate_mapping:
    image: python:3.9
    script:
      - python validate_mapping.py mapeo-de-datos.csv
  ```
- Ejemplo de regla de transformación:
  ```csv
  Campo Origen,Campo Destino,Tipo,Obligatorio,Regla de Transformación
  fecha_creacion,created_at,datetime,Sí,"DD/MM/AAAA -> YYYY-MM-DD"
  monto,amount,decimal,Sí,"Formato: 1000.00 -> 1000.00 (validar 2 decimales)"
  ```

**Métrica de Éxito**:
- 0 errores en mapeos de datos en producción.
- 100% de reglas documentadas y validadas.

---

## Estrategias de Resiliencia
| Riesgo                | Estrategia                          | Herramienta               | Métrica                          |
|-----------------------|-------------------------------------|---------------------------|----------------------------------|
| Timeout               | Circuit breakers                    | GitLab CI + Prometheus    | % de transacciones con latencia < 200ms |
| Trazabilidad          | IDs únicos + logs centralizados     | Grafana Loki              | % de transacciones con IDs registrados |
| Autenticación         | FAPI + OWASP ZAP                    | OWASP ZAP                 | % de tokens con expiración < 5 min |
| Mapeo de datos        | Validación en CI                    | Script Python             | % de mapeos válidos                |

## Conclusiones
- La implementación de circuit breakers y trazabilidad distribuida reduce el riesgo de fallos en cascada.
- La validación automática de contratos OpenAPI y mapeos de datos minimiza inconsistencias entre equipos.
- El monitoreo con Prometheus/Grafana y auditorías con OWASP ZAP garantizan el cumplimiento del SLA.

## Recomendaciones
1. **Capacitación**: Talleres trimestrales sobre FAPI y trazabilidad para equipos de desarrollo y operaciones.
2. **Simulacros**: Pruebas de fallos cada 6 meses para validar resiliencia.
3. **Documentación**: Actualizar `documentacion/mapa-interacciones.md` con flujos de mitigación.

---
// === ARCHIVO: pruebas/criterios-aceptacion.feature ===
# language: es
Feature: Validación del flujo de integración continuo para transacciones financieras
  Como equipo DevOps
  Quiero asegurar que el flujo de integración cumpla con los requisitos de negocio y técnicos
  Para garantizar la trazabilidad, seguridad y disponibilidad del sistema

  Background:
    Given el sistema maneja 10 000 transacciones por segundo
    And el SLA del sistema es del 99.9%
    And se requiere trazabilidad de transacciones por 5 años

  Scenario: Despliegue exitoso de una nueva versión del contrato OpenAPI
    Given el contrato OpenAPI `openapi.yaml` ha sido modificado
    And los cambios incluyen nuevos endpoints para transacciones internacionales
    When el pipeline de GitLab CI se ejecuta
    Then el contrato debe ser validado con `@redocly/cli` sin errores
    And el pipeline debe completar todas las etapas (build, test, deploy)
    And el despliegue debe ser marcado como "estable" en GitLab
    And los equipos de desarrollo y operaciones deben ser notificados

    Examples:
      | endpoint               | modificacion                          |
      | /transfers/international| Añadido schema para divisas           |
      | /accounts               | Añadido campo "tax_id" obligatorio   |

  Scenario: Fallo en la validación del contrato OpenAPI
    Given el contrato OpenAPI `openapi.yaml` tiene errores de sintaxis
    When el pipeline de GitLab CI se ejecuta
    Then la etapa de validación debe fallar
    And el merge request debe ser rechazado
    And el equipo de desarrollo debe recibir una notificación con los errores

    Examples:
      | error                          |
      | Campo "amount" sin tipo definido |
      | Schema "Transaction" sin required  |

  Scenario: Timeout en una transacción crítica
    Given una transacción con latencia > 200ms
    When el sistema detecta la latencia
    Then se debe activar el circuit breaker
    And se debe registrar el evento en Prometheus
    And se debe enviar una alerta a Grafana
    And el equipo de operaciones debe ser notificado

    Examples:
      | transaccion_id           | latencia |
      | "a1b2c3d4e5f6"         | 250ms    |
      | "f6e5d4c3b2a1"         | 300ms    |

  Scenario: Pérdida de trazabilidad en una transacción
    Given una transacción sin ID de correlación
    When el sistema intenta registrar la transacción
    Then el registro debe ser rechazado
    And se debe generar un error de trazabilidad
    And el equipo de seguridad debe ser notificado

    Examples:
      | transaccion_id           | motivo                          |
      | "x1y2z3"               | ID de correlación faltante      |
      | "z3y2x1"               | ID duplicado                    |

  Scenario: Fallo en la autenticación FAPI
    Given un token JWT con expiración > 5 minutos
    When el sistema valida el token
    Then la autenticación debe ser rechazada
    And se debe registrar el evento en OWASP ZAP
    And el equipo de seguridad debe ser notificado

    Examples:
      | token_id                | expiracion |
      | "jwt123"              | 10 minutos |
      | "jwt456"              | 30 minutos |

  Scenario: Inconsistencia en el mapeo de datos
    Given un mapeo de datos con reglas inválidas
    When el pipeline de CI valida el archivo `mapeo-de-datos.csv`
    Then la validación debe fallar
    And el equipo de desarrollo debe recibir los errores
    And el merge request debe ser rechazado

    Examples:
      | campo_origen    | campo_destino   | error                          |
      | fecha_creacion  | created_at      | Formato incorrecto (DD/MM -> YYYY-MM) |
      | monto           | amount          | Tipo no válido (string -> decimal) |

  Scenario: Despliegue con monitoreo insuficiente
    Given un despliegue sin métricas de latencia configuradas
    When el sistema inicia
    Then el pipeline debe fallar en la etapa de monitoreo
    And se debe notificar al equipo de operaciones
    And el despliegue debe ser revertido automáticamente

    Examples:
      | servicio                | metrica_faltante       |
      | /transfers             | http_request_duration_seconds |
      | /accounts              | error_rate                 |

  Scenario: Fallo en la reconciliación de transacciones
    Given una transacción sin registro en el sistema de trazabilidad
    When se ejecuta el proceso de reconciliación
    Then se debe generar un reporte de discrepancias
    And el equipo de operaciones debe ser notificado
    And se debe activar un proceso manual de investigación

    Examples:
      | transaccion_id           | sistema_origen   | sistema_destino |
      | "t12345"              | Core Banking    | Payment Gateway |
      | "t67890"              | Payment Gateway | SWIFT           |
"


// === ARCHIVO: seguridad/security-config.md ===
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


// === ARCHIVO: seguridad/token-utils.md ===
# Utilidades para Manejo de Tokens

## 1. Generación de Tokens

### 1.1. Script para Generar Tokens JWT (Node.js)
```javascript
const jwt = require('jsonwebtoken');
const { createPrivateKey } = require('crypto');

const privateKey = createPrivateKey({
  key: Buffer.from(process.env.PRIVATE_KEY, 'base64'),
  format: 'der',
  type: 'pkcs8'
});

function generateToken(userId, scopes) {
  return jwt.sign({
    sub: userId,
    scope: scopes.join(' '),
    iss: 'https://auth.banco.com/realms/master',
    aud: 'integracion-api',
    iat: Math.floor(Date.now() / 1000),
    exp: Math.floor(Date.now() / 1000) + 3600
  }, privateKey, { algorithm: 'RS256' });
}

module.exports = { generateToken };
```

### 1.2. Ejemplo de Payload JWT
```json
{
  "sub": "1234567890",
  "scope": "openid profile payments",
  "iss": "https://auth.banco.com/realms/master",
  "aud": "integracion-api",
  "iat": 1712345678,
  "exp": 1712349278,
  "jti": "abcdef1234567890"
}
```

## 2. Validación de Tokens

### 2.1. Middleware para Validación (Express.js)
```javascript
const jwt = require('jsonwebtoken');
const { createPublicKey } = require('crypto');

const publicKey = createPublicKey({
  key: Buffer.from(process.env.PUBLIC_KEY, 'base64'),
  format: 'der',
  type: 'spki'
});

function validateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) return res.sendStatus(401);

  jwt.verify(token, publicKey, { algorithms: ['RS256'] }, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
}

module.exports = validateToken;
```

### 2.2. Validación en Python
```python
import jwt
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

public_key = serialization.load_der_public_key(
    base64.b64decode(os.getenv('PUBLIC_KEY')),
    backend=default_backend()
)

def validate_token(token):
    try:
        return jwt.decode(
            token,
            public_key,
            algorithms=['RS256'],
            audience='integracion-api',
            issuer='https://auth.banco.com/realms/master'
        )
    except jwt.ExpiredSignatureError:
        raise Exception("Token expirado")
    except jwt.InvalidTokenError:
        raise Exception("Token inválido")
```

## 3. Renovación de Tokens

### 3.1. Flujo de Renovación con Refresh Tokens
```mermaid
sequenceDiagram
    participant Cliente
    participant API
    participant AuthServer

    Cliente->>API: POST /token (grant_type=refresh_token)
    API->>AuthServer: Valida refresh_token
    AuthServer-->>API: Nuevo access_token
    API-->>Cliente: { access_token, expires_in }
```

### 3.2. Script para Renovación
```bash
#!/bin/bash

REFRESH_TOKEN="$1"
CLIENT_ID="integracion-api"
CLIENT_SECRET="$2"

curl -X POST "https://auth.banco.com/realms/master/protocol/openid-connect/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=refresh_token" \
     -d "client_id=$CLIENT_ID" \
     -d "client_secret=$CLIENT_SECRET" \
     -d "refresh_token=$REFRESH_TOKEN"
```

## 4. Integración con DevOps

### 4.1. GitLab CI para Gestión de Tokens
```yaml
# .gitlab-ci.yml
variables:
  OAUTH_CLIENT_ID: $OAUTH_CLIENT_ID
  OAUTH_CLIENT_SECRET: $OAUTH_CLIENT_SECRET

stages:
  - test
  - deploy

generate_token:
  stage: test
  image: node:18
  script:
    - npm install jsonwebtoken
    - node -e "console.log(require('./token-utils.js').generateToken('ci-pipeline', ['deploy']))" > token.txt
  artifacts:
    paths:
      - token.txt

deploy:
  stage: deploy
  image: curlimages/curl
  script:
    - TOKEN=$(cat token.txt)
    - curl -H "Authorization: Bearer $TOKEN" https://integracion-api.banco.com/deploy
```

### 4.2. Jenkins Pipeline
```groovy
pipeline {
    agent any
    environment {
        OAUTH_CLIENT_ID = credentials('oauth-client-id')
        OAUTH_CLIENT_SECRET = credentials('oauth-client-secret')
    }
    stages {
        stage('Generate Token') {
            steps {
                script {
                    def token = sh(script: "node token-utils.js generateToken 'jenkins-pipeline' ['deploy']", returnStdout: true).trim()
                    env.TOKEN = token
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "curl -H 'Authorization: Bearer ${env.TOKEN}' https://integracion-api.banco.com/deploy"
            }
        }
    }
}
```

## 5. Buenas Prácticas

### 5.1. Seguridad en Tokens
- **Almacenamiento**: Nunca almacenar tokens en código o repositorios
- **Transmisión**: Usar siempre HTTPS
- **Expiración**: Tokens de corta duración (máximo 1 hora)
- **Refresh Tokens**: Usar solo en backends, no en clientes
- **Alcance**: Seguir el principio de mínimo privilegio

### 5.2. Monitoreo y Auditoría
- Registrar todos los intentos de autenticación (exitosos y fallidos)
- Monitorear la tasa de renovación de tokens
- Alertar sobre patrones inusuales (ej. mismo token usado desde múltiples IPs)

### 5.3. Integración con SLSA
- Firmar los tokens con claves específicas para el pipeline
- Registrar la generación de tokens en el sistema de trazabilidad
- Validar la firma de los tokens en cada etapa del pipeline

## 6. Ejemplo de Integración con OpenAPI

### 6.1. Extensión para Documentación
```yaml
# openapi.yaml
components:
  securitySchemes:
    oauth:
      type: oauth2
      flows:
        authorizationCode:
          authorizationUrl: https://auth.banco.com/realms/master/protocol/openid-connect/auth
          tokenUrl: https://auth.banco.com/realms/master/protocol/openid-connect/token
          scopes:
            openid: Autenticación OpenID
            profile: Perfil de usuario
            payments: Operaciones de pago
      x-token-utils:
        generationScript: scripts/generate-token.js
        validationScript: scripts/validate-token.js
        renewalEndpoint: /token/renew
```

## 7. Superficie de Práctica

### 7.1. Tareas Pendientes
- [ ] Implementar rotación automática de refresh tokens cada 30 días
- [ ] Crear script para revocación masiva de tokens en caso de incidente
- [ ] Configurar alertas para tokens usados después de su expiración
- [ ] Documentar procedimiento para manejo de tokens en entornos híbridos (cloud/on-premise)

### 7.2. Preguntas para Reflexión
- ¿Cómo manejarías la revocación de tokens en un entorno distribuido?
- ¿Qué estrategias usarías para proteger los refresh tokens en sistemas legacy?
- ¿Cómo garantizarías la no repudiación en las operaciones realizadas con estos tokens?
- ¿Qué métricas de seguridad implementarías para monitorear el uso de tokens?
```
