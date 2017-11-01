class Square {
  int x1;
  int y1;
  int x2;
  int y2;
  int c;
  float xpos, ypos;
  float xspeed = 2.8;
  float yspeed = 2.2;

  //added below direction, sam


  int x;
  int y;

  int dirX;
  int dirY;

  Square(int tempx1, int tempy1, int tempx2, int tempy2) {
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
    rectMode(CENTER);
    rect(x, y, 150, 150);

  }

  void screensaverbounce() {




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