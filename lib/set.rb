
class SetContainer
protected
	def self.add_to(items, item_check, &on_exists)
		if items.any? { |item| item_check.is_same?(item)}
			if on_exists
				on_exists.call(item_check)
			end
		else
			items << item_check
		end
	end

end
