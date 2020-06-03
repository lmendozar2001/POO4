class Shape {
  int tinte;
  int posx;
  int posy;
  int dim;
  float angulo;
  
  Shape(int tinte, int posx,int posy, int dim, float angulo) {
    this.angulo = angulo;
    this.tinte= tinte;
    this.dim= dim;
    this.posx= posx;
    this.posy= posy;
  }

  public void draw() {
    push();
    if (guarda && crea==true){
      fill(0);
    }else
    fill(color(tinte));
    translate(posx, posy);
    rotate(angulo);
    rectMode(CENTER);
    rect(0, 0, dim, dim);
    circle(0, 0, 50);
    pop();
  }

  void rotar() {
    if ((dist(posx, posy, mouseX, mouseY)<50) && (keyPressed)) { 
      if (key=='j' || key=='J') {
        angulo = angulo - radians(15);
        delay(100);
      }
      if (key=='l' || key == 'L') {
        angulo = angulo + radians(15);
        delay(100);
      }
    }
  }

  public void mover() {
    if ((dist(posx, posy, mouseX, mouseY)<50) && (mousePressed)) {
      posx = mouseX;
      posy = mouseY;
    }
  }
}
