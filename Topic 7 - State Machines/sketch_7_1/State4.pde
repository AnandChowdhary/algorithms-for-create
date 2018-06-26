// each of these subclasses of Screen
// defines one state of the statemachine

class State4 extends Screen {
  int points;
  int timer;
  
  State4(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    fill(255);
     text("Keep pressing a key " + MAX_POINTS_4 + " times to clean up your mess,\n if you delay too long you will have to start over.", 20, 20);
     
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