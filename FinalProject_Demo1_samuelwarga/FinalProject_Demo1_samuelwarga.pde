

PShape Head;
float ry;

void setup() {
  
  size(1000,1000,P3D);

  
  
  Head = loadShape("head_sam_1.obj");
}

void draw() {
    background(40);
    text("press A to start", width/2,height/2);
  //kin
    //PImage imgC = kinect.getColorImage();
    //image(imgC, 0, 0);
  //kin section  
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