class KeyMouseButton{
 Animator keyAnimator,mouseAnimator;
 boolean isKeyButton = false;        // variable to determine which button is active
 float MposX = keyPosition.x ,MposY = keyPosition.y;      //position for mousebutton
 float Length = 0.18229446 * height ,Height = 0.097656 * height;      //length and height of buttons
 float KposX = MposX +Length - 0.035714 * Length,KposY = MposY;     //position for keyButton
// float Length = 0.18229446 * height ,Height = 0.097656 * height;      //length and height of buttons
 float offset = 0.07143 * Length;                   //offset when button is selected
 PImage mgreen,mgrey,mred,kgreen,kred,kgrey;     //images for buttons
 int KEYforMouse = 'A';
 int KEYforKey   = 'D';
 
 KeyMouseButton(){
          mgreen = loadImage("images\\keymousebutton\\mousegreen.png");
          mgreen.resize(int(Length),int(Height));
          mgrey = loadImage("images\\keymousebutton\\mousegrey.png");
          mgrey.resize(int(Length),int(Height));
          mred = loadImage("images\\keymousebutton\\mousered.png");
          mred.resize(int(Length+2*offset),int(Height+2*offset));
          kgreen = loadImage("images\\keymousebutton\\keygreen.png");
          kgreen.resize(int(Length),int(Height));
          kred = loadImage("images\\keymousebutton\\keyred.png");
          kred.resize(int(Length+2*offset),int(Height+2*offset));
          kgrey = loadImage("images\\keymousebutton\\keygrey.png");
          kgrey.resize(int(Length),int(Height));
          
  }
  
  void display(){
    
    if(mouseButtonPressCheck())                       //action based on mouseButton Pressed
       if(isKeyButton){isKeyButton = false;  if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}          
       
    if(keyButtonPressCheck())                         // action based on keyButton Pressed
       if(!isKeyButton){isKeyButton = true; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 } }
        
     if(isKeyButton){       // display button according to current isKeyButton 
       image(mgrey,MposX,MposY,Length,Height);
       image(kgreen,KposX,KposY,Length,Height);
    }
    else{
      image(mgreen,MposX,MposY,Length,Height);
      image(kgrey,KposX,KposY,Length,Height);
    }
   
   if(cursorInMouse()){       // if cursor in mouseButton  perform animation correp to it
       if(isKeyButton){
       image(mgrey,MposX,MposY);
       image(kgrey,KposX,KposY);
       image(mred,MposX-offset,MposY-offset);
       if(mousePressed){isKeyButton=false; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}
       }
   }
   
   if(cursorInKey()){       // if cursor in keyButton  perform animation correp to it
       if(!isKeyButton){
       image(mgrey,MposX,MposY);
       image(kred,KposX-offset,KposY-offset);
       if(mousePressed){isKeyButton=true; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}
       }
   }
   
}
  
boolean cursorInMouse(){       //check if cursor in mouseButton
    if(mouseX>MposX && mouseX<MposX+Length && mouseY> MposY && mouseY<MposY+Height )
         return true;
    return false;
}
  
boolean cursorInKey(){       //check if cursor in keyButton
    if(mouseX>KposX && mouseX<KposX+Length && mouseY> KposY && mouseY<KposY+Height )
         return true;
    return false;
}

boolean mouseButtonPressCheck(){            //check if mouseButton  key pressed 
  if(keyPressed)
     if(key == KEYforMouse || key == KEYforMouse + 32)     //for upper case and lower case
        return true;  
   return false;
}

boolean keyButtonPressCheck(){              //check if keybutton  key pressed
  if(keyPressed)
     if(key == KEYforKey || key == KEYforKey + 32)       // for upper and lowercase
        return true;
  return false;
}
void defineAnimator(int i){
 keyAnimator = new Animator(new PVector(KposX,KposY),3,i); 
 mouseAnimator = new Animator(new PVector(MposX,MposY),3,i); 
}

void animate(){
 PVector  temp = keyAnimator.update();
 image(kgrey,temp.x,temp.y);
 temp = mouseAnimator.update();
image(mgreen,temp.x,temp.y);
      
 
}
  
}
