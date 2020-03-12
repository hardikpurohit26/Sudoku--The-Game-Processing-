class Section{
  float posX,posY,Length;
  int i,j;                 // to keep track of array no.
  char value;
  float textSize;
  float[][] innerSection = new float[9][3];   // 0->posX , 1->posy ,2-> (  1->active   0->inactive  )    //what does 3 indices denotes
  boolean sectionInScribbleMode = true;  
  boolean isActiveForKeyMode = false;        // to keep track which section is active for keyMOde
  int type;                     // 1 -> constant ; 2->blue ; 3->red;
  
 Section(float x,float y,float z){   //
    posX = x;
    posY = y;
    Length = z;
    textSize = Length*0.5;
    // below code to intialize position of inner section
    int k=0;
    float tempx=0,tempy=0;
        for(int i =0;i<3;i++){
          for(int j=0;j<3;j++){
            innerSection[k][0] = tempx+posX;
            innerSection[k][1] = tempy+posY;
            innerSection[k][2] = 0;
            tempx += Length/3;
            k++;
          }
          tempx  = 0;
          tempy += Length/3;
        }
   
 }
 
void display(){
    textAlign(CENTER,CENTER);
    textSize(textSize);
    
    if(type == 1){
         noStroke();
         rectMode(CENTER);
         fill(0);
         text(value,posX+Length/2,posY+Length/2-textSize*0.11);
         return;
    }
    
    if(!sectionInScribbleMode){
         if(type==2)fill(0,0,255);
         else fill(255,0,0);
         text(value,posX+Length/2,posY+Length/2-textSize*0.11);
    }
    drawInScribbleMode();   //draw in scribble mode but also ability to v=change permanent values in key and mouse modes
}

void drawInScribbleMode(){
    textAlign(CENTER,CENTER);
    textSize(Length/3-5);
    fill(125);  
    
    for(int i = 0; i<9; i++){           //runs a loop to check all the inner section                                                        
     if(innerSection[i][2] == 1)        //check if innerSection is Active i.e [2] = 1  and print
     text(i+1,innerSection[i][0]+Length/6,innerSection[i][1]+Length/6-textSize*0.11);                           
     
     if(!keyMouseButton.isKeyButton){     //check futher checking only in mouseMode
      
      if(mouseX >innerSection[i][0] && mouseX < innerSection[i][0]+Length/3 && mouseY>innerSection[i][1] && mouseY < innerSection[i][1] +Length/3){  //determine mouse is in current innerBox or no  
              text(i+1,innerSection[i][0]+Length/6,innerSection[i][1]+Length/6-textSize*0.11); // print temp innersection name     
              noFill();
              stroke(0,0,0,100);
              strokeWeight(1);
              rectMode(CORNER);
              rect(innerSection[i][0],innerSection[i][1],Length/3,Length/3);                   // draw rect around it
              if(mousePressed){
                 if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
                        if(mouseButton == LEFT){
                       if(scribbleButton.isScribbleButtonOn){                           // futher code only in scribble mode  // if mousePressed then convert innersection to permanent i.e [2] = 1 and vice Versa
                       if(innerSection[i][2] == 1)innerSection[i][2] = 0;
                       else innerSection[i][2] = 1;
                       sectionInScribbleMode = true;                                // both lines able to
                       value = ' ';                                                 // change from permanent mode to scribble mode 
                       delay(100);
                       }
                       else{                                                           // if not in scribble mode  -> convert Section value 
                        value = char(49+i);
                        sectionInScribbleMode = false;
                        }
                       }
                     if(mouseButton == RIGHT)clearSection();      // in mouse Mode clearing the section when right moue clicked
              }
        
            if(deleteClearButton.clearPressed)clearSection();    // in mouse Mode clearing the section when clear button is trigrred
        
     }    
     
   }
    if(!sectionInScribbleMode)innerSection[i][2] = 0;             // if section is not in scribble mode empty the all the innerSection of it
    
    }
    valueEntryUsingKeys();
}

void valueEntryUsingKeys(){    //CHECK KEY OR MOUSE MODE   AND  TAKE CORRESP. STEP

     if(!keyMouseButton.isKeyButton){                 // if is mouseMode and mouse in cell then change corresp. value
             
            if(mouseX>posX && mouseX<posX+Length && mouseY>posY && mouseY<posY+Length) 
                   getKeyEntered();
     }
    
    else{
             if(isActiveForKeyMode) {                         // if KeyMode is active and  if section is active then change value AND DRAW a rect around it
                  noFill();
                  strokeWeight(5);
                  rectMode(CORNER);
                  stroke(255,0,0);
                  rect(posX,posY,Length,Length);
                  if(deleteClearButton.clearPressed)clearSection();    // in key Mode clearing the section when clear button is trigrred
                  getKeyEntered();
              }
             
             if(mouseX>posX && mouseX<posX+Length && mouseY>posY && mouseY<posY+Length){     //if mouse pressed on  section in keyMode then change its status "isActiveForKeyMode" to  true;  
                        if(mousePressed){ 
                           if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
                            board.section[int(board.activeSectionForKeyMode.x)][int(board.activeSectionForKeyMode.y)].isActiveForKeyMode = false;
                            isActiveForKeyMode = true;
                            board.activeSectionForKeyMode = new PVector(i,j);
                          if(mouseButton == RIGHT)clearSection();      // in key Mode clearing the section when right moue clicked
                       }
                   }  
                
                
      
    
  }
}
 
 void getKeyEntered(){       // for values entered from keyboard  
     if(keyPressed){
       if(key >'0'  && key <= '9'){
          if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
               if(scribbleButton.isScribbleButtonOn){                           // futher code only in scribble mode  // if mousePressed then convert innersection to permanent i.e [2] = 1 and vice Versa
                       if(innerSection[key-49][2] == 1)innerSection[key-49][2] = 0;
                       else innerSection[key-49][2] = 1;
                       delay(100);
                       sectionInScribbleMode = true;                                // both lines able to
                       value = ' ';                                                 // change from permanent mode to scribble mode 
                  }
                  else{                        // if not in scribble mode  -> convert Section value 
                    value = key;
                    sectionInScribbleMode = false;
                  }
           delay(200);
          }
        }
}

void clearSection(){
    if(type==1)return;
     value = ' ';
     for(int i =0;i<9;i++)
           innerSection[i][2] = 0;
}

}
