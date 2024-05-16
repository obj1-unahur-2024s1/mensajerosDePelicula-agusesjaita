
object mensajeria {
	const mensajeros = []
	const paquetesPendientes = []
	var dineroGanado = 0
	
	method contratarMensajero(mensajere) = mensajeros.add(mensajere)
	
	method despedirMensajero(mensajere) = mensajeros.remove(mensajere)
	
	method despedirATodos() = mensajeros.clear()
	
	method esGrande() = mensajeros.size() > 2
	
	method puedeSerEntregadoPorPrimero(paquete) = self.puedeLlevarPaquete(paquete, mensajeros.first()) 
	
	method ultimoPeso() = mensajeros.last().peso()
	
	method puedeLlevarPaquete(paquete, mensajero, destino) = paquete.estaPago() and destino.puedePasar(mensajero)
	
	method puedeLlevarPaquete(paquete, mensajero) = paquete.estaPago() and self.aDondePuedePasar(mensajero).puedePasar(mensajero)
	
	method puedeAlguienLlevarElPaquete(paquete) = mensajeros.any({mensajero => self.puedeLlevarPaquete(paquete, mensajero)})

	method mensajerosQuePuedenLlevar(paquete) = mensajeros.find({mensajero => self.puedeLlevarPaquete(paquete, mensajero)})
	
	method tieneSobrepeso() = mensajeros.sum({mensajero => mensajero.peso()}) > 500
	
	method enviarPaquete(paquete) {if (self.puedeAlguienLlevarElPaquete(paquete)) dineroGanado = dineroGanado + paquete.precio()
									else paquetesPendientes.add(paquete)}
		
	method facturacionTotal() = dineroGanado
	
	method enviarPaquetes(paquetes) = paquetes.forEach({paquete => self.enviarPaquete(paquete)})
	
	method enviarPaqueteCaro() {
		const paqueteMasCaro = paquetesPendientes.max({paquete => paquete.precio()})
		
		if (not self.puedeAlguienLlevarElPaquete(paqueteMasCaro)) {} else self.enviarPaquete(paqueteMasCaro) paquetesPendientes.remove(paqueteMasCaro)
	} 
	
	method aDondePuedePasar(mensajero) {return if(puenteDeBrookling.puedePasar(mensajero)) puenteDeBrookling else laMatrix}
}


//Destinos posibles
object puenteDeBrookling {
	method puedePasar(mensajero) {
		return mensajero.peso() < 1000  
	}
}

object laMatrix {
	method puedePasar(mensajero) {
		return mensajero.puedeLlamar()
	}
}