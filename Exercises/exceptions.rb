class ArgumentError < StandardError
end

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  class UnsupportedOperation < StandardError
  end


  def self.calculate(first_operand, second_operand, operation)
    if !first_operand.is_a?(Integer) or !second_operand.is_a?(Integer)
      raise ArgumentError.new("One or more operands are not integers.")
    end
    if ALLOWED_OPERATIONS.include? operation
      case operation
      when '+'
        return "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"
      when '*'
        return "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
      when '/'
        if second_operand == 0
          return "Division by zero is not allowed."
        end
        return "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
      end
    else
      raise UnsupportedOperation.new("Unsupported operator detected.")
    end
  end
end
