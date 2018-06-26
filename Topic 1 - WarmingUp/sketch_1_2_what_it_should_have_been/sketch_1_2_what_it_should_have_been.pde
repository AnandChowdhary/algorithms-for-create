ArrayList<Character> Letters = new ArrayList<Character>();
String text = "This is a test tset a si sihT";

void setup()
{
    fillArray(Letters);
    printCharacters(Letters);
    printCharactersBackwards(Letters);
    println(countE(Letters));
    println(isPalindrome(Letters));
}

void draw()
{
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

    for (int i = 0; i < e.size(); i++)
    {
        char x = e.get(i);
        println(x);
    }
}

void printCharactersBackwards(ArrayList<Character> e)
{
    for (int i = 0; i < e.size(); i++)
    {
        char x = e.get(e.size()-1-i);
        println(x);
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