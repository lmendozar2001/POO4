class Boton extends Shape{
  String tex;
  boolean selec;
  int s;
  Boton(int tinte, int posx,int posy, int dim, float angulo,String tex, int s) {
    super(tinte, posx, posy, dim, angulo);
    this.tex=tex;
    this.s=s;
  }
  
  public void draw() {
    push();
    noStroke();
    fill(color(tinte));
    translate(posx, posy);
    rectMode(CENTER);
    rect(0, 0, 2*dim, dim,50);
    circle(0, 0, 50);
    fill(255);
    textSize (dim/4);
    text(tex,s, 25, 2*dim, dim);
    pop();
  }
  
  public void selec(){
    if ((dist(posx, posy, mouseX, mouseY)<50) && (mousePressed)) {
        selec=true;
    }
  }
}
