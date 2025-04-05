
# Lista original
asignaturas_viii = ["PWeb backend", "redes", "inteligencia", "aplicaciones moviles"]

# Función para agregar asignatura
def agregar_asignatura(lista, asignatura):
    return lista + [asignatura]
pregunta = input('INgresa nueva asignatura: ')

print(agregar_asignatura(asignaturas_viii,pregunta))