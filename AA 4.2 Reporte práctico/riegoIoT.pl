% ------------------------------
% Estado de sensores por zona
% ------------------------------
% zona(NombreZona, Humedad, Temperatura, Hora, PronosticoLluvia)

zona(edificio_h, baja, 35, 20, false).
zona(edificio_e, media, 30, 9, true).
zona(salones_j, baja, 33, 7, false).

% ------------------------------
% Reglas generales
% ------------------------------

% 1. Regla: ¿Es una hora adecuada para regar?
hora_adecuada(Hora) :-
    Hora < 10 ; Hora > 18.

% 2. Regla principal: ¿Cuándo se debe activar el sistema de riego para una zona?
activar_riego(Zona) :-
    zona(Zona, Humedad, _, Hora, Lluvia),
    Humedad == baja,
    Lluvia == false,
    hora_adecuada(Hora).

% 3. Estado del riego (por zona)
estado_riego(Zona, 'Activado') :-
    activar_riego(Zona).
estado_riego(Zona, 'No activado') :-
    \+ activar_riego(Zona).

% 4. Regla para alerta de temperatura extrema
alerta_calor(Zona) :-
    zona(Zona, _, Temp, _, _),
    Temp >= 32.

% 5. Recomendaciones automáticas por zona
recomendacion(Zona) :-
    activar_riego(Zona),
    alerta_calor(Zona), !,
    format('Zona ~w: Alerta: Riego activado con temperatura alta. Considere riego nocturno o por goteo.~n', [Zona]).

recomendacion(Zona) :-
    activar_riego(Zona), !,
    format('Zona ~w: Riego activado. Condiciones normales.~n', [Zona]).

recomendacion(Zona) :-
    format('Zona ~w: Sin recomendaciones. Riego no activado o condiciones no óptimas.~n', [Zona]).

% 6. Evaluar recomendaciones para todas las zonas
recomendaciones_todas :-
    zona(Zona, _, _, _, _),
    recomendacion(Zona),
    fail.
recomendaciones_todas.

% 7. Mostrar el estado de riego de todas las zonas
estados_riego_todos :-
    zona(Zona, _, _, _, _),
    estado_riego(Zona, Estado),
    format('Zona ~w: Estado del riego = ~w~n', [Zona, Estado]),
    fail.
estados_riego_todos.