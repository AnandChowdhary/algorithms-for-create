class SMDS {
  // one spring mass damper system with connections (force, velocity)

  float segment_length;
  PVector basis;   // base of the segment and coordinate system
  float rotation;  // this concerns the coordinate system which may be rotated
  float mass;
  float force;
  float aAcceleration;  //angular acceleration
  float aVelocity;    //angular velocity  
  float angle;
  float f; //constant - damping
  float c; //spring constant

 SMDS(PVector base, float _mass, float _length) {
    // constructor of the class setting the object variables
    basis = base.get();
    rotation = 0.0;
    segment_length = _length;
    mass = _mass;
    force=0;
    aVelocity = 0;
    aAcceleration = 0; //the acceleration is only in the beginning, blowing wind
    angle = 0;
    f=damping;  //global parameters to play with
    c=spring_constant;  //global parameters to play with  
  }
  
  void update(float aVelocity2, float force2){
    aVelocity += (force2-force) / mass;   
    angle += aVelocity-aVelocity2;
    force = angle * c + (aVelocity-aVelocity2) * f;    
  }
  
  void draw_system() {
    fill(175, 200);

    pushMatrix();
      translate(basis.x, height-basis.y);    
      noStroke();
      rotate(angle+rotation);
      stroke(32,147,27);
      line(0, 0, 0, -segment_length);
    popMatrix();
  }
}
