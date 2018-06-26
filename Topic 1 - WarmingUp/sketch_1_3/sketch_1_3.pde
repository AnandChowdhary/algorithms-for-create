ArrayList<Integer> integers = new ArrayList<Integer>();

void setup()
{
    fillList(integers);
    println(countAbove50(integers));
}

void fillList(ArrayList<Integer> e)
{
    for (int i = 0; i < 500; i++)
    {
        e.add(int(random(0, 100)));
    }
}

int countAbove50(ArrayList<Integer> e)
{
    int counter = 0;
    for (int i = 0; i < e.size(); i++)
    {
        if (e.get(i) > 50)
        {
            counter++;
        }
    }
    return counter;
}