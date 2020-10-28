int speed1 = 4;
int speed2 = 2;

Object rect1, rect2;  // the first instance of the Flower class

void setup() {
  size(850, 850);

  float size_rect1 = 100;
  float size_rect2 = 100;
  float x1 = random(width/10, width-width/10);
  float x2 = random(width/10, width-width/10);
  float y1 = random(height/10, height-height/10);
  float y2 = random(height/10, height-height/10);

  rectMode(CENTER);

  rect1 = new Object(x1, y1, size_rect1, speed1); 
  rect2 = new Object(x2, y2, size_rect2, speed2);
}

void draw() {
  background(#FABDBD);

  rect1.display();
  rect1.move();
  rect2.display();
  rect2.move();
  
  rect1.bounce(rect2);
}
