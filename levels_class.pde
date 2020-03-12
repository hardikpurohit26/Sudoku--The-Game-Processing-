
class Level{
  float posX,posY;
  float Length = 0.1428571 * height;
  float offset = 0.133 *Length; 
  boolean isLocked = true;
  int level;
  PImage Plevel;
  Animator  animator;
  
  Level(int i){
    level = i;
     Plevel = loadImage("images\\levelbuttons\\level"+level+".png");
     Plevel.resize(int(Length),int(Length));
     
    
    
    
  }
  
  void display(){
   if(isLocked) 
     image(levelLocked,posX,posY); 
   else
      { if(!cursorOnLevel())
        image(Plevel,posX,posY);
        else{
         image(Plevel,posX - offset,posY - offset, Length +2* offset,  Length +2* offset ) ;
         if(mousePressed){
            if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
           LevelSelected = level;
          current = page.inBetweenLevelSelectionAndPlayMode;
         }
        }
        
          
      }
   }
   
   boolean cursorOnLevel(){
     if(mouseX>posX &&mouseX< posX+Length && mouseY>posY && mouseY<posY +Length)
       return true;
     
     return false;
   }
  
    void defineAnimator(int j,int i){
     
      animator = new Animator(new PVector(posX,posY),j,i);
      
      
    }
    void animate(){
      PVector temp = animator.update();
    if(isLocked)
    image(levelLocked,temp.x,temp.y);
      else
      image(Plevel,temp.x,temp.y);
    
    }

  
  
  
  
  
}
