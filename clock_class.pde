class Clock{
  Animator animator;

  PVector baseTime;
  PVector timeMax = new PVector(0,30,0),timeLeft,timeTaken = new PVector(0,0),flag;
    
  
   //int 
   PImage clockBackground;
   PFont text,defaultText;
   float Length = 0.65 * height , Height = 0.1302 * height ;
   float posX = boardPosition.x, posY = boardPosition.y - 0.065*height - 0.10416667 * height  ;
    float textSize = 0.25 * Height;
   
   Clock(){
     //min_i=y;
     //hour_i=x;
     //sec_i=z;
     baseTime = new PVector(hour(),minute(),second());
     clockBackground = loadImage("images\\clock\\ribbon.png");
     clockBackground.resize(int(Length),int(Height));
     text = loadFont("fonts\\comictext.vlw");
     defaultText = createFont("Arial",0.03255 * height);
   }
   
   void display(){
     update();
     image(clockBackground,posX,posY);
 
     fill(255);
     textFont(text);
     textAlign(CENTER,CENTER);
     textSize(textSize);
     String seec = String.format("%02d",int(timeLeft.z));
     String miin = String.format("%02d",int(timeLeft.y));
     text("TIME LEFT : "+ miin + ":" + seec,posX + Length/2 , posY + 0.03906 * height);
     textFont(defaultText);    
 
     
     
   }
   void defineAnimator(int i){
         animator = new Animator(new PVector(posX,posY),1,i);    
     }
     
   void animate(){
    PVector temp = animator.update();
    image(clockBackground,temp.x,temp.y);
     
   }
   
void update(){
  PVector temp1 = new PVector(hour(),minute(),second());
  PVector temp = PVector.sub(temp1,baseTime);
        float a = temp.x , b=temp.y , c = temp.z;
  if(c<0){c+=60;b--;}
  if(b<0){b+=60;a--; }
  if(a<0){a+=24;} 
       
       
temp = new PVector(a,b,c);
  //temp.mult(-1);
  PVector temp2 = new PVector(temp.x,temp.y,temp.z);
  flag = PVector.add(timeTaken,temp2);
  

  PVector temp3 = PVector.sub(timeMax,PVector.add(timeTaken,temp2));
 
   a = temp3.x ;b=temp3.y ;c = temp3.z;
  if(c<0){c+=60;b--;}
  if(b<0){b+=60;a--; }
  if(a<0){a+=24;}
  
  
  timeLeft = new PVector(a,b,c);

if(timeLeft.x==0 && timeLeft.y==0  && timeLeft.z == 0){  
  current = page.levelLost;
}
  
  
}
   
  
  
  
}
