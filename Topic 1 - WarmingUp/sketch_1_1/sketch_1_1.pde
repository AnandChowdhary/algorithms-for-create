ArrayList<Character> Letters = new ArrayList<Character>();
String text = "This is a test tset a si sihT";
PFont myFont;
int FontSize = 50;
int counter = 0;

void setup()
{
    size(1000, 1000);
    myFont = createFont("Courier", 50);
    fillArray(Letters);
}

void draw()
{
    background(0);
    textFont(myFont,FontSize);
    printCharacters(Letters);
    printCharactersBackwards(Letters);
    println(countE(Letters));
    println(isPalindrome(Letters));
}

void fillArray(ArrayList<Character> e)
{
    for (int i = 0; i < text.length(); i++)
    {
        e.add(text.charAt(i));
    }
}

void printCharacters(ArrayList<Character> e)
{

    for (int i = 0; i < counter; i++)
    {
        char x = e.get(i);
        text(x, i*FontSize/2, FontSize);
    }
    if (counter == e.size())
    {
        counter = 0;
    }
    if (counter < e.size())
    {
        counter++;
    }
}

void printCharactersBackwards(ArrayList<Character> e)
{
    for (int i = 0; i < e.size(); i++)
    {
        char x = e.get(e.size()-1-i);
        text(x, i*FontSize/2, FontSize*2);
    }
}

int countE(ArrayList<Character> e)
{
    int nr = 0;
    for (int i = 0; i < e.size(); i++)
    {
        if (e.get(i) == 'e')
        nr++;
    }
    return nr;
}

boolean isPalindrome (ArrayList<Character> e)
{
    boolean palindrome = true;

    ArrayList<Character> reverse = new ArrayList<Character>();
    
    for (int i = 0; i < e.size(); i++)
    {
        reverse.add(e.get(e.size()-1-i));
    }

    for (int i = 0; i < e.size(); i++)
    {
        if (e.get(i) != reverse.get(i))
        {
            palindrome = false;
        }
    }
    
    return palindrome;
}