public class Flame 
{
    float xoff;
    float xincrement; 
    float yoff;
    float yincrement; 
    float size;
    float rotation;

    public Flame (int s, float r) 
    {
        xoff = random(0,1);
        xincrement = random(0.005,0.01);
        yoff = random(0,1);
        yincrement = random(0.005,0.01);
        size = s;
        rotation = radians(r);
        
    }

    void display()
    {
        float n = noise(xoff)*2;
        float m = noise(yoff)*2;
        float l = m;

        m = map(m,0.3,1.5,0.5, 1.2);
        n = map(n,0.3,1.6,0.9,1.3);

        if (size >= 3)
        {
            fill(#FFF52E);
        }
        if (size == 2)
        {
            fill(#FF8D2E);
        }
        if (size == 1) 
        {
            fill(#FF392E);
        }
        
        float scale = 1/size;

        pushMatrix();
        scale(scale);
        rotation = degrees(rotation);
        translate((width/2 - rotation)*size,height*size + 10*abs(rotation) - 10);
        rotation = radians(rotation);
        rotate(rotation);
        beginShape();
        vertex(0,0);
        bezierVertex(-2*width/8, 0, -1*width/6, -2*height/3,n*width/2-width/2, m*height/3-height);
        bezierVertex(1*width/6, -1*height/3, 2*width/8, 0, 0, 0);
        endShape();
        popMatrix();

        xoff += xincrement;
        yoff += yincrement;
        xincrement = random(0.005,0.01);
        yincrement = random(0.005,0.01);
    }

}