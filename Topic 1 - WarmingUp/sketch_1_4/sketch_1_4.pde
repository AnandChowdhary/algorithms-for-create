ArrayList<Integer> multiples = new ArrayList<Integer>();
void setup()
{
    fillList();
    println(sumList());
}

void draw()
{
}

void fillList()
{
    int x = 0;
    for (int i = 0; x < 1000; i++)
    {
        x = 5*i;
        if (x != 1000)
        {
          multiples.add(x);
        }
    }
}

int sumList()
{
    int sum = 0;
    for (int i = 0; i < multiples.size(); i++)
    {
        sum = sum + multiples.get(i);
    }
    return sum;
}