import processing.video.*;
Movie myMovie/*, movie2, movie3*/;
Movie pregameVid;

//boolean mov1isPlaying;
//boolean mov2isPaused;
//boolean mousepress1;
boolean timerstatestart = false;

int timer= 30; // setting up timer variable for 2 second timer
int currentTime=0; 
int savedTime=0;

String state = "pregame"; //create String variable called state and assign initial value

void setup() {
  frameRate(25);
  size(1200, 1200);
  myMovie = new Movie(this, "gifout101117_1B.mp4");
  myMovie.loop();
  pregameVid = new Movie(this, "Pregame Video-1.mp4");
  pregameVid.loop();
  //background(255);
 // mov1isPlaying = true;
 // mov2isPaused = true;
  // mousepress1 = ;
}


void draw() {
  // currentTime = second(); //update currentTime continuosly
  gameDraw();
  //gameInteraction();
}

void gameDraw() {
  textSize(46);
  textAlign(CENTER);
  if (state.equals("pregame")) {
    introscreen();
  } else if (state.equals("game")) {
    vidplay1();
  } else if (state.equals("vid1click1")) {
    vidpause1();
  } else if (state.equals("vidclick1_2")) {
    vidpause1();
    timerstate_action();
  }
  println(state);
}

void mouseClicked() {
  if (state.equals("pregame")) {
    state = "game";
  } else if (state.equals("game")) {
    state = "vidclick1_2";  ///change here
  } else if (state.equals("vidclick1")) {
    state = "vidclick1_2";
  } else if (state.equals("vidclick1_2")) {
    state = "game"; //usually gameover, but changed to vidclick1_2. where next series of videos will go
  } else if (state.equals("game_over")) {
    state = "pregame";
  }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
void vidplay1() {
  image(myMovie, 0, 0, width, height);
  myMovie.play();
}  

void vidpause1() {
  if (currentTime-savedTime > timer) { 
    println("time is triggered!");
    savedTime=currentTime; //assign value of current time to savedTime
    timerstatestart = !timerstatestart;
  }
  myMovie.pause();
  fill(255);
  text("HOW MARVELOUS! CLICKY FOR DREAM", width/2, height/10);
}

void pregamevid() {
  image(pregameVid, 0, 0, width, height);
}

void introscreen() {
  pregamevid();
  fill(255);
  text("I am dreaming , Click me and help me dream", width/2, height/2);
}

//void timerclock() {

//}

void timerstate_action() {
  if (timerstatestart==true) {
    currentTime = second(); //update currentTime continuosly
    if (currentTime-savedTime > timer) { 
      println("time is triggered!");
      savedTime=currentTime; //assign value of current time to savedTime
      introscreen();
    }
  }
}
    void sampletext() {
    text("testing123", width/2, height/2);
  }