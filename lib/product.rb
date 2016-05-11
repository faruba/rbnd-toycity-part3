require_relative "./errors"
require_relative "./set"

class Product <  SetContainer
	@@products = []
	attr_reader :title , :price, :stock
	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		SetContainer.add_to(@@products, self){ |item |
			raise DuplicateProductError , "#{@title} already exists."
		}
	end

	def is_same? (product)
		return @title.eql?(product.title)
	end

	def in_stock?
		@stock > 0
	end

	def sell
		if in_stock?
			@stock -= 1
		else
			raise OutOfStockError, "#{@title} is out of stock."
		end
	end

	def self.all
		@@products
	end
	def self.find_by_title(title)
		Product.all.select { |product| product.title.eql?(title)}[0]
	end

	def self.in_stock
		Product.all.select { |product| product.in_stock?}
	end
end
