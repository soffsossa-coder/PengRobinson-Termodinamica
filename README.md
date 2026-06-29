# PengRobinson-Termodinamica

Biblioteca MATLAB desarrollada para el estudio de propiedades termodinámicas de fluidos reales utilizando la ecuación de estado de Peng-Robinson (PR).

## Objetivo

Implementar herramientas para el cálculo de propiedades termodinámicas de sustancias puras mediante una ecuación cúbica de estado, permitiendo analizar procesos de compresión, expansión y cambios de estado de fluidos reales.

## Capacidades del proyecto

* Cálculo de presión, volumen molar y temperatura mediante la ecuación de Peng-Robinson.
* Obtención del factor de compresibilidad (Z).
* Cálculo de propiedades residuales.
* Cálculo de variaciones de energía interna (ΔU).
* Cálculo de variaciones de entalpía (ΔH).
* Cálculo de variaciones de entropía (ΔS).
* Cálculo de trabajo en procesos de compresión y expansión.
* Evaluación de derivadas termodinámicas necesarias para las relaciones de propiedades.

## Archivos principales

### Ecuación de estado

* PengRobinson.m
* PRcompuesto.m

### Propiedades ideales

* CpCompuesto.m
* CvCompuesto.m
* DeltaHig.m
* DeltaUig.m
* DeltaSig.m

### Propiedades reales

* DeltaHreal.m
* DeltaUReal.m
* DeltaSreal.m
* HresPR.m

### Integración numérica

* Integral_H_PR.m
* Integral_U_PR.m
* Integral_S_PR.m

## Sistema de unidades

Todas las funciones utilizan unidades SI:

| Propiedad              | Unidad              |
| ---------------------- | ------------------- |
| Temperatura            | K                   |
| Presión                | Pa                  |
| Volumen molar          | m³/mol              |
| Energía interna        | J/mol               |
| Entalpía               | J/mol               |
| Entropía               | J/mol·K             |
| Constante de los gases | 8.314462618 J/mol·K |

## Fundamento teórico

La ecuación de estado de Peng-Robinson utilizada es:

P = RT/(v-b) - a(T)/(v(v+b)+b(v-b))

donde:

* P = presión
* T = temperatura
* v = volumen molar
* a(T) = parámetro atractivo dependiente de la temperatura
* b = parámetro covolumen

## Alcance

Este proyecto fue desarrollado con fines académicos para la asignatura de Termodinámica y está orientado al estudio de propiedades termodinámicas de fluidos reales mediante ecuaciones cúbicas de estado.

## Verificación requerida

Se solicita revisar:

1. Correcta implementación de la ecuación de Peng-Robinson.
2. Consistencia matemática de las derivadas termodinámicas.
3. Correcta formulación de las integrales para ΔU, ΔH y ΔS.
4. Consistencia de unidades.
5. Estabilidad numérica.
6. Selección adecuada de raíces.
7. Posibles errores de programación y oportunidades de mejora.
