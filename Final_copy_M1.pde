Minim minim;
AudioPlayer audioPlayer1;
AudioBuffer audioBufferleft1;
AudioBuffer audioBufferright1;
AudioBuffer audioBuffermix1;
AudioBuffer audioBufferlevel1;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//
float F1_x=width/5;
float F1_y=width/4.7;
float [] blue = new float[5];
float [] beat = new float[10];
float dia;
float bluex, bluey;
float b;
float theta;

//
//float [] F1 = new float[10];
int frame = 8; //frame weight
float t,t1,t2,t3,t4;
float f1x1,f1y1,f1x2,f1y2,fx3,fy3;
float f2x1,f2y1,f2x2,f2y2 ,f2x3,f2y3;
PFont font;



void setup(){
  fullScreen();
 // size(1080,720);
  minim = new Minim(this);
  
  audioPlayer1 = minim.loadFile("Saje-Our Story .mp3");
  audioPlayer1.play();
  audioBufferleft1 = audioPlayer1.left;
  audioBufferright1 = audioPlayer1.right;
  audioBuffermix1 = audioPlayer1.mix;
  audioBufferlevel1 = audioPlayer1.mix;
  font =loadFont("BodoniBE-LightItalic-48.vlw"); 
  frameRate(10);
  noCursor(); //
 background(0);
  
  
}



