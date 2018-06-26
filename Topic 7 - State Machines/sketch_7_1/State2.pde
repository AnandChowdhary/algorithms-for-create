// each of these subclasses of Screen
// defines one state of the statemachine

class State2 extends Screen {
  int timer;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int maxSize = 100;
  PVector loc;
  int prevTimeToGo = 100;
  
  State2(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {    
    fill(255);
    loc = new PVector(random(0,width),random(0,height));
    // conditional transition to a successor state - here with a timer condition
    int timeToGo = (TIME_GAME_1 - millis() + timer) / 1000;
    
    if ((millis() - timer) > TIME_GAME_1) { 
      goToState(nextStates[0]);
    }
    
    if (timeToGo != prevTimeToGo)
    {
      fillList(particles.size());      
    }
    
    for (int i = 0; i < particles.size(); i++)
    {
        particles.get(i).run();
        if (particles.get(i).remove())
        {
            particles.remove(i);
        }
    }
    prevTimeToGo = timeToGo;
  }
  
  void fillList(int x)
  {
    for (int i = x; i < maxSize; i++)
    {
        particles.add(new Particle(loc));
    }
  }
  
  void reset() {
    timer = millis();
  }
}