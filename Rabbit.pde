class Rabbit {
  protected float x, y;
  protected float size;
  protected color rabbitColor;

  Rabbit(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.rabbitColor = color(156, 165, 153); // Default gray color
  }

  void display() {
    pushStyle();
    fill(rabbitColor);
    noStroke();
    
    // Body
    ellipse(x, y, size, size * 1.2);
    
    // Head
    ellipse(x, y - size * 0.6, size * 0.7, size * 0.7);
    
    // Ears
    float earWidth = size * 0.2;
    float earHeight = size * 0.5;
    float earX = x - size * 0.2;
    float earY = y - size * 1;
    
    // Left ear
    pushMatrix();
    translate(earX, earY);
    rotate(-PI/6);
    ellipse(0, 0, earWidth, earHeight);
    popMatrix();
    
    // Right ear
    pushMatrix();
    translate(earX + size * 0.4, earY);
    rotate(PI/6);
    ellipse(0, 0, earWidth, earHeight);
    popMatrix();
    
    popStyle();
  }

  void move(float dx, float dy) {
    x += dx;
    y += dy;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  float getX() { return x; }
  float getY() { return y; }
  float getSize() { return size; }
}

class WhiteRabbit extends Rabbit {
  WhiteRabbit(float x, float y, float size) {
    super(x, y, size);
    this.rabbitColor = color(255, 255, 255);
  }
  
  void display() {
    super.display();
    
    // Red eyes
    fill(255, 0, 0);
    ellipse(x - size * 0.15, y - size * 0.7, size * 0.1, size * 0.1);
    ellipse(x + size * 0.15, y - size * 0.7, size * 0.1, size * 0.1);
  }
}

class BrownRabbit extends Rabbit {
  BrownRabbit(float x, float y, float size) {
    super(x, y, size);
    this.rabbitColor = color(139, 69, 19);
  }
  
  void display() {
    super.display();
    
    // Fluffy tail
    fill(255);
    ellipse(x, y + size * 0.5, size * 0.3, size * 0.3);
  }
}

class BlackRabbit extends Rabbit {
  BlackRabbit(float x, float y, float size) {
    super(x, y, size);
    this.rabbitColor = color(0);
  }
  
  void display() {
    super.display();
    
    // White paws
    fill(255);
    ellipse(x - size * 0.3, y + size * 0.5, size * 0.2, size * 0.2);
    ellipse(x + size * 0.3, y + size * 0.5, size * 0.2, size * 0.2);
  }
}