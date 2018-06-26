  
void setup()
{
    println(largestPrimeFactor(13195));
    println(largestPrimeFactor(317584931803L));
}

void draw()
{}

long largestPrimeFactor(long e)
{
    long nr = e;
    long prime = findPrime(nr);
    while (prime != 1)
    {
        nr = nr/prime;
        prime = findPrime(nr);
        println("nr = " + nr + " prime = " + prime);
    }
    return nr;
}

long findPrime(long e)
{
    long primeFactor = 1;
    for (long i = 2; i < e; i++)
    {
        if (e%i == 0)
        {
            primeFactor = i;
            break;
        }
    }
    return primeFactor;
}