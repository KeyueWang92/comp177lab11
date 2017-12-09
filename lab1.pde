void setup() {
  size(400,300);
}
int scene = 1;
double width = 200.0;
double height = 150.0;
double x = 100;
double y = 75;

void draw() {
  background(255);
  textSize(30);
  textAlign(CENTER);
  if (scene == 1) {
    fill(204, 102, 133);
    if (width < 200) {
      width++;
      height = height + 0.75;
      x = 200-width/2;
      y = 150-height/2;
    }
    rect((int)x,(int)y,(int)width,(int)height);
    fill(0);
    text("ABCD", 200, 150);
  }
  if (scene == 2) {
    fill(100, 102, 133);
    if (width > 133) {
      width--;
      height = height - 0.75;
      x = 200-width/2;
      y = 150-height/2;
    }
    rect((int)x,(int)y,(int)width,(int)height);
    fill(0);
    text("XYZ", 200, 150);
  } 
  if (scene == 3) {
    fill(50,50,50);
    if (width > 100) {
      width--;
      height = height - 0.75;
      x = 200-width/2;
      y = 150-height/2;
    }
    rect((int)x,(int)y,(int)width,(int)height);
    fill(0);
    text("UVW", 200, 150);
  }
}
  void mouseClicked(){
  if (scene == 1 && mouseX > 100 && mouseX < 300 && mouseY > 75 && mouseY < 225) {
    scene = 2;
  } else if (scene == 2 && mouseX > 133 && mouseX < 267 && mouseY > 100 && mouseY < 200) {
    scene = 3;
  } else if (scene == 3 && mouseX > 150 && mouseX < 250 && mouseY > 113 && mouseY < 188) {
    scene = 1;
  }
}