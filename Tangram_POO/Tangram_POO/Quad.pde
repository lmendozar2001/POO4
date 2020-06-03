class Quad extends Shape {
  boolean espejo;
  Quad(int tinte, int posx, int posy, int dim, float angulo) {
    super(tinte, posx, posy, dim, angulo);
  } 
  public void draw() {
    if (guarda && crea==true){
      fill(0);
    }else
    fill(tinte);
    push();
    translate(posx, posy);
    rotate(angulo);
    circle(0, 0, 50);
    if (espejo== true) {
      quad( -113, -37, -38, 38, 112, 38, 37, -37);
    } 
    if (espejo == false) {
      quad( -113, 38, -38, -37, 112, -37, 37, 38);
    }
    pop();
  }
  
  public void mover() {
    if ((dist(posx, posy, mouseX, mouseY)<50) && (mousePressed)) {
      posx = mouseX;
      posy = mouseY;
    if (key=='i' || key=='I'){
     espejo = true;
     delay(100);
    }
    if (key=='k' || key =='K'){
     espejo = false;
     delay(100);
    }
    }
  } 
}
