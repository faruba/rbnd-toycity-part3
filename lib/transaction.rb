require_relative "./set"

class Transaction < SetContainer
	@@uuid = 0
	@@transactions = []
	attr_reader :customer, :product, :id
	def initialize(customer, product)
		@@uuid += 1
		@id = @@uuid
		@customer = customer 
		@product = product
		product.sell
		SetContainer.add_to(@@transactions, self)
	end

	def is_same?(trans)
		return trans.id == @id
	end

	def self.all
		@@transactions
	end
	def self.find(id)
		@@transactions.select { |trans| trans.id == id}[0]
	end
	def self.find_by_customer(customer)
		@@transactions.select { |trans| trans.customer == customer}
	end
end


