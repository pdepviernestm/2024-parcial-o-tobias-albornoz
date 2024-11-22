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

  // vivir un evento
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
  const property descrippcion 
  const property impacto 
}

// --------------------------------------
// Emociones
// --------------------------------------

class Emocion {
  var intensidad
  var eventosVividos = 0
  method cuantosEventosExperimento() = eventosVividos
  method vivioEvento() {
    eventosVividos += 1
  }

  method puedeLiberarse() 
  method liberar(evento) 

  method disminuirIntensidad(cant) {
    intensidad -= cant
  }

}

class Furia inherits Emocion{
  const palabrotas = []

  method aprenderPalabrota(palabrota) =
     palabrotas.add(palabrota)

  method olvidarPrimerPalabrota() {
    
  }

  override method puedeLiberarse() {
    palabrotas.any({palabrota => palabrota.size() > 7})
  }

  override method liberar(evento){
    self.disminuirIntensidad(evento.impacto())
    self.olvidarPrimerPalabrota()  
  }

}

class Alegria inherits Emocion{

}

class Tristeza inherits Emocion{

}