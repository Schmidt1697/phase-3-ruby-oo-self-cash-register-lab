require 'pry'

# Add items of varying quantities and prices
# Calculate discounts
# Keep track of what's been added to it
# Void the last transaction

class CashRegister

    attr_reader :discount, :items
    attr_accessor :total, :last_price

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @last_price = 0
    end

    ##accepts optional quantity
    def add_item(title, price, quantity=1)
        quantity.times do
            self.items << title
        end
        self.last_price = price * quantity
        self.total += price * quantity
    end

     def apply_discount
        if (self.discount > 0)
            self.total = self.total - (self.discount/100.0 * self.total)
            "After the discount, the total comes to $#{self.total.round}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if self.total <= 0
            self.total = 0.0
        else
        self.total -= self.last_price
        end
    end

end

cash_register = CashRegister.new
cash_reg_w_discount = CashRegister.new(20)
# cash_reg_w_discount.add_item('cookie', 5, 2)
# puts cash_reg_w_discount.apply_discount
# puts cash_reg_w_discount
binding.pry


##start from add_discount - not working 