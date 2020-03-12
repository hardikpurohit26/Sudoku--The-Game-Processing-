class PlayPauseButton{
  Animator pauseAnimator;
 boolean isPlayButtonOn = true;     // variable to determine class status
// float SposX = keyPosition.x+0.052070174 * height ,SposY = 0.18229 * height + keyPosition.y;         //position for button3
 float Length = 0.085714*height, Height =Length;
 float PuposY = 0.04285714 * height ,PuposX = 0.975 * width - Length  ;
 float offset = 0.133 * Length;

 PImage publue;                     //images for buttons
 int KEYforPause = 'p'; 
 
  PlayPauseButton(){
          publue = loadImage("images\\playpausebutton\\pauseblue.png");
          publue.resize(int(Length),int(Height));
          //pyblue = loadImage("images\\playpausebutton\\playblue.png");
          //pyblue.resize(int(Length),int(Height));
   }
  
  
void display(){
  
  //if(playButtonPressCheck()){                       //action based on Button Pressed
       
  //     if(isPlayButtonOn){isPlayButtonOn = false; current =page.pauseMenu;}
  //     else{ isPlayButtonOn = true; current = page.playMode;}
  //     delay(150);
  //}  
  
  if(isPlayButtonOn)
      image(publue,PuposX,PuposY);

  if(isPlayButtonOn){ 
  if(cursorInPause()){
   
      image(publue,PuposX - offset,PuposY-offset,Length+2*offset,Height+2*offset);
      if(mousePressed){
         if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
          clock.timeTaken = clock.flag; 
         isPlayButtonOn = false;
        current =page.pauseMenu;
      }
  }

}
}
     
boolean cursorInPause(){       //check if cursor in Button
    if(mouseX>PuposX && mouseX<PuposX+Length && mouseY> PuposY && mouseY<PuposY+Height )
         return true;
    return false;
}

boolean playButtonPressCheck(){              //check if button  pressed
  if(keyPressed){
     if(key == KEYforPause)       // for upper and lowercase
        return true;
     
  }
  return false;
}

void defineAnimator(int i){
 pauseAnimator = new Animator(new PVector(PuposX,PuposY),1,i); 
}

void animate(){
 PVector  temp = pauseAnimator.update();
 image(publue,temp.x,temp.y);
 
}


}
