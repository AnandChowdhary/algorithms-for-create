ArrayList<Integer> multiplesOf3 = new ArrayList<Integer>();
ArrayList<Integer> multiplesOf5 = new ArrayList<Integer>();
ArrayList<Integer> multiplesOf15 = new ArrayList<Integer>();
void setup()
{
    fillList(3, multiplesOf3);
    fillList(5, multiplesOf5);
    fillList(15, multiplesOf15);
    int list3 = sumList(multiplesOf3);
    int list5 = sumList(multiplesOf5);
    int list15 = sumList(multiplesOf15);
    println(list3);
    println(list5);
    println(list15);
    int sum = list3 + list5 - list15;
    println(sum);
}

void draw()
{
}

void fillList(int y, ArrayList<Integer> e)
{
    int x = 0;
    for (int i = 0; x < (1000-y); i++)
    {
        x = y*i;
        e.add(x);
    }
}

int sumList(ArrayList<Integer> e)
{
    int sum = 0;
    for (int i = 0; i < e.size(); i++)
    {
        sum = sum + e.get(i);
    }
    return sum;
}