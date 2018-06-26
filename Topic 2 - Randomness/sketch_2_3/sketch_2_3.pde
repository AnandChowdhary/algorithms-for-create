/*
  Draws a colour splash with a normal distribution.
  made by Wouter Couwenbergh
  June 2018
*/

boolean draw = true;

void setup() 
{
  size(1000, 1000);
  background(255);
}

void draw() 
{
    if (draw)
    {
        for (int i = 0; i < 25; ++i) 
        {
            // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
            float xloc = randomGaussian();
            float yloc = randomGaussian();

            float sd = 300;                // Define a standard deviation
            float mean = width/2;         // Define a mean value (middle of the screen along the x-axis)
            float mean2 = height/2;
            xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
            yloc = ( yloc * sd ) + mean2;

            PVector dotLocation = new PVector(xloc, yloc);
            PVector center = new PVector(width/2, height/2);
            float distance = PVector.dist(dotLocation,center);
            distance = constrain(distance, 1,700);
            distance = map(distance,1,700,1,10);

            fill(0,50);
            noStroke();
            ellipse(xloc, yloc, 64/distance, 64/distance);   // Draw an ellipse at our "normal" random position
    }
    }
}

void mousePressed()
{
    draw = !draw;
}