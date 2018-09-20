class Taxon < Ficha

	#establish_connection(:fichasespecies)

 	# Asignación de tabla
	self.table_name = 'taxon'

	self.primary_key = 'especieId'

	has_many :caracteristicasEspecies, :class_name => 'Caracteristicasespecie', :foreign_key => 'especieId'
	has_many :conservacion, :class_name => 'Conservacion', :foreign_key => 'especieId'
	has_many :demografiaAmenazas, :class_name=> 'Demografiaamenazas', :foreign_key => 'especieId'
	has_many :distribuciones, :class_name => 'Distribucion', :foreign_key => 'especieId'
  has_many :endemicas, :class_name => 'Endemica', :foreign_key => 'especieId'
	has_many :habitats, class_name: 'Habitat', :foreign_key => 'especieId'
	has_one :historiaNatural, class_name: 'Historianatural', :foreign_key => 'especieId'
	has_many :legislaciones, class_name: 'Legislacion', :foreign_key => 'especieId'
	has_many :metadatos, class_name: 'Metadatos', :foreign_key => 'especieId'
	has_one :nombreComun, class_name: 'Nombrecomun', :foreign_key => 'especieId'
	has_many :productoComercios, class_name: 'Productocomercio', :foreign_key => 'especieId'
	has_many :sinonimos , class_name: 'Sinonimo', :foreign_key => 'especieId'
	has_many :referenciasBibliograficas, class_name: 'Referenciabibliografica', :foreign_key => 'especieId'

end