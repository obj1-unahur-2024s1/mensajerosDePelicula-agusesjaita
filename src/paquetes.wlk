import mensajeria.*

object paquetito {
	method estaPago() = true
	
	method puedeLlevarlo(mensajero) = true
	
	method precio() = 0
}

object paquetonViajero {
	var cantidadPagada = 0
	
	method estaPago() {return cantidadPagada == 100}
	
	method pagar(cantidad) {cantidadPagada = cantidadPagada.min(cantidadPagada + cantidad)}
	
	method puedeLlevarlo(mensajero) = puenteDeBrookling.puedePasar(mensajero) and laMatrix.puedePasar(mensajero)
	
	method precio() = 100
}

object paqueteOriginal {
	var cantidadPagada = 0
	
	method estaPago() {return cantidadPagada == 50}
	
	method pagar(cantidad) {cantidadPagada = cantidadPagada.min(cantidadPagada + cantidad)}
	
	method puedeLlevarlo(mensajero) = true
	
	method precio() = 50
}