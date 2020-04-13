class Subscription < ActiveRecord::Base 
    belongs_to :users

    validates :name, :amount, presence: true
    validates :amount, numericality: true 
end 