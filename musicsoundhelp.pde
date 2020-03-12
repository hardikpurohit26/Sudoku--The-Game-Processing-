class MusicSoundHelpButton {
    Animator animatorMusic,animatorSound,animatorHelp;
    
  
    float MposX =  0.05 * width , MposY = 0.892857*height ;            //position for deletebutton
    float Length = 0.071428 * height, Height = Length;          //length and height of buttons
    float SposX = MposX + Length + 0.025 * width , SposY = MposY;           //position for clearbutton
    float HposX = SposX + Length + 0.025 * width , HposY = MposY;
    float offset =0.1333 * Length;                         //offset when button is selected
    PImage hblue,sgrey,sblue,mblue,mgrey;          //images for buttons
    boolean soundActivated = true,musicActivated=true;
    boolean soundTemp = false,musicTemp = false,helpTemp = false;   //animation
    PVector helpDimension = new PVector( 1.241935 * height *2 /3,  2*height/3 );
    PVector helppos = new PVector(width/2 - helpDimension.x/2 , height/2 - helpDimension.y/2);
    PVector crosspos = new PVector( helppos.x + helpDimension.x * 0.88701298 , helppos.y + helpDimension.y * 0.154838);
    float crossLength = helpDimension.y * 0.2177419 + 0.133 * helpDimension.y * 0.2177419 ;
    PImage helpPlay,helpAbout,cross;
  
 MusicSoundHelpButton(){
         helpPlay = loadImage("images\\musicsoundhelpbutton\\helpplay.png");      
          helpAbout = loadImage("images\\musicsoundhelpbutton\\helpabout.png");
          cross = loadImage("images\\musicsoundhelpbutton\\crossgreen.png");
         helpPlay.resize(int(helpDimension.x),int(helpDimension.y));
         helpAbout.resize(int(helpDimension.x),int(helpDimension.y));
         cross.resize(int(crossLength),int(crossLength));
         
         hblue = loadImage("images\\musicsoundhelpbutton\\helpblue.png");
         hblue.resize(int(Length),int(Height));
         sgrey = loadImage("images\\musicsoundhelpbutton\\soundgrey.png");
         sgrey.resize(int(Length),int(Height));
         sblue = loadImage("images\\musicsoundhelpbutton\\soundblue.png");
         sblue.resize(int(Length),int(Height));
         
         mblue = loadImage("images\\musicsoundhelpbutton\\musicblue.png");
         mblue.resize(int(Length),int(Height));
         mgrey = loadImage("images\\musicsoundhelpbutton\\musicgrey.png");
         mgrey.resize(int(Length),int(Height));
         
         animatorMusic = new Animator(new PVector(MposX,MposY),1,0);
         animatorSound = new Animator(new PVector(SposX,SposY),1,0);
         animatorHelp = new Animator(new PVector(HposX,HposY),1,0);
  }
  
void display(){
    
    if(soundActivated)
        image(sblue,SposX,SposY);
     else 
        image(sgrey,SposX,SposY);
     
     if(musicActivated){
       if(!music.isPlaying())music.play(1,0,0.2,0,4);
         image(mblue,MposX,MposY);
     }
     else 
        {if(music.isPlaying())
          music.pause();
        image(mgrey,MposX,MposY);}
        
     image(hblue,HposX,HposY);
        

    if(cursorInMusic()){               // if cursor in clearButton  perform animation correp to it
        if(!musicTemp){
            if(musicActivated)
               image(mblue,MposX -offset,MposY - offset,Length +2*offset,Height+2*offset);
            else 
               image(mgrey,MposX -offset,MposY - offset,Length +2*offset,Height+2*offset);
           if(mousePressed){
              if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
           musicTemp=true;
             if(musicActivated){
               
                 musicActivated = false;
             }
            else 
                { musicActivated = true;}
          }
         
    
   
        }
    }
     else musicTemp = false;
    
    if(cursorInSound()){               // if cursor in clearButton  perform animation correp to it
        if(!soundTemp){
            if(soundActivated)
               image(sblue,SposX -offset,SposY - offset,Length +2*offset,Height+2*offset);
            else 
               image(sgrey,SposX -offset,SposY - offset,Length +2*offset,Height+2*offset);
           if(mousePressed){
              if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
            soundTemp=true;
             if(soundActivated)
                 soundActivated = false;
            else 
                 soundActivated = true;
          }
     
        }
    }
    else soundTemp = false;
    
   if(cursorInHelp()){             // if cursor in deleteButton  perform animation correp to it
       if(!helpTemp){
       image(hblue,HposX-offset,HposY-offset,Length+2*offset,Height+2*offset);
       if(mousePressed){
          if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
       if(current == page.playMode) 
          {isHelpAbout = false;clock.timeTaken = clock.flag;}
       else
         isHelpAbout = true;
         
        current = page.helpPage;
        
         
         
       helpTemp = true;
           
   
 }
      }
    }
   else helpTemp = false;

}

boolean cursorInMusic(){       //check if cursor in  Delete Button
    if(mouseX>MposX && mouseX<MposX+Length && mouseY> MposY && mouseY<MposY+Height )
         return true;
    return false;
}
  
boolean cursorInSound(){       //check if cursor in Clear Button
    if(mouseX>SposX && mouseX<SposX+Length && mouseY> SposY && mouseY<SposY+Height )
         return true;
    return false;
}
boolean cursorInHelp(){       //check if cursor in Clear Button
    if(mouseX>HposX && mouseX<HposX+Length && mouseY> HposY && mouseY<HposY+Height )
         return true;
    return false;
}

void animate(){
    PVector temp = animatorMusic.update();
    image(mblue,temp.x,temp.y);
    temp = animatorSound.update();
    image(sblue,temp.x,temp.y);
    temp = animatorHelp.update();
    image(hblue,temp.x,temp.y);
}


}
  
  
  
  
  
  
  
  
