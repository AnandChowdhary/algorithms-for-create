// this class just adds a number of rotational spring-mass-damper systems on top
// of each other in order to model a flower

class Flower {

  SMDS[] segment;
  PVector basis;
  int num_of_segs;    // we need at least 3 segments, otherwise loops go wrong.
  float overall_height;
  float top_mass;
  float stem_mass;
  float [] force;
  float [] velocity;
  float wind;

  Flower() {
    num_of_segs = number_of_segments;
    // each segment is an mass-spring-damper-system
    segment = new SMDS[num_of_segs];
    // the segments are connected via transmitted forces and velocities
    // these need to be stored in arrays, one pair for each segment
    force = new float[num_of_segs];
    velocity = new float[num_of_segs];
     
    top_mass = mass_flower;
    stem_mass = mass_stem_segment;
    // simply to make the flower fit nicely on the screen
    overall_height = height-100;
    basis = new PVector(width/2, 5);
    
    // initially no wind
    wind = 0;

    // initializing all the segments
    for (int i=0; i<num_of_segs; i++) {
      PVector base = new PVector(width/2, basis.x + i* overall_height/num_of_segs);
      // the top segment with the flower has the highest index
      float mass = (i<num_of_segs-1?stem_mass:top_mass);         
      segment[i] = new SMDS(base, mass, overall_height/num_of_segs);
      force[i]=0;
      velocity[i]=0;
    }
  }


  void wind_force( float f) {
      // could be something more interesting in the future, e.g. perlin noise
      wind = f;
  }

  void update() {
    
    for (int i=num_of_segs-1; i>=0; i--)
    {
    // bottom segment does not get velocity from "below"
    float vel1 = (i==0?0:velocity[i-1]);   
    // top segment does not get force from above
    // we add up the wind to the incoming force
    float force1 = (i==num_of_segs-1?wind:force[i+1]+wind);
    
    // actually we have a function with two results, velocity & force.
    // because of programming constraints split in two functions with
    // one result each
    velocity[i] = segment[i].update_velocity(force1,force[i]);
    force[i] = segment[i].update_force_pos(vel1, velocity[i]);
    }    
    //wind is reset here - it is only a temporary force
    wind=0;
  }

  void draw_flower() {
    // the flower has to be drawn from the bottom segment
    // to the top segment
    PVector start = new PVector();

    start = basis.get();

    segment[0].basis = basis.get();
    for (int i=0; i< num_of_segs; i++) {
      // draw stem from bottom to top, as the rotation of one segment
      // effects the rotation of all segments above
      segment[i].draw_system();

      PVector goal = new PVector();
      // rotations of single stem segments add up
      float alpha = segment[i].angle + segment[i].rotation;
      goal.x = start.x + sin(alpha)*segment[i].segment_length;
      goal.y = start.y + cos(alpha)*segment[i].segment_length;

      if (i<num_of_segs-1) 
      { // draw stem segment
        segment[i+1].basis = goal.get();
        segment[i+1].rotation = alpha;
        start=goal.get();
      }
      else {
        //draw flower on top of the stem
        pushMatrix();
        translate(goal.x, height-goal.y);
        rotate(segment[num_of_segs-1].rotation);

        rotate(-3* PI/7);
        for (int j=0; j<5; j++) {
          stroke(255, 5, 64);
          fill(242, 12, 66);
          bezier(0, 0, 20, -20, 20, -40, 0, -60);
          bezier(0, 0, -20, -20, -20, -40, 0, -60);
          rotate(PI/4.7);
        }
        popMatrix();
      }
    }
  }
