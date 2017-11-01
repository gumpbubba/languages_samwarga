//Boatclass homework
//10/25/17
//Sam Warga

//a mother boat spawns babies and ships them off to see the sea, oh fare thee well young tugs (toot, toot)


//define PShape svg name
PShape ship;

//define object
ship myShip1;

//ship array
ship[] ships = new ship[400];

//setup
void setup() {
  size(500, 300);
  //ship with arguments
  myShip1 = new ship(color(51), 0, 100, 2); 
  ship = loadShape("ship.svg");

  for (int i = 0; i < ships.length; i++) {
    ships[i] = new ship(color(i*2),0,i*20, i/2.0);
  }
}
//draw
void draw() {
  background(255);
    for (int i = 0; i < ships.length; i++) { 
    ships[i].move();
    ships[i].display();
  
}
}
//ship class
class ship { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // constructor with parameters 
  ship(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC++;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    shape(ship, xpos, ypos, 150, 150);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}