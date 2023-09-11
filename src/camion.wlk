object camion {
	const carga = []
	const taraCamion = 1000
	const pesoMaximo = 2500
	
	method cargar(cosa) {carga.add(cosa)}	
	
	method descargar(cosa) {carga.remove(cosa)}
	
	method hayAlgunoQuePesa(peso) = carga.any({cosa => cosa.peso() == peso})
	
	method esDelNivel(nivel) = carga.find({cosa => cosa.nivelDePeligrosidad() == nivel})
	
	method pesoTotal() = carga.sum({cosa => cosa.peso()}) + taraCamion
	
	method excedidoDePeso() = self.pesoTotal() >= pesoMaximo
	
	method objetosQueSuperanPeligrosidad(nivel) = carga.filter({cosa => cosa.nivelDePeligrosidad() > nivel})
 
 	method objetosMasPeligrososQue(cosa) = carga.filter({x => x.nivelDePeligrosidad() > cosa.nivelDePeligrosidad()})
 	
 	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = 
 	!self.excedidoDePeso() && !carga.any({cosa => cosa.nivelDePeligrosidad() > nivelMaximoPeligrosidad})
	

}

