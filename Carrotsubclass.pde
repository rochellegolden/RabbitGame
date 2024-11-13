class Carrot {
  float x, y;
  float size;
  color carrotColor;
  
  Carrot(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.carrotColor = color(255, 127, 0); // Default orange color
  }
  
  void move(float dx, float dy) {
    x += dx;
    y += dy;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  boolean collidesWith(Rabbit rabbit) {
    float distance = dist(x, y, rabbit.getX(), rabbit.getY());
    return distance < (size + rabbit.getSize()) / 2;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(PI / 4); // Rotate 45 degrees
    
    // Carrot body
    fill(carrotColor);
    noStroke();
    ellipse(0, 0, size * 0.5, size);
    
    // Carrot top
    fill(0, 200, 0);
    triangle(-size * 0.25, -size * 0.5, size * 0.25, -size * 0.5, 0, -size * 0.7);
    
    popMatrix();
  }
}

class OrangeCarrot extends Carrot {
  OrangeCarrot(float x, float y, float size) {
    super(x, y, size);
    this.carrotColor = color(255, 127, 0);
  }
}

class RedCarrot extends Carrot {
  RedCarrot(float x, float y, float size) {
    super(x, y, size);
    this.carrotColor = color(245, 30, 48);
  }
  
  // Override display method to add some sparkles
  void display() {
    super.display();
    // Add sparkles
    fill(255, 255, 0);
    for (int i = 0; i < 5; i++) {
      float sparkleX = random(-size * 0.5, size * 0.5);
      float sparkleY = random(-size * 0.5, size * 0.5);
      ellipse(x + sparkleX, y + sparkleY, 3, 3);
    }
  }
}

class GoldenCarrot extends Carrot {
  GoldenCarrot(float x, float y, float size) {
    super(x, y, size);
    this.carrotColor = color(255, 215, 0);
  }
  
  // Override display method to add a glow effect
  void display() {
    // Add glow
    for (int i = 5; i > 0; i--) {
      fill(255, 215, 0, 50);
      ellipse(x, y, size + i*5, size + i*5);
    }
    super.display();
  }
}