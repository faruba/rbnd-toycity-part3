class Transaction
	@@uuid = 0
	attr_reader :customer, :product, :id
	def initialize(customer, product)
		@@uuid += 1
		@id = @@uuid
		@customer = customer 
		@product = product
	end
end


