class PauseMenu{
  
  PImage pausemenu,resumeButton,exitButton,restartButton,levelButton,homeButton;
  float Height = 2*height/3;
  float Length = 0.713154 * Height;
  float posX = width/2 - Length/2 ,posY = height/2 - Height/2;
  //float Length,Height;
  
  PVector resume  = new PVector(posX + 0.49111 * Length ,posY + 0.44929 * Height);
  PVector restart  = new PVector(posX +0.4911 *Length ,posY  +  0.618066 * Height);
  PVector exit = new PVector(posX + 0.4911 * Length   ,posY + 0.783676 * Height);
  PVector home  = new PVector( posX + 0.362222*Length , posY + 0.2852614 * Height);
  PVector level  = new PVector( posX + 0.617778 * Length , posY + 0.2852614 * Height);
  PVector bigButtonDimension = new PVector(0.46222* Length + 0.4622 *Length * 0.266, 0.141046 * Height + 0.141046 * Height * 0.266 ) ;
  PVector smallButtonDimension = new PVector(0.22889* Length + 0.22889 *Length * 0.266, 0.1664025357 *Height + 0.166402 * 0.266 *Height); 
 PauseMenu(){
   pausemenu = loadImage("images\\pausemenu\\pausemenu.png");
   resumeButton = loadImage("images\\pausemenu\\resume.png");
   exitButton = loadImage("images\\pausemenu\\exit.png");
   pausemenu.resize(int(Length),int(Height));
   resumeButton.resize(int(bigButtonDimension.x),int(bigButtonDimension.y));
   exitButton.resize(int(bigButtonDimension.x),int(bigButtonDimension.y));
   restartButton = loadImage("images\\pausemenu\\restart.png");
   restartButton.resize(int(bigButtonDimension.x),int(bigButtonDimension.y));
   levelButton = loadImage("images\\pausemenu\\levelbutton.png");
   homeButton = loadImage("images\\pausemenu\\homebutton.png");
   levelButton.resize(int(smallButtonDimension.x),int(smallButtonDimension.y));
   homeButton.resize(int(smallButtonDimension.x),int(smallButtonDimension.y));
 }
 
 void display(){
  
   image(pausemenu,posX,posY);
   imageMode(CENTER);
   if(mouseX>home.x-smallButtonDimension.x/2  && mouseX<home.x + smallButtonDimension.x/2  && mouseY>home.y-smallButtonDimension.y/2  && mouseY<home.y + smallButtonDimension.y/2 )
    {
       image(homeButton,home.x,home.y);
       if(mousePressed){current = page.mainMenu;playPauseButton.isPlayButtonOn = true; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 } delay(200);}
     }
     
    else  if(mouseX>level.x-smallButtonDimension.x/2  && mouseX<level.x + smallButtonDimension.x/2  && mouseY>level.y-smallButtonDimension.y/2  && mouseY<level.y + smallButtonDimension.y/2 )
     {
       image(levelButton,level.x,level.y);
       if(mousePressed){current = page.levelSelection;playPauseButton.isPlayButtonOn = true; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 } delay(200);}
     }
     
 else if(mouseX>resume.x-bigButtonDimension.x/2  && mouseX<resume.x + bigButtonDimension.x/2  && mouseY>resume.y-bigButtonDimension.y/2  && mouseY<resume.y + bigButtonDimension.y/2 )
     {
       image(resumeButton,resume.x,resume.y);
       if(mousePressed){playPauseButton.isPlayButtonOn = true; current = page.playMode; delay(200);clock.baseTime = new PVector(hour() , minute() , second() ); if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 } }
     }
     
    else if(mouseX>restart.x-bigButtonDimension.x/2  && mouseX<restart.x + bigButtonDimension.x/2  && mouseY>restart.y-bigButtonDimension.y/2  && mouseY<restart.y + bigButtonDimension.y/2 )
     {
       image(restartButton,restart.x,restart.y);
       if(mousePressed){board.settingLevel(); current = page.playMode;playPauseButton.isPlayButtonOn = true; delay(200);clock.timeTaken.mult(0);  clock.baseTime = new PVector(hour() , minute() , second() ); if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}
      
     }
     
 else if(mouseX>exit.x-bigButtonDimension.x/2  && mouseX<exit.x + bigButtonDimension.x/2  && mouseY>exit.y-bigButtonDimension.y/2  && mouseY<exit.y + bigButtonDimension.y/2 )
     {
       image(exitButton,exit.x,exit.y);
       if(mousePressed){current = page.quitMenu; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}
     }
    
   imageMode(CORNER);
   
 }


}
