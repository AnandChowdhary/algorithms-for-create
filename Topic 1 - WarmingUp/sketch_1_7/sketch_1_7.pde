void setup()
{
    printBinary();
}

void draw()
{}


void printBinary()
{
    for (int i = 0; i < 2; i++)
    {
        for (int j = 0; j < 2; j++)
        {
            for (int k = 0; k < 2; k++)
            {
                String x = str(i) + str(j) + str(k);
                println(x);
            }
        }
    }
}