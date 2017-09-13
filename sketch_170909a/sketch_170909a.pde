//this is the first artwork for language
void setup() {
size(1280,720);

//determines canvas size

background(165,84,64);
//background color
}

void draw() {

noFill();
stroke(255,200,200); 
strokeWeight(12);
beginShape();
vertex(400, 100); // first point
bezierVertex(605, 605, 100, 800, 50, 400);
endShape();
  
  
//circle right upper
noStroke();
fill(255,255,255,220);
ellipseMode(CENTER);
ellipse(1100,20,800,800);

//circle left lower
noStroke();
fill(0,0,0,180);
ellipseMode(CENTER);
ellipse(200,700,800,800);

//quadblackbehind1
noStroke();
fill(0,0,0,255);
quad(1000,700,1100,550,1100,110,1000,40);

//quadtan2behind
noStroke();
fill(252,185,85,200);
quad(400,427,400,283,50,240,50,350);



//quadyellow1
noStroke();
fill(255,255,97,220);
quad(100,490,100,350,775,200,775,350);

//quadtan1
noStroke();
fill(252,185,85,200);
quad(400,427,400,283,1200,400,1200,650);


//quadred1
noStroke();
fill(252,0,0,100);
quad(000,400,000,320,1280,700,1280,830);

}