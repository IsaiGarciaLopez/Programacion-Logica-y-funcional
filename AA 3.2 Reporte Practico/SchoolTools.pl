% Hechos 
herramienta(khan_academy, [tipo(tutoria), plataforma(web), nivel(primaria), nivel(secundaria), licencia(gratis)]).
herramienta(edmodo, [tipo(plataforma), plataforma(web), nivel(primaria), nivel(secundaria), licencia(gratis)]).
herramienta(quizlet, [tipo(repaso), plataforma(web), plataforma(app), nivel(secundaria), nivel(universidad), licencia(gratis)]).
herramienta(duolingo, [tipo(idiomas), plataforma(app), nivel(primaria), nivel(secundaria), nivel(universidad), licencia(gratis)]).
herramienta(coursera, [tipo(cursos), plataforma(web), nivel(universidad), licencia(pago)]).
herramienta(moodle, [tipo(plataforma), plataforma(web), nivel(secundaria), nivel(universidad), licencia(gratis)]).
herramienta(udemy, [tipo(cursos), plataforma(web), plataforma(app), nivel(secundaria), nivel(universidad), licencia(pago)]).
herramienta(google_classroom, [tipo(plataforma), plataforma(web), plataforma(app), nivel(secundaria), nivel(universidad), licencia(gratis)]).

% Reglas para recomendaciones

% Recomendación por nivel educativo
recomendar_por_nivel(Nivel, Herramienta) :- herramienta(Herramienta, Caracteristicas), member(nivel(Nivel), Caracteristicas).

% Recomendación por tipo de herramienta
recomendar_por_tipo(Tipo, Herramienta) :- herramienta(Herramienta, Caracteristicas), member(tipo(Tipo), Caracteristicas).

% Recomendación por plataforma
recomendar_por_plataforma(Plataforma, Herramienta) :- herramienta(Herramienta, Caracteristicas), member(plataforma(Plataforma), Caracteristicas).

% Recomendación por licencia
recomendar_por_licencia(Licencia, Herramienta) :- herramienta(Herramienta, Caracteristicas), member(licencia(Licencia), Caracteristicas).