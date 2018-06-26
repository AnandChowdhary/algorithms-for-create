ArrayList<Integer> bin = new ArrayList<Integer>();
void setup()
{
    fillList();
    println(bin);
    println(convertBinary(bin));
}

void draw()
{}

void fillList()
{
    int x = int(random(3, 8));
    for (int i = 0; i < x; i++)
    {
        bin.add(int(random(0,2)));
    }
}

int convertBinary(ArrayList<Integer> e)
{
    int decimal = 0;
    for (int i = 0; i < e.size(); i++)
    {
        decimal += e.get(i)*pow(2,(e.size()-1-i));
    }
    return decimal;
}