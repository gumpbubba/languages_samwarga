class Circle {
  int x1;
  int y1;
  int x2;
  int y2;
  int c;
  //added below direction, sam


  int x;
  int y;

  int dirX;
  int dirY;

  Circle(int tempx1, int tempy1, int tempx2, int tempy2) {
    x1 = tempx1;
    y1 = tempy1;
    x2 = tempx2;
    y2 = tempy2;
  }

  void display() {
    if (c >= 255)  c=0;  
    else  c++;
    fill(c, 255, 255);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y/2, 150, 150);

  }

  void screensaverbounce_circle() {


    //sam
    x +=dirX;
    y +=dirY;



    if (y > 720) {
      dirY=-1;
    } 

    if (y < 1) {
      dirY=1;
    }
    if (x > 1000) {
      dirX=-1;
    }
    if (x < 1) {
      dirX=1;
    }
  }
}