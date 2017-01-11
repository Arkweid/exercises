# FizzBuzz Plus
# Напишите программу, выводящую числа от 1 до 100, но:
# Если число делится на 3 и 5 или содержит оба этих символа, выводится '...Fizz...Buzz...'
# Если число делится на 3 или содержит его '...Fizz...'
# Если число делится на 5 или содержит его '...Buzz...'

def fizzbuzz(n)
  (1..n).each do |i|
    if ((i % 3).zero? && (i % 5).zero?) || (i.to_s.include?('3') && i.to_s.include?('5'))
      p '...Fizz...Buzz...'
    elsif (i % 3).zero? || i.to_s.include?('3')
      p '...Fizz...'
    elsif (i % 5).zero? || i.to_s.include?('5')
      p '...Buzz...'
    else
      p i
    end
  end
end

# OOP style

class FizzBuzz
  attr_reader :range, :arr

  def initialize(range)
    @range = range
    @arr = []

    make_result
  end

  def print_result
    arr.each { |i| p i }
  end

  def make_result
    (1..range).each do |i|
      arr << if fizzbuzz_condition(i)
               fizz
             elsif fizz_condition(i)
               buzz
             elsif buzz_condition(i)
               fizzbuzz
             else
               i
             end
    end
  end

  private

  def fizz_condition(i)
    (i % 3).zero? || i.to_s.include?('3')
  end

  def buzz_condition(i)
    (i % 5).zero? || i.to_s.include?('5')
  end

  def fizzbuzz_condition(i)
    ((i % 3).zero? && (i % 5).zero?) || (i.to_s.include?('3') && i.to_s.include?('5'))
  end

  def fizz
    '...Fizz...'
  end

  def buzz
    '...Buzz...'
  end

  def fizzbuzz
    '...Fizz...Buzz...'
  end
end
