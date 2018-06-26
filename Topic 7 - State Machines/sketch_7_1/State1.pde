// each of these subclasses of Screen
// defines one state of the statemachine

class State1 extends Screen {
  
  State1(ScreenState[] nextStates) {
    super(nextStates);
  }

  
  
  void draw() {
    fill(255);
    text("Start the fireworks by pressing a key",20,20);
  }

  void reset(){
    // empty
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    goToState(nextStates[0]);
  }
}