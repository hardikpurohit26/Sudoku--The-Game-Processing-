class DeleteClearButton{
    Animator deleteAnimator, clearAnimator;
    float DposX = keyPosition.x + 0.05642 * height , DposY = keyPosition.y + 0.358073 * height ;            //position for deletebutton
    float Length = 0.09765625 * height, Height = Length;          //length and height of buttons
    float CposX = DposX + Length + 0.05642 * height , CposY = DposY;           //position for clearbutton
    
    float offset =0.1333 * Length;                         //offset when button is selected
    PImage cgreen,cred,dgreen,dred;          //images for buttons
    int KEYforDelete = DELETE;               //key code for  "DELETE"           
    int KEYforClear   = 'C'; 
    boolean clearActivated=false,deleteActivated=false;  //variables for Animation
    boolean clearPressed = false;
  
 DeleteClearButton(){
          cgreen = loadImage("images\\deleteclearbutton\\cleargreen.png");
          cgreen.resize(int(Length),int(Length));
          cred = loadImage("images\\deleteclearbutton\\clearred.png");
          cred.resize(int(Length+2*offset),int(Length+2*offset));
          dgreen = loadImage("images\\deleteclearbutton\\deletegreen.png");
           dgreen.resize(int(Length),int(Length));
          dred = loadImage("images\\deleteclearbutton\\deletered.png");
          dred.resize(int(Length+2*offset),int(Length+2*offset));
         
}
  
void display(){
     clearPressed = false;
    image(dgreen,DposX,DposY);
    image(cgreen,CposX,CposY);

    if(deleteKeyPressCheck()){
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
       board.clearBoard();
        image(dred,DposX-offset,DposY-offset);
    }
          
    if(clearKeyPressCheck()){
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
         image(cred,CposX-offset,CposY-offset);
         clearPressed = true;
   }

    if(cursorInClear()){               // if cursor in clearButton  perform animation correp to it
        if(!clearActivated){
           image(cred,CposX-offset,CposY-offset);
           if(mousePressed){clearActivated=true;clearPressed = true; if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}
         }
    }
    else clearActivated = false;
   
   if(cursorInDelete()){             // if cursor in deleteButton  perform animation correp to it
       if(!deleteActivated){
       image(dred,DposX-offset,DposY-offset);
       if(mousePressed){deleteActivated=true;board.clearBoard(); if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }}
      }
    }
   else deleteActivated = false;

}

boolean cursorInDelete(){       //check if cursor in  Delete Button
    if(mouseX>DposX && mouseX<DposX+Length && mouseY> DposY && mouseY<DposY+Height )
         return true;
    return false;
}
  
boolean cursorInClear(){       //check if cursor in Clear Button
    if(mouseX>CposX && mouseX<CposX+Length && mouseY> CposY && mouseY<CposY+Height )
         return true;
    return false;
}

boolean deleteKeyPressCheck(){     // checkes if delete key is pressed
  if(keyPressed){
    if(key == KEYforDelete)
        return true;
  }
  //if(mousePressed && mouseButton == CENTER)
  //     return true;
  return false;
  
}

boolean clearKeyPressCheck(){    // checks if clear key is pressed
  if(keyPressed)
    if(key == KEYforClear || key == KEYforClear + 32 )
      return true;
  return false;
}

void defineAnimator(int i ){
   
  deleteAnimator = new Animator( new PVector(DposX,DposY),3,i);
   clearAnimator = new Animator( new PVector(CposX,CposY),3,i);

}

void animate(){
 
  PVector temp = deleteAnimator.update(); 
  image(dgreen,temp.x,temp.y);
   temp = clearAnimator.update();
    image(cgreen,temp.x,temp.y);
}
}
