def fromRoman(romanNumber)
    nums = {
        "M" => 1000,
        "CM" => 900,
        "D" => 500,
        "CD" => 400,
        "C" => 100,
        "XC" => 90,
        "L" => 50,
        "XL" => 40,
        "X" => 10,
        "IX" => 9,
        "V" => 5,
        "IV" => 4,
        "I" => 1
    }
    number = romanNumber.dup
    chars = number.split('')
    chars.each{ |c|
      unless nums.keys.include?(c)
        raise TypeError
      end
    }
    result = 0
    for key, value in nums
        while number.index(key) == 0
            result += value
            number.slice!(key)
        end
    end
    result
end

def toRoman(arabicNumber)
    number = arabicNumber.dup
    if number.class != Integer 
        return ""
    end
    if number > 3999 || number < 1
        raise RangeError
    end

    result = ""
    @digits = {
        1000 => "M",
        900  => "CM", 500 => "D", 400 => "CD", 100 => "C",
        90   => "XC", 50  => "L", 40  => "XL", 10  => "X",
        9    => "IX", 5   => "V", 4   => "IV", 1   => "I"
    }
    @digits.keys.each_with_object('') do |key, str|
        nbr, number = number.divmod(key)
        result << @digits[key]*nbr
      end
      result
end