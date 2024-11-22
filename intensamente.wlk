// --------------------------------------
// Persona
// --------------------------------------

class Persona{
  const edad
  const emociones = []
  method esAdolecente() = edad > 12 && edad <19

  method nuevaEmocion(emocion) {
    emociones.add(emocion)
  }
  // Explotar emocionalmente


  // vivir un evento

}

// --------------------------------------
// Eventos
// --------------------------------------
class Evento {
  const property descrippcion 

}

// --------------------------------------
// Emociones
// --------------------------------------

class Emocion {

  method cuantosEventosExperimento() 

  method liberarse() 

}

class Furia inherits Emocion{
  var intencidad = 100

}

class Alegria inherits Emocion{

}

class Tristeza inherits Emocion{

}