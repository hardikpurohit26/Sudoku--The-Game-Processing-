class ScribbleButton{
  Animator animator;
 boolean isScribbleButtonOn = false;     // variable to determine class status
 float SposX = keyPosition.x+0.052070174 * height ,SposY = 0.18229 * height + keyPosition.y;         //position for button3
 float Length = 0.2604167 * height, Height = 0.097656 * height;        //length and height of button
 PImage sred,sgrey;                     //images for buttons
 int KEYforScribble = 'R'; 
 
  ScribbleButton(){
          sred = loadImage("images\\scribblebutton\\scribblered.png");
          sred.resize(int(Length),int(Height));
          sgrey = loadImage("images\\scribblebutton\\scribblegrey.png");
          sgrey.resize(int(Length),int(Height));
 }
  
  
void display(){
  
  if(scribbleButtonPressCheck()){                       //action based on Button Pressed
   if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
       if(isScribbleButtonOn)isScribbleButtonOn = false;
       else isScribbleButtonOn = true;
       delay(200);
  }  
  
  if(isScribbleButtonOn)
      image(sred,SposX,SposY);
  else 
       image(sgrey,SposX,SposY); 
  
  if(cursorInScribble()){
     if(mousePressed){
        if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
       if(isScribbleButtonOn)
         isScribbleButtonOn = false;
       else
          isScribbleButtonOn = true;
        delay(150);
     }
  }
  
}
     
boolean cursorInScribble(){       //check if cursor in Button
    if(mouseX>SposX && mouseX<SposX+Length && mouseY> SposY && mouseY<SposY+Height )
         return true;
    return false;
}

boolean scribbleButtonPressCheck(){              //check if button  pressed
  if(keyPressed)
     if(key == KEYforScribble || key == KEYforScribble + 32)       // for upper and lowercase
        return true;
    if(mousePressed && mouseButton == CENTER)
     {  return true;}
  //return false;
  return false;
}
void defineAnimator(int i){
 animator = new Animator(new PVector(SposX,SposY),3,i); 
}

void animate(){
 PVector  temp = animator.update();
 image(sgrey,temp.x,temp.y);
 
}
}
