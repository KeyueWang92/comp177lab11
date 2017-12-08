MyCircle circles[];
int NUM = 100;
boolean anim = true;

void setup() {
  size(800, 600);
  //surface.setResizable(true);  
  
  ellipseMode(RADIUS);  
  circles = new MyCircle[NUM];
  for (int i=0; i<NUM; i++) {
    circles[i] = new MyCircle();
  }
}

void draw() {
  background(255);
  for (int i=0; i<NUM; i++) {
    circles[i].isect(mouseX, mouseY);
    circles[i].render();
    if (anim == true) {
      circles[i].update();
    }
  }
}

void animate() {
  anim = !anim;
}

void mouseClicked() {
  animate();
}