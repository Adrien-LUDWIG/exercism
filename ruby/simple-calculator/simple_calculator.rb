class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    if !(ALLOWED_OPERATIONS.include? operation)
      raise UnsupportedOperation.new("Supported operations are: #{ALLOWED_OPERATIONS}")
    end
    
    if first_operand.class != Integer || second_operand.class != Integer
      raise ArgumentError.new("Operands should be intergers.")
    end

    begin
      result = first_operand.send(operation, second_operand)
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError
      return "Division by zero is not allowed."
    end
  end
end
