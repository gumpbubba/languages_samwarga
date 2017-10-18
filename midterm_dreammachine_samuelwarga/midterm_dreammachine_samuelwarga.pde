//midterm languages samuel warga
//import libraries
import processing.video.*;
import processing.sound.*;
import ddf.minim.*;



//declaire ddf.minim globals

AudioSnippet bgmusic;
Minim minim;



//declare movies
Movie pregameVid;
Movie vid1;
Movie transitionVid;
Movie vid2;
Movie vid3;
Movie eye;
Movie snail;

//pshape declare pointer icon introscreen
PShape pointer;

//set game state string
String state = "pregame";


void setup() {
  frameRate(25);
  size(500, 500);
  background(0);



  //svgsetup
  pointer = loadShape("cursorHand.svg");

  //audiosetup
  minim = new Minim(this);
  bgmusic = minim.loadSnippet("bgmusic2.mp3");

 

  ///videosetup

  pregameVid = new Movie(this, "Pregame Video-1.mp4");
  pregameVid.loop();

  // placeholderVid = new Movie(this, "discotheque_nightclub_512kb.mp4");
  // placeholderVid.loop();

  transitionVid = new Movie(this, "tl1.mp4");
  transitionVid.loop();
  // transitionVid.loop();

  eye = new Movie(this, "eye.mp4");
  eye.loop();

  snail = new Movie(this, "snail.mp4");
  snail.loop();


  vid1 = new Movie(this, "gifout101117_1B.mp4");
  vid1.loop();


  vid2 = new Movie(this, "vid2_words.mp4");
  vid2.loop();

  vid3 = new Movie(this, "vid3.mp4");
  vid3.loop();
}

void draw() {
  bgmusic.play();
  gameDraw();

}


void gameDraw() {
  textSize(46);
  textAlign(CENTER);
  if (state.equals("pregame")) {
    introscreen();
  } else if (state.equals("game")) {
    vidplay1();
  } else if (state.equals("vidclick1")) {
    vidplay1_pause() ;
  } else if (state.equals("vidclick1_click")) {
    transitionvideo() ;
  } else if (state.equals("transclick1")) {
    vidplay2() ;
  } else if (state.equals("vidclick2")) {
    vidplay2_pause() ;
  } else if (state.equals("snailvid")) {
    snailtrans();
  } else if (state.equals("vid3")) {
    vidplay3();
  } else if (state.equals("vid3_pause")) {
    vid3_pause();
  } else if (state.equals("dreamend")) {
    dreamendvid();
  } else if (state.equals("showdream1")) {
    imagedream1();
  }
}

void mouseClicked() {
  if (state.equals("pregame")) {
    state = "game";
  } else if (state.equals("game")) {
    state = "vidclick1";
  } else if (state.equals("vidclick1")) {
    state = "vidclick1_click";
    save("dream1.jpg");
  } else if (state.equals("vidclick1_click")) {
    state = "transclick1";
  } else if (state.equals("transclick1")) {
    state = "vidclick2";
    save("dream2.jpg");
  } else if (state.equals("vidclick2")) {
    state = "snailvid";
  } else if (state.equals("snailvid")) {
    state = "vid3";
  } else if (state.equals("vid3")) {
    state = "vid3_pause";
    save("dream3.jpg");
  } else if (state.equals("vid3_pause")) {
    state = "dreamend";
  } else if (state.equals("dreamend")) {
    state = "showdream1";
  } else if (state.equals("showdream1")) {
    state = "pregame";
  }
}
//images functions
void imagedream1() {
  //declare images
  background(0, 255, 0);
  PImage dream1img = loadImage("dream1.jpg");
  image(dream1img, 0, height/ 3, width/3, height/3);

  PImage dream2img = loadImage("dream2.jpg");
  image(dream2img, 166, height/3, width/3, height/3);

  PImage dream3img = loadImage("dream3.jpg");
  image(dream3img, 332, height/3, width/3, height/3);

  // text
  fill(255);
  text("Dream Again?", width/2, 50);
  shape(pointer, width/2.3, 400, 150, 100);
}


//INTEGRAL func. to vid play movieEvent, leave here
void movieEvent(Movie m) {
  m.read();
}

//VIDEO FUNCTIONS IN CHRONOLOGICAL ORDER

void introscreen() {
  image(pregameVid, 0, 0, width, height);
  pregameVid.play();
  fill(255);
  text("Help me dream", width/2, height/2);
  shape(pointer, width/2.3, 400, 150, 100);
}




void vidplay1() {
  image(vid1, 0, 0, width, height);
  vid1.play();
}


void vidplay1_pause() {
  vid1.pause();
}

void transitionvideo() {
  image(transitionVid, 0, 0, width, height);
  transitionVid.play();
}

void vidplay2() {
  image(vid2, 0, 0, width, height);
  vid2.play();
}
void vidplay2_pause() {
  vid2.pause();
}

void snailtrans() {
  image(snail, 0, 0, width, height);
  snail.play();
}


void vidplay3() {
  image(vid3, 0, 0, width, height);
  vid3.play();
}

void vid3_pause() {
  vid3.pause();
}

void dreamendvid() {
  image(eye, 0, 0, width, height);
  eye.play();
}