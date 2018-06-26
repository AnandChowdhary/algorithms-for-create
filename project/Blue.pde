//A blue fish as projectile.
public class Blue
  extends Projectile {
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  int maxSize = 50;

  public Blue() {
    super();
  }

  void display() {
    displayParticles();
    imageMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    image(fish3, 0, 0, 6 * radius, 4 * radius);
    popMatrix();
  }

  //updates the particles associated with this fish
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

  //displays the particles associated with this fish
  void displayParticles() {
    for (int i = 0; i < bubbles.size(); i++) {
      bubbles.get(i).display();
    }
  }

  //fills the ArrayList with the particles associated with this fish
  void fillList(int x) {
    for (int i = x; i < maxSize; i++) {
      bubbles.add(new Bubble(location, velocity, color(102, 207, 247)));
    }
  }

}

