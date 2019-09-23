
//Create a function that returns an array of prime numbers from 2 upto N, taking care to be as efficient as possible.

func primeNumbersUpto(_ n:Int) -> [Int]
{
    var primeNumbers = [Int]()
    
    for i in 2..<n
    {
        var divisibleBy = 0
        for j in 1...i
        {
            if i%j == 0
            {
                divisibleBy += 1
            }
        }
        
        if divisibleBy < 3
        {
            primeNumbers.append(i)
        }
    }
    
    return primeNumbers
}

func primes(_ n:Int) -> [Int]
{
    let allNumbers = Array(3..<n)
    var primes = [2,3,5,7]
    primes.append(contentsOf: allNumbers.filter({!(($0 % 2 == 0) || ($0 % 3 == 0) || ($0 % 5 == 0) || ($0 % 7 == 0))}))
    return primes
}

func primeNumbers(upto n:Int) -> [Int]
{
    guard n > 1 else {
        return []
    }
    
    var seive = [Bool](repeating: true, count: n)
    seive[0] = false
    seive[1] = false
    
    for number in 1 ..< n
    {
        if seive[number] == true
        {
            for multiple in stride(from: number * number, to: n, by: number)
            {
                seive[multiple] = false
            }
        }
    }
    
    return seive.enumerated().compactMap({$1 == true ? $0:nil})
}

primeNumbersUpto(20)
primes(20)
primeNumbers(upto: 20)
