require_relative "./set"

class Custom <  SetContainer
	attr_reader :name

	def initialize(options={})
		@name = options[:name]
	end

	def find_by_name(name)
	end
end

#Customer.new(name: "Walter Latimer")
#Customer.new(name: "Julia Van Cleve")

# puts Customer.all.count # Should return 2

# Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists.

# walter = Customer.find_by_name("Walter Latimer")

# puts walter.name # Should return "Walter Latimer"


