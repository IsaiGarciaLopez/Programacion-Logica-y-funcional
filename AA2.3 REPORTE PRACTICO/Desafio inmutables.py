#Ejemplo 1 inmutabilidad, funcion pura y sin eefecto secundarios 
variable_global = 10 #variable global 

def aumentar_variable ():
    return variable_global + 1 # no se modifica la variable global, se retorna un nuevo valor 

print(aumentar_variable())