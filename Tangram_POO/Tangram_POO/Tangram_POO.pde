int saved=8;
int contador=0;
int gana=0;
int niveles=1;
boolean drawGrid;
boolean crea;
boolean guarda;
boolean juega;
boolean instruc;
boolean pix = true; 
PImage image, m1, m2, m3,i,j,k,l,s,g;
Shape[]shapes;
Boton []botones;

void setup() {
  size(900, 600);
  imagenes();
  botones= new Boton[3];
  botones[0]= new Boton(color(108,134,188),450,300,75,0,"Jugar",55);
  botones[1]= new Boton(color(108,134,188),450,400,75,0,"Modo Creador",15);
  botones[2]= new Boton(color(108,134,188),450,500,75,0,"Como Jugar",25);  
  niveles();
}


void draw(){
  menu();
  if(instruc==true){
    instrucciones();
  }
  if (juega || crea ){ 
    background(205);
    if (juega == true && crea == false){
    image(image,0,0,width-5,height-5);
    }
    noStroke();
    for (Shape figura : shapes){
      figura.draw();
      figura.mover();
      figura.rotar();
    }
    if (drawGrid){
      drawGrid(10);
    }
    if (juega == true && crea == false){
    cuentapixeles();
    pix = win(contador);
    if ( pix == false){
      gana= gana + 1;
      setup();
      if((gana+1)==saved){
        ganador();
      }
    }
    }
  }
}

void cuentapixeles(){
  loadPixels();
  contador=0;
  for(int i=0;i<width*height;i++){
    float r= red(pixels[i]) ;
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    if(r==0 & g==0 & b==0){
      contador++;
    }
  }
}
boolean win( float contador){
  if(contador<10) return false;
  else return true;
}

void ganador(){
  background (random (0,255), random (0,255), random(0,255));
  fill (255);
  push();
  translate(0,0);
  textSize (100);
  text("!FELICITACIONES!", 25,height/2);
  delay (200);
  pop();
}

void drawGrid(float scale) {
    push();
    strokeWeight(1);
    int i;
    for (i=0; i<=width/scale; i++) {
        stroke(0, 0, 0, 20);
        line(i*scale, 0, i*scale, height);
    }
    for (i=0; i<=height/scale; i++) {
        stroke(0, 0, 0, 20);
        line(0, i*scale, width, i*scale);
    }
    pop();
}

void keyPressed() {
    if (key == 'g' || key == 'G'){
        drawGrid = !drawGrid;
    }
    if (key == 's' || key == 'S'){
        guarda= !guarda;
    }
    if (key== ENTER){
        juega=false;
        crea=false;
        instruc=false;
    }
}

void keyReleased(){
    if (crea && guarda && key == 's' || key == 'S' ){
        save("data/tang_"+saved+".png"); 
        guarda= !guarda;
        saved=saved+1;
    }
    if (key== ENTER){
        setup();
        redraw();
    }    
}

void menu(){
  background(178,70,57);
  image(m1,600,250,200,225);
  image(m2,100,300,200,200);
  fill(255);
  textSize (100);
  rectMode(CENTER);
  text("¡TANGRAM!",175, 175);
  for (Boton bot : botones){
    bot.draw();
    bot.selec();
  }
  if (botones[0].selec == true && crea==false && juega == false && instruc == false ){
    juega = true;
  }
  if (botones[1].selec == true  && crea==false && juega == false && instruc == false){
    crea = true;
  }
  if (botones[2].selec == true && crea==false && juega == false && instruc == false){
    instruc = true;
  }  
}

void inicio(){
  shapes = new Shape[7];
  shapes[0]= new Triangle(color(201, 58, 58),150,50,50,0,1);
  shapes[1]= new Triangle(color(180, 201, 58),50,150,50,radians(-90),1);
  shapes[2]= new Triangle(color(58, 201, 77),250,250,50,radians(-45),0.7);
  shapes[3]= new Triangle(color(58, 201, 184),275,75,50,radians(90),0.5);
  shapes[4]= new Triangle(color(58, 65, 201),150,200,50,radians(180),0.5);
  shapes[5]= new Shape (color(158, 58, 201),225,150,106,radians(45));
  shapes[6]= new Quad (color(201, 58, 101),113,262,0,0);
}

void niveles(){
   nivel();   
}

void nivel(){
  image=loadImage("tang_"+(gana+1)+".png");
  inicio();
}

void imagenes(){
  m1=loadImage("1.png");
  m2=loadImage("2.png");
  i=loadImage("i.png");
  k=loadImage("k.png");
  l=loadImage("l.png");
  g=loadImage("g.png");
  j=loadImage("j.png");
  s=loadImage("s.png");
}

void instrucciones(){
  background(46);
  fill(255);
  textSize(40);
  text("Mover figuras con el mouse",150,100);
  text("Rotar figura",300,200);
  image(l,225,150,75,75);
  image(j,150,150,75,75);  
  text("Espejo paralelogramo",300,300);
  image(i,150,250,75,75);
  image(k,225,250,75,75);
  text("Guarda figura",300,400);
  image(s,187,350,75,75);
  text("Cuadricula",300,500);
  image(g,187,450,75,75);
}
