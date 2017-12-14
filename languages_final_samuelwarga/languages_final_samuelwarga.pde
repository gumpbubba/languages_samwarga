//You and Me , Sam and Warga, A Final for Languages
//Samuel Warga


//minim libraries for sound

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


// libraries 

import processing.video.*;

import gab.opencv.*;

import java.awt.Rectangle;



// Library object
OpenCV opencv;

// Capture object
Capture cam;

// Array of faces found
Rectangle[] faces;




//head object global

PShape Head;
float ry;
int x;

PFont f;

//overlay image global
PImage img;
PImage smiley;

//audio minim declare
AudioPlayer player;
Minim minim;//audio context

void setup() {

  size(1920, 1080, P3D);
  img = loadImage("overlay.png");
  smiley = loadImage("smiley.png");
  //music
  minim = new Minim(this);
  player = minim.loadFile("music1.wav", 2048);
  player.play();
  //music



  Head = loadShape("head_sam_1.obj");
  //start camera capture
  cam = new Capture(this, 160, 120);

  cam.start();
  // Create the OpenCV object
  opencv = new OpenCV(this, cam.width, cam.height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}
//capture event intitiate
void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  
  background(40);
      image(img, 0, 0);


  opencv.loadImage(cam);

  // Detect the faces
  faces = opencv.detect();
  vidDraw();
  text("MAKE ME, YOU. PRESS MOUSE TO SAVE",5,100);
  textSize(3);
  
  // Find faces, draw P3D object
  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      //square tracker
      noFill();
      //3d obj style
      lights();

      //optional, uncomment for red boundary box on face detect, following line
     // rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
       
      image(smiley,faces[i].x -20, faces[i].y, 20,20);
      translate(faces[i].x *1.7, faces[i].y +10, faces[i].x / faces[i].y );
      
      //3d object rotations
      
      rotateZ (3.1);      //rotateY (mouseX*.02);
      rotateX (5);
      

      //3d object size and load
        
      scale(.5);
     // this.tint(0,0,0);
     translate(26,-29,-68);
      shape(Head);
      
      
     
     

    }
  }
}

void smiley() {
  //image(smiley,20,-40,50,50);
    

  
  
}

void vidDraw() {
  // Draw the video
  this.scale(10);
  this.translate(15, 0);
  image(cam, 0, 0);
  
}


void mousePressed(){
  saveFrame("you_and_me####.png");
}