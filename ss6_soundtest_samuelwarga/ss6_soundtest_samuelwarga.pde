//soundtest by Samuel Warga
//load background mountains

//declare pfont
PFont font;


//declare pimage and int a

PImage bg;

int a; 



//import minim libraries
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;

//declare minim and audioplayer, and fft for spectrum waveform
Minim minim;
AudioPlayer song;
FFT fft;

AudioOutput out;
Oscil       wave;

void setup()
{
  size(720, 480);
  bg = loadImage("mountains.jpg");


  // init minim
  minim = new Minim(this);

  // get AudioOutput object
  out = minim.getLineOut();
  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  // set Oscil to the output
  wave.patch( out );
  
  //load audio file
  song = minim.loadFile("voice.mp3", 1024);
  song.play();
  song.loop();
 //fft init
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void draw()
{
  background(bg);
  fft.forward(song.mix);

  stroke(255, 0, 0, 128);
  // draw the spectrum 
  for (int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, i, height - fft.getBand(i)*4);
  }

  stroke(255);
  for (int i = 0; i < song.left.size() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    //   line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  
  text("Move the mouse around to create sweet sound", 15, 300); 

  
}



void mouseMoved()
{
 // move mouse to create sound

  float amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude( amp );

  float freq = map( mouseX, 0, width, 110, 880 );
  wave.setFrequency( freq );
}