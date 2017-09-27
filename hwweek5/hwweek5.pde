float randocol;
float c1 = 0;
float c2 = 255;
float c1Change = 1;
float c2Change = -1;

int x = 50;
int y = 50;
int w = 100;
//David at top of stairs
//Samuel Warga
//INSTRUCTIONS, start with mouse in bottom right of screen, click and follow stairs up to top with clicked mouse

int h = 75;

PImage photo;



void setup() {
  size(600,600);
  background(255);
  stroke(0);
  noFill();
  fill(255);
  line(100,0,100,200);
  
  photo = loadImage("michelangelos-david-monumental-bust-7566.png");
  
}

void draw() {
  
  randocol = random(0,255);
  c1 = c1 + c1Change;
  
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(photo, 0, 0);
  }
    
  
  
  
  //color change with click
  if (c1 < 0 || c1 > 255) {
    c1Change *= -1;
  }
   

}
void mousePressed() {
  for (float i = 21; i < width; i *= 1.2) {
    fill(c1,0,c2);
    rect(0,i,i,i*3);
  }
}

void mouseDragged() {
  fill(randocol);
  rect(mouseX,mouseY, 20,20);
}