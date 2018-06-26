// each of these subclasses of Screen
// defines one state of the statemachine

class State2 extends Screen {
  State2(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    text("this is an example of a game periode that finishs if you press a key",20,20);
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