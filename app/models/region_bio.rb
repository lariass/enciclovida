class RegionBio < ActiveRecord::Base

  self.table_name='Region'
  self.primary_key='IdRegion'

  alias_attribute :nombre_region, :NombreRegion
  alias_attribute :clave_region, :ClaveRegion
  alias_attribute :id_region_asc, :IdRegionAsc
  alias_attribute :tipo_region_id, :IdTipoRegion

  belongs_to :tipo_region, :class_name => 'TipoRegionBio', :foreign_key => 'IdTipoRegion'
  has_many :especies_regiones, :class_name => 'EspecieRegion', :foreign_key => 'region_id'
  #has_ancestry

  scope :regiones_principales, ->(id) { where(:tipo_region_id => id).where("nombre_region != 'ND'").order(:nombre_region) }
  scope :regiones_especificas, lambda {|id|
    region=find(id)
    region.children.where("nombre_region != 'ND'").order(:nombre_region)
  }


  def personalizaBusqueda
    if self.ancestry.present?
      parientes ||=''
      Region.find(self.ancestry.split('/').push(self.id)).each do |reg|
        parientes+="#{reg.nombre_region} (#{TipoRegion.find(reg.tipo_region_id).descripcion}) > "
      end
      parientes[0..-4]
    else
      "#{self.nombre_region} (#{TipoRegion.find(self.tipo_region_id).descripcion})"
    end
  end
end
