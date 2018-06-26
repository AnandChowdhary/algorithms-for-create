void setup()
{
    printSatelites();
}

void draw()
{}


void printSatelites()
{
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            if (j != i)
            {
                for (int k = 0; k < 10; k++)
                {
                  if (k != j && k != i)
                  {
                      for (int l = 0; l < 10; l++)
                      {
                          if (l != i && l != j && l != k)
                          {
                              String x = str(i) + str(j) + str(k) + str(l);
                              println(x);
                          }
                      }
                  }
                }
            }
        }
    }
}