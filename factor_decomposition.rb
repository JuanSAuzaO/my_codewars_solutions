def decomp(n)
  factorial = 1
  primes = {}
  powers = {}
  prime = 2
  answer = ''
  
  while n > 1
    factorial = n * factorial
    n -= 1
  end

  while factorial > 1
    if factorial % prime == 0
      powers[prime] ||= 0
      powers[prime] += 1
      factorial /= prime
    else
      prime = prime.next
    end
  end

  powers.each do |prime, power|
    if power == 1
      answer += "#{prime} * "
    else
      answer += "#{prime}^#{power} * "
    end
  end

  answer.chomp(' * ')
end