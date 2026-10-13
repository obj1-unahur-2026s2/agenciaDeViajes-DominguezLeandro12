class Coordinador {
    var property viajesRealizados
    var property estaMotivado
    var property aniosExperiencia
    var property rol

    method cambiarRol(nuevoRol) {
        if (nuevoRol != "Guía" && nuevoRol != "Asistente logístico" && nuevoRol != "Acompañante") {
            self.error("Rol inválido")
        }
        rol = nuevoRol
    }
}

lass Beneficio {
  var property tipo
  var property costo
  var property estaVigente
}

class PackViaje {
  var property duracionDias
  var property precioBase
  var property beneficios = []
  var property coordinador

  method costoBeneficiosVigentes() {
    return beneficios.filter({b => b.estaVigente()}).sum({b => b.costo()})
  }

  method valorFinal() {
    const baseConBeneficios = precioBase + self.costoBeneficiosVigentes()
    const conRecargo = if (self.esInternacional()) baseConBeneficios * 1.2 else baseConBeneficios
    return if (self.esPremium()) conRecargo * 1.05 else conRecargo
  }

  method esInternacional() = false
  method esNacional() = false
  method esPremium()
}