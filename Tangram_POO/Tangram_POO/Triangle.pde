class Triangle extends Shape {
  float scale; 
  Triangle(int tinte, int posx,int posy, int dim, float angulo, float scale){
    super(tinte, posx, posy, dim, angulo);
    this.scale= scale;
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
    scale(scale);
    triangle( -3*dim, -dim,3*dim, -dim, 0, 2*dim);
    pop();
  }
}
