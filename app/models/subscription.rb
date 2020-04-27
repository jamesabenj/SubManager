class Subscription < ActiveRecord::Base 
    belongs_to :user

    validates :name, :amount, presence: true
    validates :amount, numericality: true 
end 