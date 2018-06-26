void setup()
{
    println(multiplesOf(5));
}

void draw()
{
}

int multiplesOf(int y)
{
    int x = 0;
    int sum = 0;
    for (int i = 0; x < (1000-y); i++)
    {
        x = y*i;
        sum += x;
    }
    return sum;
}