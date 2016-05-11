require_relative "./set"

class Customer<  SetContainer
	@@items = []
	attr_reader :name
	def initialize(options={})
		@name = options[:name]
		SetContainer.add_to(@@items, self){ |custom|
			raise DuplicateProductError , "#{@name} already exists."
		}

	end

	def is_same? (custom)
		return @name.eql?(custom.name)
	end

	def purchase(product)
		Transaction.new(self,product) 
	end

	def self.find_by_name(name)
		@@items.select { |custom| custom.name.eql?(name)}[0]
	end

	def self.all
		@@items
	end
end

