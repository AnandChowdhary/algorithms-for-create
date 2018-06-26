class Confetti 
{
  
    color c;        // a confetti has a colour
    float radius;    // a confetti has a radius;
    PVector location;
    PVector velocity;
 
  
    Confetti() 
    {  //constructor: gives values to the variables
        c= color(int(random(180,255)), int(random(0,150)), int(random(100,200)));  //pinkish
    
        radius=random(15,35);
        location = new PVector(int(random(radius,width-radius)),int(random(radius,width-radius)));
        
        float dx=int(random(-3,4));               // speed in x-direction
        while (dx==0) dx=int(random(-3,4)); // dont want nonmoving confettis
        float dy=int(random(-3,4));               // speed in y-direction
        while (dy==0) dy=int(random(-3,4)); // dont want nonmoving confettis
        velocity = new PVector(dx,dy);
  }
   
  //methods...
    void display() 
    {
        //noStroke();
        fill(c);
        ellipse(location.x,location.y,2*radius,2*radius);
    }
  
    void move() 
    {
        //if the confetti reaches the left wall or the right wall, it bounces
        if ((location.x>width-radius-velocity.x) || (location.x<radius-velocity.x))  velocity.x=-velocity.x;
        //if the confetti reaches the top wall or the botton wall, it bounces
        if ((location.y>width-radius-velocity.y) || (location.y<radius-velocity.y))  velocity.y=-velocity.y;
        location.add(velocity);
    }
}