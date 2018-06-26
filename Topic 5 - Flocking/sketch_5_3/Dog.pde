public class Dog 
{
    PVector location;
    PImage dog;
    float sizex;
    float sizey;

    public Dog () 
    {
        location = new PVector(-1000,-1000);
        dog = loadImage("dog.png");
        sizex = 200;
        sizey = 180;
    }

    void run(float x, float y)
    {
        move(x,y);
        display();
    }

    void move(float x, float y)
    {   
        location = new PVector(x,y);
    }

    void display()
    {
        image(dog,location.x,location.y,sizex,sizey);
    }
}