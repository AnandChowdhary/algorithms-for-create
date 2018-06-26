// each of these subclasses of Screen
// defines one state of the statemachine

class State3 extends Screen {
  State3(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    fill(255);
    text("press n to go and clean up the mess you've made",20,20);
  }

  void reset(){
    // empty
  }
  
  void handleKeyPress() {
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    // also, here are two different possible successor states
    
    if (key == 'n'){
      goToState(nextStates[0]);
    }
  }
}