% hechos que representan el arbol mujer(rosa).
/*
mujer(rosa).
mujer(paloma).
mujer(fabiola).
mujer(suzuky).

madre(rosa, paloma).
madre(rosa, fabiola).
madre(rosa, suzuky).
*/

%Datos sobre empleados
/*
empleado(juan,35, ingeniero).
empleado(maria,28, analista).
empleado(pedro,40, gerente).

%Crear regla para consultar empleados menores a 30 años
joven(Persona):- empleado(Persona, Edad, _), Edad < 30.
*/

% Sistema de respuesta a saludos en Prolog

saludo_respuesta(Saludo) :- 
    member(Saludo, ["Hola", "¿Cómo estás?", "Buenos días", "¿Qué tal?"]), 
    responder_saludo(Saludo). 

% Versión alternativa sin caracteres especiales
responder_saludo("Hola") :- 
    write('Hola! En que puedo ayudarte?'), nl.
responder_saludo("¿Cómo estás?") :- 
    write('Estoy bien, gracias por preguntar.'), nl.
responder_saludo("Buenos días") :- 
    write('Buenos dias! Como puedo ayudarte hoy?'), nl.
responder_saludo("¿Qué tal?") :- 
    write('Todo bien, y tu?'), nl.