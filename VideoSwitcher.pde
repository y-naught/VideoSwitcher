/* 
***IMPORTANT NOTE***

The sum of the size of the videos you apply to this sketch must be less than the amount of RAM
you have allocated for processing to use. If you don't the sketch will fail to run in the JVM

*/

import processing.video.*;
import themidibus.*;

//initialize video slots
Movie video;
Movie video2;
Movie video3;
Movie video4;

//initialize switches for which video to show during draw
boolean vSwitch = false;
boolean vSwitch2 = false;
boolean vSwitch3 = false;
boolean vSwitch4 = false;

//initialize images
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(1280,1024,P2D);
  //create null images with dimensions and colormodes
  //if you dont do this now it will not run after starting videos
  img = createImage(width,height,RGB);
  img2 = createImage(width, height, RGB);
  img3 = createImage(width, height, RGB);
  img4 = createImage(width, height, RGB);
  
  //initialize the videos and their locations
  //you will need to import your own videos for this to work
  video = new Movie(this, "drag_1.mov");
  video2 = new Movie(this, "Flowfield_1.mov");
  video3 = new Movie(this, "OscilationPattern_1.mov");
  video4 = new Movie(this, "Spiral_1.mov");
}

//read a frame of the selected video if available during each refresh during draw
void movieEvent(Movie v){
 if(v == video){
  video.read();
  img = video;
 }
 if(v == video2){
  video2.read();
  img2 = video2;
 }
 if(v == video3){
  video3.read();
  img3 = video3;
 }
 if(v == video4){
  video4.read();
  img4 = video4;
 }
}

void draw(){
  background(0);
  
  //a swticher for which image to display (see keyPressed for the switch logic)
  if(vSwitch == true){
  image(img,0,0);
  }
  if(vSwitch2 == true){
   image(img2,0,0); 
  }
  if(vSwitch3 == true){
   image(img3,0,0); 
  }
  if(vSwitch4 == true){
   image(img4,0,0); 
  }
}


//use the keyPressed function to switch between videos and pause all other videos
void keyPressed(){
 if(key == 'a'){
  vSwitch = true;
  vSwitch2 = false;
  vSwitch3 = false;
  vSwitch4 = false;
  video.loop();
  video2.pause();
  video3.pause();
  video4.pause();
 }
 if(key == 's'){
   vSwitch2 = true;
   vSwitch = false;
   vSwitch3 = false;
   vSwitch4 = false;
   video.pause();
   video2.loop();
   video3.pause();
   video4.pause();
 }
 if(key == 'd'){
   vSwitch2 = false;
   vSwitch = false;
   vSwitch3 = true;
   vSwitch4 = false;
   video.pause();
   video2.pause();
   video3.loop();
   video4.pause();
 }
 if(key == 'f'){
   vSwitch2 = false;
   vSwitch = false;
   vSwitch3 = false;
   vSwitch4 = true;
   video.pause();
   video2.pause();
   video3.pause();
   video4.loop();
 }
}