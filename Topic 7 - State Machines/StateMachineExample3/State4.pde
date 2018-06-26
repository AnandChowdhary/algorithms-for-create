// each of these subclasses of Screen
// defines one state of the statemachine

class State4 extends Screen {
  int points;
  int timer;
  
  State4(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
     text("this is an example of a game periode\n that leads to the previous game period, if you press " + MAX_POINTS_4 + " times a key\n or to the first, if you delay too long.", 20, 20);
     
     text(points, 20, 80);
     
     // conditional transition to a successor state - here with a threshold condition
     // and also two different possible successor states 
     
     if (millis() - timer > TIME_GAME_4){
       goToState(nextStates[1]);
     }
     
     if (points >= MAX_POINTS_4){
       goToState(nextStates[0]);
     }
  }
  
  void reset() {
    points = 0;
    timer = millis();
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    points++;
  }
}