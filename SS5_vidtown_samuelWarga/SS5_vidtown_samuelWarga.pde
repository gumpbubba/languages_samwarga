//Samuel Warga, VidTown,
//Simpl interaction, move mouse to change tint of video


//import video library
import processing.video.*;



//declare capture object
Capture video;

int xPos=200; 

float rr = random(255);
float rg = random(255);
float rb = random(255);



//read from camera when new image available
void captureEvent(Capture video) {
  video.read();
}



void setup() {
  size(1280, 720);
  //initialize capture obj

  video = new Capture(this, 1280, 720);
  //start capturing
  video.start();
}

int col = 0; 

void draw () {
  frameRate(80);
   // imageMode(CORNER);

  image(video, width,height);
  col+=20;
  col%=255; 


  //display video image
  tint(col,col*2,mouseY);
 // imageMode(CENTER);
  scale(.5);
  image(video, xPos, mouseY*2);
  xPos=xPos+1;
  if (xPos>width+20)
  {
    xPos=-20;
  }

  textSize(106);
  text("move mouse around", width, height*1.7);
}