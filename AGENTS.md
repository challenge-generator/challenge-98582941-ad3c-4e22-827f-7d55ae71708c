# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Implementación de un flujo de integración continuo en un entorno multi-equipo**.

| | |
|---|---|
| Tema | Participación activa en pro de la cultura DevOps |
| Nivel | senior-l2 |
| Chapter | Integración — Analista |
| Especialidad | SOA |
| Stack | YAML / OpenAPI 3.1 |
| Patron arquitectonico | Contrato primero con flujo de integración orquestado y validación de seguridad |
| Tiempo estimado | 2 semanas |

## Receta del stack

Esqueleto obligatorio:

- `openapi.yaml`
- `proceso.bpmn.md`
- `mapeo-de-datos.csv`

Dependencias:

- @redocly/cli 1.12.0
- BPMN.js n/a
- OpenAPI Generator 6.6.0
- GitLab CI/CD n/a
- Prometheus + Grafana n/a
- OWASP ZAP n/a

## Tu tarea

Dejar este conjunto de artefactos en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `npx --yes @redocly/cli lint openapi.yaml` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `npx --yes @redocly/cli lint openapi.yaml` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Exploración y mapeo del sistema existente**: Mapa de interacciones y dependencias con identificación de restricciones y ambigüedades.
- **Fase 2 — Diseño de un flujo de integración continuo**: Propuesta de flujo de integración continuo con participación de todos los equipos.
- **Fase 3 — Implementación y validación del flujo de integración**: Flujo de integración continuo implementado y validado con documentación del proceso y lecciones aprendidas.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `seguridad/security-config.md` — El topic pide autenticacion/seguridad: este archivo es el ejercicio.
- [ ] `openapi.yaml` — El topic pide el contrato de API: openapi.yaml es el ejercicio.

## Lo que falta y tenes que completar

### 1. Archivos que la arquitectura declara (3 de 14)

La propuesta arquitectonica del reto los lista y no llegaron al repo. Crealos con implementacion real, respetando la capa en la que viven:

- [ ] `README.md`
- [ ] `contratos/integracion-openapi.yaml`
- [ ] `contratos/mapeo-datos.csv`

### Presentes (13)

- `analisis-riesgo.md`
- `criteriios-aceptacion.feature`
- `seguridad/security-config.md`
- `seguridad/token-utils.md`
- `openapi.yaml`
- `proceso.bpmn.md`
- `mapeo-de-datos.csv`
- `diagramas/flujo-integracion.bpmn.md`
- `documentacion/mapa-interacciones.md`
- `documentacion/propuesta-flujo-ci.md`
- `documentacion/lecciones-aprendidas.md`
- `documentacion/analisis-riesgo.md`
- `pruebas/criterios-aceptacion.feature`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `diagramas`
- `contratos`
- `documentacion`
- `pruebas`
- `seguridad`

## Verificacion

```bash
npx --yes @redocly/cli lint openapi.yaml
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **Contrato primero con flujo de integración orquestado y validación de seguridad**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Integración, Especialidad Analista SOA, Tecnología Integración, Senior
- Brecha que el reto ataca: Promueve la comunicación e integración entre equipos de desarrollo, operaciones y seguridad. Comprende el SDLC (Software Development Life Cicle) y tu participación como arquitecto en cada parte del ciclo.
- Mision: Candidato con experiencia senior como Analista SOA, trabajando en sistemas de integración complejos con múltiples equipos distribuidos.

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
