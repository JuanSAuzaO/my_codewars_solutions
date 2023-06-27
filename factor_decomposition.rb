# Link to the challenge to check instructions: https://www.codewars.com/kata/5a045fee46d843effa000070

def decomp(n)
  factorial = 1 # 1.1 Here we will have the result of the factorial calculation. We start with 1 so we can multiply properly.
  powers = {} # 1.2 This will indicate the number of times the factorial can be divisible into certain prime.
  prime = 2 # 1.3 We start indicating the first prime number.
  answer = '' # 1.4 The variable we will return at the end.
  
  while n > 1 # 2 Here we perform a while loop to calculate the factorial value according to n.
    factorial = n * factorial # So we multiply n per the previous factorial value to get the new value.
    n -= 1 # And reduce n by 1 until it is equal to 1.
  end

  while factorial > 1 # 3 Now we start an iteration to check the factorial prime factors.
    if factorial % prime == 0 # First we check if factorial is multiplo of prime. we need a remainder of 0.
      powers[prime] ||= 0 # (a) In such case it is a multiplo, we verify if there is a entry of that prime in powers hash.
      powers[prime] += 1 # We add 1 to the entry.
      factorial /= prime # We perform the division altering the factorial variable so we can continue reducing its value.
    else 
      prime = prime.next # (b) If factorial is not a multiplo, we switch to the next prime.
    end
    # loop will keep going till the value or factorial is less than or equal 1.
  end

  powers.each do |prime, power| # 4 Once we have determined the primes and their powers:
    if power == 1               # We check if power equals to 1, so we don't show it.
      answer += "#{prime} * " # Numbers are separated by a multiplication sign.
    else
      answer += "#{prime}^#{power} * " # In case power is greater than 1, we show it.
    end
  end

  answer.chomp(' * ') # We implicitily return the answer, withdrawing the multiplication sign at the end.
end