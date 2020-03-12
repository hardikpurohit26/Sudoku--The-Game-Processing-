//import java.awt.*;
//import java.awt.event.*;
//import java.text.*;
//import java.lang.*;
//import java.util.*;
//import java.io.*;
import processing.sound.*;
boolean isError = false;

boolean updateBackground = true;    // for animation

int LevelInfoEncryption = 32; 
int LevelUnlocked;
int LevelSelected = 1;

boolean isHelpAbout = true;
boolean isLoaded = false;

//lOADING PAGE DEFINITIOON

PImage background;
PImage mainLogo;

SoundFile music,keypress;
         

//  Main Menu page Defining;
Animator quit,play/*,custom*/;
PImage playButton,quitButton/*,customLevel,customLevelSelected*/;
MusicSoundHelpButton musicSoundHelpButton;


//level selection page assets defining
PVector cquit,cplay,ccustom;
PVector dimensionQuit,dimensionPlay,dimensionCustom;
 Level[] level = new Level[10];
 PImage levelLocked;
 Animator back;
 PVector cback;
 PImage backButton;
 
 // Level playing assests
 boolean isLevelCreated = false;
 PVector boardPosition;
PVector keyPosition;
ScribbleButton scribbleButton;
Board board;
KeyMouseButton keyMouseButton;
PlayPauseButton playPauseButton;
DeleteClearButton deleteClearButton;
SoundFile beep;
Clock clock;
 
 
//quit menu
PImage areusure,crossgreen,correctred;
PVector posAreusure,posCross,posCorrect;
PVector dimensionAreusure,dimensionCross,dimensionCorrect;
 
 //pauseMenu
 PauseMenu pauseMenu;
 //level completion
 LevelCompleted levelCompleted; 
 
void setup(){
 //fullScreen();
  size(1000,700); 
  
  try{
  //setting the loading page  and displaying
  background = loadImage("images\\mislan\\background.png");
  background.resize(width,height);
  mainLogo = loadImage("images\\mislan\\mainlogo.png");
  mainLogo.resize(int(0.575403*width), int(0.14716 * width));
  image(background,0,0);
  imageMode(CENTER);
  image(mainLogo,width/2,height/2); 
  imageMode(CORNER);
  textAlign(CENTER,CENTER);
  fill(#ED3566);
  textSize(0.06361323*height);
  text("Loading....",width/2,3*height/4);
  cursor(loadImage("images\\mislan\\cursor.png"),0,0); //DEFINING CURSOR
  surface.setIcon(loadImage("images\\mislan\\icon.png"));

} catch(NullPointerException e){
     
isError = true;


    
    
  }

 
  
 
  
 
  
  
  
  

  
  
}

void draw(){
  if(!isError){
 try{
  if(!isLoaded)
    {
   
     try{
         BufferedReader reader = createReader("information\\currentlevelinfo.hardik");
         LevelUnlocked =  int(reader.read())-LevelInfoEncryption;
         reader.close();
     }catch(IOException e){
        PrintWriter writer = createWriter("data\\information\\currentlevelinfo.hardik");
         writer.print(char(LevelInfoEncryption+1));
         writer.flush();
         writer.close();
         LevelUnlocked =1;
     }
      catch(NullPointerException e){
         PrintWriter writer = createWriter("data\\information\\currentlevelinfo.hardik");
         writer.print(char(LevelInfoEncryption+1));
         writer.flush();
         writer.close();
        LevelUnlocked =1;
      }

     current = page.inBetweenLoadingAndMainMenu;
   music = new SoundFile(this,"sounds\\maintheme.mp3");
   keypress = new SoundFile(this,"sounds\\keypress.mp3");
        keypress.rate(2);
  
  
  defineMainMenu();     
   defineLevelSelection();
   definePlayMode();
   defineQuitMenu();
  definePauseMenu();
 
  music.play(1,0,0.2,0,4);  
 
  
  
  isLoaded = true;
  

    }
    
  //if(musicSoundHelpButton.musicActivated)
        
  // else
  //      music.stop();
if(updateBackground){
  image(background,0,0);
  fill(255);
  textSize(20);
  text("\u00a9H&Co.",50,20);

  if(current == page.inBetweenLoadingAndMainMenu )
  {inBetweenLoadingAndMainMenu(); }
  if(current != page.quitMenu && current != page.inBetweenLoadingAndMainMenu && current != page.pauseMenu && current != page.levelCompleted && current != page.helpPage && current != page.levelLost )
  musicSoundHelpButton.display();
}  
  if(current == page.mainMenu)
      mainMenu(); 
  
  if(current == page.quitMenu)
       quitMenu();

  if(current == page.inBetweenMainMenuAndLevelSelection){
      inBetweenMainMenuAndLevelSelection(1);;
  }
       
     if(current == page.levelSelection)
      levelSelection(); 
      
        if(current == page.levelLost)
      LevelLost();  
      
   if(current == page.inBetweenLevelSelectionAndMainMenu){
       inBetweenMainMenuAndLevelSelection(0);
   }
  
  if(current == page.inBetweenLevelSelectionAndPlayMode)
       { inBetweenLevelSelectionAndPlayMode();}
  
 
  if(current == page.playMode)
   { playMode(); }
     
 else if(current == page.pauseMenu)
    { pauseMenu(); 
     playPauseButton.display();
    }
  
     if(current == page.levelCompleted)
         levelCompleted.display();
       if(current == page.helpPage)
          helpPage();
 }catch(NullPointerException e){
        isError = true;
    
  }

}
else{
      fill(0);
  rectMode(CORNER);
  rect(0,0,width,height);
  
textSize(height/12);
textAlign(CENTER,CENTER);
fill(255);
text("Files have Been Tampered!!!\nDownload game again..",width/2,height/2);
textSize(height/16);

  text("Press Any Key to Continue....",width/2,3*height/4);
  
  if(mousePressed || keyPressed)exit();
  
}

}

void keyPressed(){

  if(key == ESC)
    {
if(current == page.playMode  || current == page.pauseMenu){
 if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }             

if(playPauseButton.isPlayButtonOn){playPauseButton.isPlayButtonOn = false; current =page.pauseMenu;clock.timeTaken = clock.flag;}
       else{ playPauseButton.isPlayButtonOn = true; current = page.playMode;clock.baseTime = new PVector(hour() , minute() , second() );}
       delay(150);
       
}
          
       key = 0;

  
   }


 }
