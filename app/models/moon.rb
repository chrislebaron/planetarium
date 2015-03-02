class Moon < ActiveRecord::Base
	belongs_to :planet
	belongs_to :user
end
