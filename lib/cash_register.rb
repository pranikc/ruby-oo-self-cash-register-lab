class CashRegister
    attr_accessor :total, :discount, :num_items, :curr_price, :curr_quantity

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @num_items = []
	@curr_price = 0
	@curr_quantity = 0
    end

    def add_item(item_name, price, quantity = 1)
        quantity.times do
		 self.num_items << item_name
	end

	@curr_price = price
	@curr_quantity = quantity

        self.total = self.total + @curr_price * @curr_quantity
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.total * (self.discount.to_f / 100.to_f)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @num_items
    end

    def void_last_transaction
        self.total -= self.curr_price * self.curr_quantity
    end
end
