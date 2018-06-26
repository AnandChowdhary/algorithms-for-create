// a flower in the wind
// implementing a series of spring-mass-damper-systems
// as described in the book "Dynamical Systems", page 101
// angelika mader, may 2018
// processing 2.1.2


// a number of parameters to play with
// each segment of the flower is a spring mass damper system with the 
// same characteristics, only the mass of the top is bigger
float spring_constant = 0.3;
float damping = 0.1;
float mass_flower = 2.0;
float mass_stem_segment = 1.0;
int number_of_segments = 5;

Flower bloem;

void setup() {
  size(600, 400);
  bloem = new Flower();
}

void draw() {
  background(0);
  
  // "add" wind by mouse click
  if (mousePressed) {
    bloem.wind_force(0.002);
  };

  bloem.update();
  bloem.draw_flower();

}
