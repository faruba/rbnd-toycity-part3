require_relative "./errors"

class Product
	attr_reader :title
	@@products = []
	def initialize(options={})
		@title = options[:title]
		add_to_products
	end

	def is_same? (title)
		#?? 
		#def is_same? (product)
		#	return (@title.equal?(product.title))
		#end
		#if Product.all.any? { |product| product.is_same?(self)}
		# don't work. get error: is_same?': undefined local variable or method title.
		# title is an attribute  and `puts (product.title)`  do not get any error
		return @title.eql?(title)
	end

	def add_to_products
		# much pretty >> Product.all.any? Product.==
		# or I miss something? 
		if Product.all.any? { |product| product.is_same?(@title)}
			raise DuplicateProductError , "#{@title} already exists."
		else
			@@products << self 
		end
	end

	def self.all
		@@products
	end

	#how do I DRY? same code in add_to_products
	def self.find_by_title(title)
		Product.all.select { |product| product.is_same?(title)}[0]
	end
end