void draw(){
  if(frameCount>250){
  background(0);
  frameCount=0;
  }
 rectMode(CORNER);
 fill(255);
 //font =  createFont("BodoniBE-LightItalic-48.vlw",20);
 textFont(font);
 textSize(30);
 text("Imag(in)e",width/5+34,height/2.9); //1
 textSize(20);
 text("Amor Fati",width/5+225+frame,height/4*2.16,15);
 textSize(40);
 text("YOU.",width/4*2.59,height/7+frame+115);
  stroke(255);
  strokeWeight(frame+2);
  noFill();
  rect(width/5, height/4.7, 190, 280); //frame 1
  
  strokeWeight(frame);
  rect(width/5+200+frame , height/4.7+300+frame, 130, 150 ); //frame 2
  strokeWeight(frame);
  stroke(255,100);
  rect(width/4*2.5, height/7+frame,170,200); //frame 3
  //**Frame sketch, Background
  
  
  ////////////////////////////////////////////////////Mapping Loop period
  
   pushMatrix();
 
  float F1_1 =audioBuffermix1.get(500);
  float F1_2 =audioBuffermix1.get(80);
  
  
  //**Variables of Beats
  
  
 
 //for(float i=0; i <F1.length; i++){
 // stroke(0,random(100),random(255),random(25,150));
 // bezier(width/5, height/4.7 , width/2 ,map(F1_1,0,1,height/5,0),map(F1_1,0,1,height/5,0),map(F1_1,0,1,height/5,0) ,0,0);
 //}

 float F1_1_e= map(F1_1,0,1,10,50);
 f1x1=bezierPoint(width/5-10,0,map(F1_1,0,1,height/2,width/2),0,t);
 f1y1=bezierPoint(height/4.7-3,map(F1_1,0,1,height/7,width/2),10,0,t);
 noStroke();
 fill(random(255),0,random(100,255),random(30,100));//50,175
 ellipse(f1x1,f1y1,F1_1_e,F1_1_e);


 float F1_2_e= map(F1_2,0,1,20,50);
 f1x2=bezierPoint(width/5,map(F1_2,0,1,height/5,width/3*2),map(F1_2,0,1,height/5,width/3*2),map(F1_2,0,1,0,width/3*2),t1);
 f1y2=bezierPoint(height/4.7+300,map(F1_2,0,1,height/7*6,width),height/7*6,height,t1);
 noStroke();
 fill(random(100),0,random(255),random(30,100));//50, 175
 rect(f1x2,f1y2,F1_2_e,F1_2_e);

 //moving dote.
 if(t<1){
   t += 0.04;
 }else{
   t=0;
 }  
 
  if(t1<1){
   t1 += 0.04;
 }else{
   t1=0;
 }  
 
 popMatrix();
 pushMatrix();
 
 float F2_1 =audioBuffermix1.get(90);
 float F2_2 =audioBuffermix1.get(120);
 translate(width/5+200+frame,height/4.7+300+frame);
 
 float F2_1_e= map(F2_1,0,1,20,0);
 f2x1=bezierPoint(130,200,map(F2_1,0,1,height/2,width/2),width/5*3,t2);
 f2y1=bezierPoint(0,-map(F2_1,0,1,height/7*3,width*2),10,height/2,t2);
 stroke(random(30),random(100,200),random(200,255),random(100,150));//(100,255)
 strokeWeight(0.5);
 noFill();
 rect(f2x1,f2y1,F2_1_e,F2_1_e);
 
  float F2_2_e= map(F2_2,0,1,10,30);
 f2x2=bezierPoint(130,-map(F2_2,0,1,-height/5*3,-width/3),map(F2_2,0,1,height/5,width/3*2),-map(F2_2,0,1,0,width/3*2)/-2,t3);
 f2y2=bezierPoint(150,map(F2_2,0,1,height/7*3,width),-height/7*6,-height,t3);
 noStroke();
 fill(0,255,255,random(100));
 rect(f2x2,f2y2,F2_2_e,F2_2_e); //little gree nemo
 

 if(t2<1){
   t2 += 0.02;
 }else{
   t2=0;
 }  
 
 if(t3<1){
   t3 += 0.02;
 }else{
   t3=0;
 }  
 popMatrix();
 pushMatrix();
 
 float F2_3 =audioBuffermix1.get(450);
 float F2_3_e= map(F2_3,0,1,10,60);

 for(float i=0; i <blue.length; i++){
  
  noStroke();
  fill(random(255),random(50));
  //strokeWeight(1);
  bluex = bezierPoint(width/5+200+frame, width/6*4,map(F2_3,0,1,height/2,width/2)*i, width, b);
bluey = bezierPoint(height/4.7, map(F2_3,0,1,height/5,width/6)*i, map(F2_3,0,1,height,width/2) , 0, b);
ellipse(bluex, bluey, F2_3_e, F2_3_e);
  }
 if (b < 1) {
  b += 0.008;
  } else {
    b = 0;
  }
 
 float F2_4 =audioBufferleft1.get(100);
 float F2_4_e= map(F2_3,0,1,10,60);
 //rect(width/5+200+frame , height/4.7+300+frame, 130, 150 ); //frame 2
 f2x3=bezierPoint(width/5+200+frame,width/5*2,map(F2_1,0,1,height/5,width/4*3.5),width/6*5,t2);
 f2y3=bezierPoint(height/4.7+300+frame+150,-map(F2_1,0,1,-height/7*6,width*2.6),height/7*6,height,t2);
 noStroke();
 fill(255,230,0,random(80));
 rect(f2x3,f2y3,F2_4_e,F2_4_e); //yellow little
 
 
 if(t4<1){
   t4 += 0.02;
 }else{
   t4 = 0;
 }
 
 
 
 
 
 ///////////////Box sound
 
 popMatrix();
 pushMatrix();

 float level = audioBufferlevel1.level();
 float F3 =audioBuffermix1.get(420);
 float F4 =audioBuffermix1.get(3);
 float F5 =audioBuffermix1.get(8);
 float sw =map(level,0,1,frame,70);
 float sc =map(level,0,1,20,150);
 float F4_r =map(F4,0,1,30,50);
  float F5_r =map(F5,0,1,30,-10);
 float F3_r= map(level,0,1,170,180);
 float F3_rr= map(level,0,1,200,220);
 for(float i=0; i<50 ; i++){
  stroke(random(175,255),0,random(200,255),sc);
 }
  strokeWeight(sw);
  rectMode(CENTER);
  fill(0,20);
  rect(width/4*2.5+85, height/5+frame+31,F3_r,F3_rr); ///MMMM
  rectMode(CORNER);

   
 popMatrix();
 pushMatrix();
 noStroke();
 fill(0,20);
   
 rect(width/5+200+frame-5 , height/4.7+150+frame, 140, 150 ); //blue on
 fill(0,20);
 rect(width/5+200+frame , height/4.7+300+frame-5, 140-14, 160 ); // black2 in
 rect(width/5+200+frame-4 , height/4.7+450+frame-5, 140, 160 ); //black -blue under
 rect(width/5+frame , height/4.7+frame-5, 182, 272 );
 rect(width/5-6 , height/4.7-160, 202, 150 ); //black1 on
 rect(width/5-6 , height/4.7+200, 202, 150 );
 beatRect(width/5+200+frame, abs(F4_r/2), color(0,200,255,75));
 beatRect(width/5+200+frame, F5_r/2+15, color(0,200,255,75));
 beatRectH(width/5,abs(F4_r/2)-0.6,color(100,0,255,75));
 beatRectH(width/5,abs(F4_r/2)+29,color(100,0,255,75));
 
 popMatrix();
 pushMatrix();

 popMatrix();
 
 }
   
//void draw is ended.
  
  
  void beatRect(float x, float y, color c){
   fill(c);
   rect(x-4,y*10+height/4.7+150,139,5);
   
  }
  
  void beatRectH(float x, float y, color c){
   fill(c);
   rect(x-5,y*10+height/12,201,5);
   
  }
  