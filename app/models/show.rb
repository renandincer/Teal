class Show < ActiveRecord::Base
	has_and_belongs_to_many :djs
	has_many :episodes
end