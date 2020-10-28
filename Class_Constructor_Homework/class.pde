class Object {
  float xSpeed;
  float ySpeed;

  float rectSize;
  float rectX;
  float rectY;

  boolean collision;

  Object(float temp_x, float temp_y, float temp_s, float temp_speed) {
    rectSize = temp_s;
    rectX = temp_x;
    rectY = temp_y;
    xSpeed = temp_speed;
    ySpeed = temp_speed/1.5;
  }

  Object(float temp_x, float temp_y, float temp_size, float temp_speed, boolean temp_mouseControlled) {
    rectSize = temp_size;
    rectX = temp_x;
    rectY = temp_y;
    xSpeed = temp_speed;
    ySpeed = temp_speed;
  }

  void display () {
    if (!collision) {
      fill(300, 500, 100);
      rect(rectX, rectY, rectSize, rectSize);
    } else {
      fill(150, 100, 0);

      if (mouseX >= rectSize/2 && mouseY >= rectSize/2 && mouseX <= width-rectSize/2 && mouseY <= height-rectSize/2){
        rectX = mouseX;
        rectY = mouseY;
      }
      rect(rectX, rectY, rectSize, rectSize);
    }
  }

  // Move function for rectangles
  void move() {
    rectX = rectX + xSpeed;
    // Checking if sides are hit (x speed)
    if (rectX >= width-rectSize/2 || rectX <= rectSize/2) {
      xSpeed = xSpeed *= -1;
    }

    rectY = rectY + ySpeed;
    // Checking if sides are hit (y speed)
    if (rectY >= width-rectSize/2 || rectY <=rectSize/2) {
      ySpeed = ySpeed *= -1;
    }
  }

  // Bounce function
  void bounce(Object other) {
    // Float that checks the distance between this and the other object
    float d = dist(rectX, rectY, other.rectX, other.rectY);
    // If distance is smaller than the object's size & collision, boolean is false
    if (d < rectSize/2 + other.rectSize/2 && collision == false) {
      collision = true;
    } else {
      //collision is false when not touching
      collision = false;
    }
  }
}
