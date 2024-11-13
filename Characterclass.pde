class Character {
  float x, y;
  float size;
  
  Character(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void move(float dx, float dy) {
    x += dx;
    y += dy;
    // Keep character within the screen bounds
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  boolean collidesWith(Rabbit rabbit) {
    float distance = dist(x, y, rabbit.getX(), rabbit.getY());
    return distance < (size + rabbit.getSize()) / 2;
  }
  
  void display() {
    fill(0, 255, 0);
    ellipse(x, y, size, size);
  }
}