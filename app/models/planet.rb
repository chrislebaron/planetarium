class Planet < ActiveRecord::Base
	validates :name, presence: true
	validates :position, numericality: { only_integer:true, greater_than: 0, less_than_or_equal_to: 8 }
	
	has_many :moons
end
