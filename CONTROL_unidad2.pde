int pX, pY;       
int gX, gY;      
int pj=0;        
int pa=0;        
int disparos=30;  

PImage objetivo, nave, fondo,explosion1,explosion2;

void setup () {
  size(400,700);  
  pX = width/2; pY = 600;
    
  objetivo  = loadImage("alien.png");
  nave      = loadImage("nave.png");
  fondo     = loadImage("espacio.png");
  explosion1 = loadImage("boom.png");
  explosion2 = loadImage("boom2.png");
  strokeWeight(5);
  stroke(255,255,0);
  
  new_objetivo();
} 


void draw(){
  image (fondo, 0,0);
  boolean pampam = (keyPressed && keyCode==CONTROL); //pereza.
  gY=gY+2;

  if (gY >= height-75) {
     new_objetivo();
     pa++;
     disparos = disparos+15; //Se gastan muy rápido, así que añadí esto
  }
      
  if (pampam){
      line(pX+15, 650, pX+15, gY+20);
      image (explosion2, pX-10, gY);
      disparos--;
  }

  if (pX > gX-30 && pX < gX && pampam) {
     image (explosion1, gX, gY);
     pj++;    
     new_objetivo();
  }
      
  image (objetivo, gX-25, gY);
  text  ("ayy lmao", gX-40, gY);
  image (nave, pX-25, pY);
  teclado();
  text ("Objetivos eliminados: "+pj, 20,20);    
  
  int crono = int (millis()/1000);

  if (crono >= 60 || disparos ==0) noLoop(); 
     
  text ("Tiempo: "+ (60-crono), width-80,20);
  text ("Disparos: "+ (disparos), width-80,30);
} 

void new_objetivo(){
  gX = int (random(width)); 
  gY = 0;                    
}

void teclado(){
  if (keyPressed){
    if (keyCode == RIGHT) pX = pX + 3;
    if (keyCode == LEFT)  pX = pX - 3;
  }
  if (pX < 0)     pX=width;
  if (pX > width) pX=0;
}  
