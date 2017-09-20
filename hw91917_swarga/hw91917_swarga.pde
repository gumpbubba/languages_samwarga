//bizarre triangle
//by sam warga

float bkr = 255;
float bkg = 209;
float bkb = 54;

float filloner = 116;
float filloneg = 255; 
float filloneb = 116;

float fillrandr;
float fillrandg;
float fillrandb;


void setup() {
  
 size(1920,1080);
 frameRate(10);
 
}


void draw() {
  
  background(bkr, bkg, bkb);
  noStroke();
 
 if (mousePressed) {
  fill(fillrandr, fillrandg, fillrandb);
  triangle(width/2,height/150,width,height,0,height);
 } else {
  fill(filloner, filloneg, filloneb); 
  triangle(width/2,height/150,width,height,0,height);
 }
 
 if (keyPressed == true) {
   
     background(fillrandr, fillrandg, fillrandb);
   
 }
     
   
 fillrandr = random(0,150);
 fillrandg = random(255);
 fillrandb = random(255);
 
 
 

}