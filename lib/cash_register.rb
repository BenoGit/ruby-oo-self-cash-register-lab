class CashRegister
    attr_accessor :items, :discount, :total, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, amount, quantity = 1) #instance method
        self.total += amount * quantity #instance variable
        quantity.times do
            items << title
        end
        self.last_transaction = amount * quantity #self. uses writer method; while @ uses class instance
    end

    def apply_discount
        if discount !=0
            self.total = (total*((100.0-discount.to_f)/100)).to_i #intergar has no decimal, float does have decimal places
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total -= self.last_transaction
    end
end
