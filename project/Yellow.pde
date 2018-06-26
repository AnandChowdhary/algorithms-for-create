//A yellow fish as projectile.
public class Yellow
  extends Projectile {
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  int maxSize = 50;

  public Yellow() {
    super();
  }

  void display() {
    displayParticles();
    imageMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    image(fish2, 0, 0, 6 * radius, 4 * radius);
    popMatrix();
  }

  //Updates the particles associated with this fish
  void updateParticles() {
    if (bubbles.size() < maxSize) {
      fillList(bubbles.size());
    }
    for (int i = 0; i < bubbles.size(); i++) {
      bubbles.get(i).update();
      if (bubbles.get(i).remove()) {
        bubbles.remove(i);
      }
    }
  }

  //Displays the particles associated with this fish
  void displayParticles() {
    for (int i = 0; i < bubbles.size(); i++) {
      bubbles.get(i).display();
    }
  }

  //fills the ArrayList with the particles associated with this fish
  void fillList(int x) {
    for (int i = x; i < maxSize; i++) {
      bubbles.add(new Bubble(location, velocity, color(255, 241, 88)));
    }
  }

}

