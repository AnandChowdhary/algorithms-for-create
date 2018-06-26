public class Particle 
{
    PVector location;
    PVector velocity;
    PVector center;
    PVector gravityThingy;
    float friction;
    float opac;
    float opacFric;
    float prevAngle = 0;
    float prevLoc = 0;
    boolean passed = false;
    color c;


    public Particle ()
    {
        location = new PVector((mouseX-width/2)/scale,(-mouseY+height)/scale);
        center = new PVector(location.x,1+location.y);
        setStartVel();
        gravityThingy = new PVector(0,0);
        friction = 0.998;
        opacFric = 0.98;
        opac = 255;
        prevAngle = degrees(PVector.angleBetween(velocity, new PVector(0,1)));
        setColor();
    }

    void setStartVel()
    {
        int i = int(random(0,2));
        if (i == 0)
        {
            velocity = new PVector(random(2,15),random(3,10));
        }
        else
        {
            velocity = new PVector(random(-15,-2),random(3,10));    
        }
        
        if (abs(velocity.x) < 4)
        {
            opacFric = 0.8;
        }
        else if (abs(velocity.x) < 2)
        {
            opacFric = 0.5;
        }
        velocity.mult(3);
    }

    void setGravity()
    {

        if (location.x > center.x)
        {
            gravityThingy = new PVector(-1,0);
        }
        else
        {
            gravityThingy = new PVector(1,0);
        }
        gravityThingy.mult(9);

        gravityThingy.add(new PVector(5*x,0));

        float angle = degrees(PVector.angleBetween(velocity, new PVector(0,1)));
        float magn = map(angle,0,90,0.05,0.5);

        if (angle > prevAngle && !passed)
        {
            passed = true;
            prevLoc = location.x;
        }


        if (passed)
        {
            gravityThingy.mult(0.2);
            
            if (location.x > center.x && prevLoc < center.x)
            {
                opacFric = 0.4;
                passed = false;
            }
            else if (location.x < center.x && prevLoc > center.x)
            {
                opacFric = 0.4;
                passed = false;
            }
            
        }
        else
        {
            gravityThingy.mult(magn);
        }
        prevAngle = angle;
    }

    void setColor()
    {
        if (!passed)
        {
            float d = PVector.dist(location,new PVector(center.x, location.y));
    
            if (d > 200)
            {
                c = color(255, 147, 41,opac+50);
            }
            else if(d > 100)
            {
                c = color(255, 197, 143,opac+50);
            }
            else if(d > 50)
            {
                c = color(201, 226, 255,opac+50);
            }
            else
            {
                c = color(64, 156, 255,opac+50);
            }
        }
    }

    void run()
    {
        display();
        move();
    }

    boolean check()
    {
        if (opac < 25 || location.y > height/scale)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    void display()
    {
        noStroke();
        setColor();
        fill(c);
        ellipse(location.x,location.y,10,10);
        opac = opac*opacFric;
    }

    void move()
    {
        location.add(velocity);
        setGravity();
        velocity.add(gravityThingy);
        if (passed)
        {
            velocity = new PVector(constrain(velocity.x,-8,8)+4*x,velocity.y);
        }
        velocity.mult(friction);
    }

}