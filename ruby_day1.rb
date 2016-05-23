favoriteMovies = ["Howl's Moving Castle", "V for Vendetta", "Big Lebowski", "Django Unchained", "Clueless", "Fifth Element", "Scent of a Woman", "Back to the Future I", "Finding Nemo", "Ratatouille"]

topThreeMovies = favoriteMovies.select {|movie| favoriteMovies.index(movie) < 3}
puts topThreeMovies.length

i=21
20.times do
  i -=1
  puts i
end

a =*(1..20)
b = (1..20).to_a.reverse

b.each do |element|
  puts element
  end

b.map {|e| puts e}

def validForOneThruTen(num)
  if num >=1 && num <= 10
    puts "Valid"
  else
    puts "Invalid"
  end
end

def fizzBuzz
  i = 0
  100.times do
  i += 1
    if i % 15==0
      puts "FizzBuzz"
    elsif i % 3 ==0
      puts "Fizz"
    elsif i % 5==0
      puts "Buzz"
    else
      puts i
    end
  end
end

def is_even num
  if num % 2 == 0
    puts "true"
  else
    puts "false"
  end
end

def sum_these_numbers(num1,num2)
  is_even(num1 + num2)

end


words = ["mall", "cat", "caw", "radio", "mouse"]

words.each {|word| puts word.upcase}
