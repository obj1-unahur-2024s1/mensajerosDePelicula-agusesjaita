object roberto {
	var peso
	var vehiculo
	
	method pesa(cantidad) {peso = cantidad}
	
	method transporte(cual) {vehiculo = cual}
	
	method peso() = if (vehiculo == "bicicleta") peso + 5 else peso + camion.peso()
	
	method puedeLlamar() = false
	
}
object camion {
	var cantDeAcoplados = 0
	
	method cargarAcoplados(cantidad) {cantDeAcoplados = cantDeAcoplados + cantidad}
		
	method peso() {return 500 * cantDeAcoplados}
}


object chuckNorris {
	method peso() = 80 // para que entienda que 1000 kilos es mayor a 900 gramos
	
	method puedeLlamar() = true
}

object neo {
	var credito
	
	method peso() = 0
	
	method tieneCredito(estado) {credito = estado}
	
	method puedeLlamar() {return credito}
	
}
