//original class "Square" by Katie, "circle" added by Sam
//methods I added are "screensaverbounce" and "screensaverbounce_circle"
//Title: "TripSaver" by Sam and Katie


Square sqr;
Circle circ;

void setup() {
  sqr = new Square(20, 20, 400, 400);

  circ = new Circle(50, 100, 200, 200);

  //Many = new Circle[50];

  size(1000, 720);
  background(250);
  colorMode(HSB);



  //
}


void draw() {
  sqr.display();
  sqr.screensaverbounce();
  circ.screensaverbounce_circle();
  circ.display();



  }