// each of these subclasses of Screen
// defines one state of the statemachine

class State1 extends Screen {
  int timer;
  
  State1(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    text("this is an example of a game period that finishes after a certain time interval",20,20);
    int timeToGo = (TIME_GAME_1 - millis() + timer) / 1000;
    text( timeToGo, 20,50);
    
    // conditional transition to a successor state - here with a timer condition
    if ((millis() - timer) > TIME_GAME_1) { 
      goToState(nextStates[0]);
    }
  }
  
  void reset() {
    timer = millis();
  }
}