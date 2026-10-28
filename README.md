# Implementación de un flujo de integración continuo en un entorno multi-equipo

Como Analista SOA senior, debes promover la cultura DevOps en un sistema de integración complejo que involucra múltiples equipos distribuidos. El objetivo es mejorar la comunicación y la integración entre los equipos de desarrollo, operaciones y seguridad, comprendiendo el ciclo de vida del desarrollo de software (SDLC) y tu papel como arquitecto en cada etapa. El sistema debe manejar un volumen de 10 000 transacciones por segundo con un SLA del 99.9% y garantizar la trazabilidad de las integraciones durante al menos 5 años.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Participación activa en pro de la cultura DevOps |
| **Nivel** | senior-l2 |
| **Tipo** | mixed |
| **Tiempo estimado** | 2 semanas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración y mapeo del sistema existente

**Objetivo:** Comprender las interacciones actuales entre equipos y sistemas para identificar áreas de mejora.

**Tiempo estimado:** 3 días

**Instrucciones:**

- Analiza el sistema de integración actual para identificar las interacciones entre los equipos de desarrollo, operaciones y seguridad.
- Mapea las dependencias y los puntos de integración clave.
- Identifica las restricciones y ambigüedades actuales en el flujo de trabajo.

**Entregable:** Mapa de interacciones y dependencias con identificación de restricciones y ambigüedades.

<details>
<summary>Pistas de conocimiento</summary>

- Considera los diferentes roles y responsabilidades de cada equipo.
- Evalúa la comunicación actual entre equipos y sistemas.

</details>

### Fase 2: Diseño de un flujo de integración continuo

**Objetivo:** Proponer un flujo de integración que promueva la cultura DevOps y mejore la comunicación entre equipos.

**Tiempo estimado:** 5 días

**Instrucciones:**

- Diseña un flujo de integración continuo que incluya etapas de desarrollo, prueba, despliegue y monitoreo.
- Considera la participación de todos los equipos en cada etapa del flujo.
- Identifica las herramientas y prácticas que pueden mejorar la colaboración y la integración.

**Entregable:** Propuesta de flujo de integración continuo con participación de todos los equipos.

<details>
<summary>Pistas de conocimiento</summary>

- Considera prácticas como CI/CD, revisión por pares y monitoreo continuo.
- Evalúa herramientas que pueden facilitar la colaboración y la integración.

</details>

### Fase 3: Implementación y validación del flujo de integración

**Objetivo:** Implementar y validar el flujo de integración propuesto para asegurar su efectividad.

**Tiempo estimado:** 5 días

**Instrucciones:**

- Implementa el flujo de integración continuo diseñado en la fase anterior.
- Realiza pruebas de integración y valida el funcionamiento del flujo.
- Documenta el proceso y las lecciones aprendidas.

**Entregable:** Flujo de integración continuo implementado y validado con documentación del proceso y lecciones aprendidas.

<details>
<summary>Pistas de conocimiento</summary>

- Considera escenarios de prueba que cubran diferentes etapas del flujo de integración.
- Documenta cualquier desafío y solución encontrada durante la implementación.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es la cultura DevOps y por qué es importante en un entorno de integración complejo?
- **paraQueSirve**: ¿Para qué sirve un flujo de integración continuo en la promoción de la cultura DevOps?
- **comoSeUsa**: ¿Cómo se puede utilizar la colaboración entre equipos para mejorar el flujo de integración?
- **erroresComunes**: ¿Cuáles son los errores comunes en la implementación de un flujo de integración continuo y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño de un flujo de integración continuo que promueva la cultura DevOps?

## Criterios de Evaluacion

- Comprensión del concepto de cultura DevOps y su importancia en un entorno de integración complejo.
- Diseño de un flujo de integración continuo que promueva la cultura DevOps y mejore la comunicación entre equipos.
- Implementación y validación efectiva del flujo de integración continuo.
- Documentación clara y concisa del proceso y las lecciones aprendidas.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
npx --yes @redocly/cli lint openapi.yaml
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
