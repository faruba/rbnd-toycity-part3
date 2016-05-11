require_relative "./errors"
require_relative "./set"

class Product <  SetContainer
	attr_reader :title , :price, :stock
	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products(self){ |item |
			raise DuplicateProductError , "#{@title} already exists."
		}
	end

	def is_same? (product)
		return @title.eql?(product.title)
	end

	def in_stock?
		@stock > 0
	end

	def self.find_by_title(title)
		Product.all.select { |product| product.title.eql?(title)}[0]
	end

	def self.in_stock
		Product.all.select { |product| product.in_stock?}
	end
end
