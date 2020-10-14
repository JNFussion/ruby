
class Calculator
    def add(*numb)
        numb.sum
    end

    def multiply(*numb)
        numb.reduce(:*)
    end
end