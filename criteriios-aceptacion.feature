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