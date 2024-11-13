 /*
  Assignment: OOP EXERCISE
  Student: *Name Here*
  Pasadena City College, Fall 2024
  Course Name: DMA60 Creative Coding
  Prof. George McKinney
  Project Description: This program .... (describe it!)
  Last Modified: November 6, 20XX
  */

Carrot player;
Rabbit whiteRabbit, brownRabbit, blackRabbit;
float moveSpeed = 1.5;

void setup() {
  size(700, 700);
  // Randomly choose a carrot type for the player
  int carrotType = int(random(3));
  switch(carrotType) {
    case 0:
      player = new OrangeCarrot(50, height / 2, 40);
      break;
    case 1:
      player = new RedCarrot(50, height / 2, 40);
      break;
    case 2:
      player = new GoldenCarrot(50, height / 2, 40);
      break;
  }
  
  whiteRabbit = new WhiteRabbit(650, 109, 40);
  brownRabbit = new BrownRabbit(653, 577, 40);
  blackRabbit = new BlackRabbit(644, 343, 40);
}

void draw() {
  background(247,192,218);
  
  // Move player with arrow keys
  if (keyPressed) {
    if (keyCode == LEFT) player.move(-2, 0);
    if (keyCode == RIGHT) player.move(2, 0);
    if (keyCode == UP) player.move(0, -2);
    if (keyCode == DOWN) player.move(0, 2);
  }
  
  // Move rabbits towards player
  moveRabbitTowardsPlayer(whiteRabbit);
  moveRabbitTowardsPlayer(brownRabbit);
  moveRabbitTowardsPlayer(blackRabbit);
  
  // Display all objects
  player.display();
  whiteRabbit.display();
  brownRabbit.display();
  blackRabbit.display();
  
  // Check for collisions
  checkCollisions();
}

void moveRabbitTowardsPlayer(Rabbit rabbit) {
  float dx = player.x - rabbit.getX();
  float dy = player.y - rabbit.getY();
  float distance = sqrt(dx*dx + dy*dy);
  
  if (distance > 0) {
    dx /= distance;
    dy /= distance;
    rabbit.move(dx * moveSpeed, dy * moveSpeed);
  }
}

void checkCollisions() {
  if (player.collidesWith(whiteRabbit) || 
      player.collidesWith(brownRabbit) || 
      player.collidesWith(blackRabbit)) {
    textSize(32);
    fill(255, 0, 0);
    text("MUNCH!", width/2 - 80, height/2);
    noLoop(); // Stop the game
  }
}