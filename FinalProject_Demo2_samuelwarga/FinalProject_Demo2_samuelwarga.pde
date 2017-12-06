import processing.video.*;

// Import the library
import gab.opencv.*;

// We need Java rectangles
import java.awt.Rectangle;

// Library object
OpenCV opencv;

// Capture object
Capture cam;

// Array of faces found
Rectangle[] faces;


PShape Head;
float ry;

void setup() {
  
  size(1920,1080,P3D);

  
  
  Head = loadShape("head_sam_1.obj");
  
  
  
    // Start capturing
  cam = new Capture(this, 320, 240);
  cam.start();
    // Create the OpenCV object
  opencv = new OpenCV(this, cam.width, cam.height);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  
}
void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
    background(40);
    text("press A to start", width/2,height/2);
    
      opencv.loadImage(cam);
  
  // Detect the faces
  faces = opencv.detect();

  // Draw the video
  image(cam, 0, 0);

  // If we find faces, draw them!
  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255,0,0);
      noFill();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  }

head();

}

void head() {
      lights();
    translate(mouseX, mouseY);
    rotateZ (PI);
    rotateY (mouseY*0.02);
    rotateX (mouseX*0.01);
    scale(3);
    if(key=='a'){
      shape(Head);
      ry+=0.008;
    }
}