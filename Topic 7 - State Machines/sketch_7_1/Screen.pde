abstract class Screen {
  protected final ScreenState[] nextStates;
  
  private ScreenState nextState;
  
  Screen(ScreenState[] nextStates) {
    this.nextStates = nextStates;
    
    this.reset();
  } 
  
  public boolean hasNextState() {
    return nextState != null;
  }
  
  public ScreenState getNextState() {
    return nextState;
  }
  
  public void enterState() {
    this.nextState = null;
    this.reset();
  }
  
  protected abstract void draw();
  
  protected void handleKeyPress() {
  }
  
  protected void handleMousePress() {
  }
  
  protected void reset(){
  }
  
  protected void goToState(ScreenState nextState) {
    this.nextState = nextState;
  }
}