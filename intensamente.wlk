object global {
  var property intensidadElevada = 80
}

// --------------------------------------
// Persona
// --------------------------------------

class Persona{
  const edad
  const emociones = []
  method esAdolecente() = edad > 12 && edad <19

  method agregarEmocion(emocion) {
    emociones.add(emocion)
  }

  method estaPorExplotar() {
    emociones.all({emocion => emocion.puedeLiberarse()})
  }

  method vivirEvento(evento) {
    emociones.forEach({ emocion=>
      emocion.vivioEvento()
      if(emocion.puedeLiberarse()){
        emocion.liberar()
      }
    })
  }
}

// --------------------------------------
// Eventos
// --------------------------------------
class Evento {
  const property descripcion 
  const property impacto 
}

// --------------------------------------
// Emociones
// --------------------------------------

class Emocion {
  var property intensidad
  var eventosVividos = 0
  method cuantosEventosExperimento() = eventosVividos
  method vivioEvento() {
    eventosVividos += 1
  }

  method puedeLiberarse() 
  method liberar(evento) {
    self.disminuirIntensidad(evento.impacto())
  }

  method disminuirIntensidad(cant) {
    intensidad -= cant
  }

}

class Furia inherits Emocion (intensidad = 100){
  const palabrotas = []

  method aprenderPalabrota(palabrota) =
     palabrotas.add(palabrota)

  method olvidarPrimerPalabrota() {
    
  }

  override method puedeLiberarse() {
    palabrotas.any({palabrota => palabrota.size() > 7})
  }

  override method liberar(evento){
    super(evento)
    self.olvidarPrimerPalabrota()  
  }

}

class Alegria inherits Emocion{
  override method puedeLiberarse() = 
    intensidad > global.intensidadElevada 
     && (eventosVividos % 2 == 0)

  override method disminuirIntensidad(cant) {
    self.intensidad((self.intensidad() - cant).abs())
  }
}

class Tristeza inherits Emocion{
  var causa = "melancolia"

  override method puedeLiberarse() =
    intensidad > global.intensidadElevada 
     && causa != "melancolia"
     
  override  method liberar(evento) {
    super(evento)
    causa = evento.descripcion() 
  }

}

class Desagrado inherits Emocion {
    override method puedeLiberarse() =
     intensidad > global.intensidadElevada
        && eventosVividos > intensidad

}

class Temor inherits Desagrado {}

class Ansiedad inherits Emocion {
  var picosAnsiedad = 0 

  override method puedeLiberarse() =
    intensidad > global.intensidadElevada 
      && picosAnsiedad > 3

  override method liberar(evento) {
    super(evento)
    picosAnsiedad += 1
  }
}

/*
La herencia nos permitio modelar caracteristicas comunes de las emociones por ejemplo la intencidad y la cantidad de eventos vividios evitando asi la repeticion de codigo
El polimorfismo nos permitio implentar la logica especifica para cada emocion sin tener que alterar otras partes del codigo ya que sigen entendiendo los mismos mensaje pero comportandose de manera distinta cada uno
*/