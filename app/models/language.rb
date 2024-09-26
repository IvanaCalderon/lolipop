class Language < ApplicationRecord
    enum status: { inactive: 0, active: 1 }

    has_and_belongs_to_many :candidates

    validates :name, presence: true
    validates :status, inclusion: { in: statuses.keys }

     # Permitir los atributos específicos para búsqueda en ActiveAdmin/Ransack
  def self.ransackable_attributes(auth_object = nil)
    [ "name", "status"]
  end

  # Permitir las asociaciones para búsqueda
  def self.ransackable_associations(auth_object = nil)
    [] # Si no tienes asociaciones que deban ser buscadas, puedes devolver una lista vacía.
  end
end
