% -----------------------------------------------
% Base de conocimientos sobre vulnerabilidades
% -----------------------------------------------

% -------------------------
% Hechos
% -------------------------

% Sistemas registrados
sistema(servidor1).
sistema(servidor2).

% Software instalado en cada sistema
software(servidor1, apache).
software(servidor1, mysql).
software(servidor2, nginx).
software(servidor2, php5).

% Versiones consideradas inseguras
version_insegura(mysql).
version_insegura(php5).

% Puertos abiertos por sistema
puerto_abierto(servidor1, 22).      % SSH
puerto_abierto(servidor1, 3306).    % MySQL
puerto_abierto(servidor2, 21).      % FTP

% Estado del firewall
tiene_firewall(servidor1).
no_tiene_firewall(servidor2).

% Contraseñas débiles
contrasena_debil(servidor2).

% Estado del antivirus
tiene_antivirus(servidor1).
no_tiene_antivirus(servidor2).

% -------------------------
% Reglas
% -------------------------

% Vulnerabilidad: software desactualizado o inseguro
vulnerabilidad(Sistema, software_desactualizado(Software)) :-
    software(Sistema, Software),
    version_insegura(Software).

% Vulnerabilidad: puerto FTP abierto sin firewall
vulnerabilidad(Sistema, puerto_inseguro(Puerto)) :-
    puerto_abierto(Sistema, Puerto),
    Puerto = 21,
    no_tiene_firewall(Sistema).

% Vulnerabilidad: no tiene firewall
vulnerabilidad(Sistema, sin_firewall) :-
    no_tiene_firewall(Sistema).

% Vulnerabilidad: contraseña débil
vulnerabilidad(Sistema, contrasena_debil) :-
    contrasena_debil(Sistema).

% Vulnerabilidad: sin antivirus
vulnerabilidad(Sistema, sin_antivirus) :-
    no_tiene_antivirus(Sistema).

% -------------------------
% Reglas de acción recomendada
% -------------------------

accion_recomendada(Sistema, actualizar_software(Software)) :-
    vulnerabilidad(Sistema, software_desactualizado(Software)).

accion_recomendada(Sistema, cerrar_puerto(Puerto)) :-
    vulnerabilidad(Sistema, puerto_inseguro(Puerto)).

accion_recomendada(Sistema, instalar_firewall) :-
    vulnerabilidad(Sistema, sin_firewall).

accion_recomendada(Sistema, fortalecer_contrasena) :-
    vulnerabilidad(Sistema, contrasena_debil).

accion_recomendada(Sistema, instalar_antivirus) :-
    vulnerabilidad(Sistema, sin_antivirus).
