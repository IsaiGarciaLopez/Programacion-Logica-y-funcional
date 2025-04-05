def agregar_asignatura(lista):
    asig_nueva = input("Escribe la asignatura nueva o 'no'para salir: ")
    if asig_nueva== "no":
        return lista
    return agregar_asignatura(lista + [asig_nueva]) #rescursion 

asignaturas = ["redes", "inteligencia", "aplicaciones moviles"]
nueva_lista = agregar_asignatura(asignaturas)