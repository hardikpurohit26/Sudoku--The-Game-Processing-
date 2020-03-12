void mainMenu(){
      imageMode(CENTER);
      image(mainLogo,width/2,0.142857*height);
      image(playButton,cplay.x,cplay.y);
      image(quitButton,cquit.x,cquit.y);
      //image(customLevel,ccustom.x,ccustom.y);
      imageMode(CORNER);
     
      imageMode(CENTER);
      if(mouseX > cplay.x - dimensionPlay.x/2 && mouseX < cplay.x + dimensionPlay.x/2 && mouseY > cplay.y - dimensionPlay.y/2 && mouseY < cplay.y + dimensionPlay.y/2 ){
        image(playButton,cplay.x,cplay.y,dimensionPlay.x+0.133*dimensionPlay.x*2,dimensionPlay.y+0.133*dimensionPlay.y*2); 
        if(mousePressed) {
           if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
          current = page.inBetweenMainMenuAndLevelSelection;}
             
      }
      if(mouseX > cquit.x - dimensionQuit.x/2 && mouseX < cquit.x + dimensionQuit.x/2 && mouseY > cquit.y - dimensionQuit.y/2 && mouseY < cquit.y + dimensionQuit.y/2 ){
        image(quitButton,cquit.x,cquit.y, dimensionQuit.x +0.103*dimensionQuit.x*2,dimensionQuit.y +0.103 *dimensionQuit.y *2);
         if(mousePressed) {
            if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
            current = page.quitMenu;alpha =0;}
      }
      
      // if(mouseX > ccustom.x - dimensionCustom.x/2 && mouseX < ccustom.x + dimensionCustom.x/2 && mouseY > ccustom.y - dimensionCustom.y/2 && mouseY < ccustom.y + dimensionCustom.y/2 ){
      //   image(customLevelSelected,ccustom.x,ccustom.y);
      //   if(mousePressed) 
      //       println("quit Presed");
      //}
      
      imageMode(CORNER);
      
}


void levelSelection(){
  float backLength = height * 0.1071429;
 imageMode(CENTER);
  image(mainLogo,width/2,0.142857*height,0.558634 *height,0.142857*height);
  imageMode(CORNER);
  image(backButton,cback.x,cback.y,backLength, backLength);
    for(int i = 0 ; i<10 ; i++){
    
    level[i].display();

  }
  
  if(mouseX > cback.x && mouseX < cback.x + backLength  && mouseY > cback.y && mouseY < cback.y +backLength ){
        image(backButton,cback.x-0.133*backLength,cback.y-0.133*backLength,backLength+0.133*backLength*2,backLength+0.133*backLength*2); 
        if(mousePressed) {
           if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
          current = page.inBetweenLevelSelectionAndMainMenu;}
}
  
  
  
  
}

void playMode(){
  if(!isLevelCreated){
  
  
  
  isLevelCreated = true;
  }
  
 playPauseButton.display();
  keyMouseButton.display();
  scribbleButton.display();
  deleteClearButton.display();
  clock.display();
   board.draw_board();
  board.isLevelWon();
  
  
}

int alpha = 0;   //opacity for animation
void quitMenu(){
  rectMode(CORNER);
  fill(0,alpha);
  rect(0,0,width,height);
  if(alpha<205)alpha++;
  imageMode(CENTER);
  image(areusure,posAreusure.x,posAreusure.y);
  imageMode(CORNER);
  image(crossgreen,posCross.x,posCross.y);
  image(correctred,posCorrect.x,posCorrect.y);
  
  if(mouseX> posCross.x && mouseX < posCross.x+dimensionCross.x && mouseY>posCross.y  && mouseY< posCross.y + dimensionCross.y ){
     image(crossgreen,posCross.x,posCross.y ,dimensionCross.x+0.133*dimensionCross.x,dimensionCross.x+0.133*dimensionCross.x);
     if(mousePressed){
        if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
     if(playPauseButton.isPlayButtonOn == true)
     current = page.mainMenu;
     else current = page.pauseMenu;  
 alpha = 0;}
    
  }
  
  if(mouseX> posCorrect.x && mouseX < posCorrect.x+dimensionCorrect.x && mouseY>posCorrect.y  && mouseY< posCorrect.y + dimensionCorrect.y ){
     image(correctred,posCorrect.x,posCorrect.y ,dimensionCorrect.x+0.133*dimensionCorrect.x,dimensionCorrect.x+0.133*dimensionCorrect.x);
     if(mousePressed){ if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }exit();}
  }
 
  
  
}
void pauseMenu(){
  fill(0,125);
  rectMode(CORNER);
  rect(0,0,width,height);
pauseMenu.display();



}

void helpPage(){
  fill(0,125);
  rectMode(CORNER);
  rect(0,0,width,height);
   if(isHelpAbout){
    image(musicSoundHelpButton.helpAbout,musicSoundHelpButton.helppos.x,musicSoundHelpButton.helppos.y); 
     
   }
   else{
     image(musicSoundHelpButton.helpPlay,musicSoundHelpButton.helppos.x,musicSoundHelpButton.helppos.y); 
     
   }
   imageMode(CENTER);
   if(mouseX>musicSoundHelpButton.crosspos.x - musicSoundHelpButton.crossLength/2 && mouseX<musicSoundHelpButton.crosspos.x + musicSoundHelpButton.crossLength/2 && mouseY>musicSoundHelpButton.crosspos.y - musicSoundHelpButton.crossLength/2 && mouseY<musicSoundHelpButton.crosspos.y + musicSoundHelpButton.crossLength/2 )
  {
    image(musicSoundHelpButton.cross ,musicSoundHelpButton.crosspos.x, musicSoundHelpButton.crosspos.y);
    if(mousePressed){
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
      if(isHelpAbout){
     current = page.mainMenu;       
     
   }
   else{
      current = page.playMode;
      delay(200);
      clock.baseTime = new PVector(hour() , minute() , second() );
      
    }
  
}
  }
  imageMode(CORNER);
  
  
}
int opacity = 0 ,temp =0;
void LevelLost(){

     fill(0);
  rectMode(CORNER);
  rect(0,0,width,height);
  
textSize(height/8);
textAlign(CENTER,CENTER);
fill(255);
text("NO TIME LEFT !!!!!!",width/2,height/2);
textSize(height/16);

fill(255,opacity);
  text("Press Any Key to Continue....",width/2,3*height/4);

if(temp == 0)
 opacity +=1;
 else opacity -= 1;
 if(opacity>255)
   temp =1;
 if(opacity<0)
   temp = 0;
   


if(mousePressed || keyPressed){
   if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
current = page.levelSelection;
delay(200);
}
 
  
  
  
}
