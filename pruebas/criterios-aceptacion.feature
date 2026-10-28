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