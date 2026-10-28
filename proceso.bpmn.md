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