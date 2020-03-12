boolean flag = false;


void inBetweenLoadingAndMainMenu(){
  if(!flag){
    quit = new Animator(new PVector(cquit.x,cquit.y),1,0);
  play = new Animator(new PVector(cplay.x,cplay.y),0,0);
 
  //custom = new Animator(new PVector(ccustom.x,ccustom.y),1,0);
  flag = true;
 }
  
  imageMode(CENTER);
  image(mainLogo,width/2,0.142857*height);
  PVector temp = play.update();
  image(playButton,temp.x,temp.y);
  temp = quit.update();
  image(quitButton,temp.x,temp.y);
  //temp = custom.update();
  //image(customLevel,temp.x,temp.y);
 
  imageMode(CORNER);
musicSoundHelpButton.animate();
 
 if(   play.vel.mag() < 0.05 && play.acc.mag() <0.01 ){
       current = page.mainMenu;
       flag = false;   
 }
 
}





void inBetweenMainMenuAndLevelSelection(int m){
  
  int k = 0,l = 1;
  if(m==1){k =1; l=0;}
  
  if(!flag){
       
    quit = new Animator(new PVector(cquit.x,cquit.y),1,k);
  play = new Animator(new PVector(cplay.x,cplay.y),3,k);
  // custom = new Animator(new PVector(ccustom.x,ccustom.y),0,k);

 
   back = new Animator(new PVector(cback.x,cback.y),1,l);
  for(int i = 0 ;i< 10;i++){
    level[i].defineAnimator(1,l); 
  }
 
 flag = true;
 }
  
  imageMode(CENTER);
  image(mainLogo,width/2,0.142857*height,0.558634 *height,0.142857*height);
  PVector temp = play.update();
  image(playButton,temp.x,temp.y);
  temp = quit.update();
  image(quitButton,temp.x,temp.y);
  //temp = custom.update();
  //image(customLevel,temp.x,temp.y);
 
  imageMode(CORNER);
  temp = back.update();
  image(backButton,temp.x,temp.y);
  for(int i =0 ;i<10;i++){
   level[i].animate(); 
  }

 
 if(   play.vel.mag() < 0.09 && play.acc.mag() <0.07 ){
   if(m==1){  
   current = page.levelSelection;}
   else current = page.mainMenu;
       flag = false;
 }
}

int i =0,j =0;   ///for board animation
boolean animationDone =false;
void inBetweenLevelSelectionAndPlayMode(){
  if(!flag){
    animationDone =false;
    i=0;j=0;
    board.settingLevel();
    clock.defineAnimator(0);
     board.defineAnimator(0);
     
    deleteClearButton.defineAnimator(0);
    playPauseButton.defineAnimator(0);
      keyMouseButton.defineAnimator(0);
     scribbleButton.defineAnimator(0);
    flag = true;
  }
    if(!animationDone){
   
   clock.animate();
    board.animate();
   deleteClearButton.animate();
  playPauseButton.animate();
  keyMouseButton.animate();
  scribbleButton.animate();
    }
 
   if(   scribbleButton.animator.vel.mag() < 0.01 && scribbleButton.animator.acc.mag() <0.05){
     updateBackground = false;
     animationDone =  true;
     
      board.section[i][j].display();
      delay(10);
     
     if(i<8){
         if(j<8)j++;
            else{j=0;i++;}
        }
        else{
     
       current = page.playMode;
       clock.timeTaken.mult(0);
       clock.baseTime = new PVector(hour() , minute() , second() );
       flag = false; 
       updateBackground = true;
        }
 }
 
  
}
