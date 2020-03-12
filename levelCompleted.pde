class LevelCompleted{
  
  PImage levelcomplete,levelButton,homeButton,nextButton;
  float Height = 2*height/3;
  float Length = 0.7400722 * Height;
  float posX = width/2 - Length/2 ,posY = height/2 - Height/2;
  //float Length,Height;

  PVector home  = new PVector( posX + 0.23414*Length , posY + 0.913357407 * Height);
  PVector level  = new PVector( posX + 0.494309 * Length , posY + 0.913357407 * Height);
    PVector next  = new PVector( posX + 0.75609 * Length , posY + 0.913357407 * Height);
  PVector smallButtonDimension = new PVector(0.2276422* Length + 0.2276422 *Length * 0.266, 0.16365 *Height + 0.16365 * 0.266 *Height); 
 LevelCompleted(){
  
   levelButton = loadImage("images\\levelcompleted\\levelbutton.png");
   homeButton = loadImage("images\\levelcompleted\\homebutton.png");
   levelButton.resize(int(smallButtonDimension.x),int(smallButtonDimension.y));
   homeButton.resize(int(smallButtonDimension.x),int(smallButtonDimension.y));
   nextButton = loadImage("images\\levelcompleted\\nextblue.png");
   nextButton.resize(int(smallButtonDimension.x),int(smallButtonDimension.y));
   levelcomplete = loadImage("images\\levelcompleted\\levelcompleted.png");
   levelcomplete.resize(int(Length),int(Height));
 }
 
 void display(){

   image(levelcomplete,posX,posY);
   imageMode(CENTER);
   if(mouseX>home.x-smallButtonDimension.x/2  && mouseX<home.x + smallButtonDimension.x/2  && mouseY>home.y-smallButtonDimension.y/2  && mouseY<home.y + smallButtonDimension.y/2 )
    {
       image(homeButton,home.x,home.y);
       if(mousePressed){current = page.mainMenu; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
 delay(100);
 }
     }
     
     
    else  if(mouseX>level.x-smallButtonDimension.x/2  && mouseX<level.x + smallButtonDimension.x/2  && mouseY>level.y-smallButtonDimension.y/2  && mouseY<level.y + smallButtonDimension.y/2 )
     {
       image(levelButton,level.x,level.y);
       if(mousePressed){current = page.levelSelection; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 } delay(100);}
     }
     
      else  if(mouseX>next.x-smallButtonDimension.x/2  && mouseX<next.x + smallButtonDimension.x/2  && mouseY>next.y-smallButtonDimension.y/2  && mouseY<next.y + smallButtonDimension.y/2 )
     {
       image(nextButton,next.x,next.y);
       if(mousePressed){board.settingLevel(); current = page.playMode;delay(200);  clock.baseTime = new PVector(hour() , minute() , second() ); if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 } delay(100);}
     }
    
   imageMode(CORNER);
   
 }


}
