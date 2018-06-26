// each of these subclasses of Screen
// defines one state of the statemachine

class State3 extends Screen {
  State3(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    text("this is an example of a game periode \n that leads to the next game period, if you press n \n or to the previous, if you press any other key.",20,20);
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
    } else {
      goToState(nextStates[1]);
    }
  }
}