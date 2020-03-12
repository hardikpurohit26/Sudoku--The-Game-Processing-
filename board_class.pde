class Board{
  Animator animator;
  float x,y,Length;
  PVector activeSectionForKeyMode;
  Section[][] section = new Section[9][9];
   PImage boardBack,boardFront;
   float offset;           // offset for boardBack image

 Board(float X,float Y,float Z){
        
        x = X;
        y = Y;
        Length = Z;
        offset = 0.1 * Length;
        boardFront = loadImage("images\\board\\boardfront.png");
        boardFront.resize(int(Z),int(Z));
        boardBack = loadImage("images\\board\\boardback.png");
        boardBack.resize(int(Z+0.2*Length),int(Z+0.2*Length));
       
        float tempx=0,tempy=0;
        for(int i =0;i<9;i++){
          for(int j=0;j<9;j++){
                  section[i][j] = new Section(tempx+x,tempy+y,Length/9);
                  section[i][j].value = ' ';
                  section[i][j].type = 1;
                  section[i][j].i = i;section[i][j].j = j;    // track of array no of section in itself
                  tempx += Length/9;
          }
          tempx  = 0;
          tempy += Length/9;
        }
        

        
        
        
    }
    void emptyBoardForNewLevel(){
     for(int i =0;i<9;i++){
          for(int j=0;j<9;j++){
            section[i][j].value = ' ';
                  section[i][j].type = 1;
        section[i][j].isActiveForKeyMode = false; 
        }}
      
      
    }
    void draw_board(){
      image(boardBack,x-offset,y-offset);
      image(boardFront,x,y); 
       
       
       stroke(0);
       float k =0;
       for(int i=0;i<=9;i++){
       strokeWeight(0.1);
       if(i%3==0) strokeWeight(3);
       line( x, y+k ,x+Length-5, y+k);
       line(  x+k , y , x+k , y+Length-5);
       k += Length/9; 
       }
       
       for(int i=0;i<9;i++){                    // checking the color of section
       for(int j=0;j<9;j++){
             if(section[i][j].type != 1){
                if(!checking(i,j))section[i][j].type = 3;
                else section[i][j].type = 2;  
              }
              section[i][j].display();
           }
       }
     if(keyMouseButton.isKeyButton)     //   checking arrow keys are pressed keyMode   
             arrowKeysMovingInKeyMode(); 

 }
 void clearBoard(){
    for(int i=0;i<9;i++){
        for(int j=0;j<9;j++){
         section[i][j].clearSection();
        }
      }
 }



void arrowKeysMovingInKeyMode(){
  int ArrowKeyPress = 0;
  if(keyPressed){
      ArrowKeyPress = keyCode;
  }
  int i=0 , n = int(activeSectionForKeyMode.x) , m = int(activeSectionForKeyMode.y);

 switch(ArrowKeyPress){
  case 37:          //left
      i= m-1;
      while(i>=0){
                  if(section[n][i].type != 1){
                   section[n][m].isActiveForKeyMode = false;
                   section[n][i].isActiveForKeyMode = true;
                   activeSectionForKeyMode = new PVector(n,i);
                   break;
                   }
                   else 
                   i--; 
      }
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
     delay(150);
     break;
     case 39:     //right
      i= m+1;
      while(i<9){
                  if(section[n][i].type != 1){
                   section[n][m].isActiveForKeyMode = false;
                   section[n][i].isActiveForKeyMode = true;
                   activeSectionForKeyMode = new PVector(n,i);
                  break;
                }
                else 
                 i++; 
      }
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
      delay(150);
     break;
     
     case 38 :  //up
      i= n-1;
      while(i>=0){
                  if(section[i][m].type != 1){
                   section[n][m].isActiveForKeyMode = false;
                   section[i][m].isActiveForKeyMode = true;
                   activeSectionForKeyMode = new PVector(i,m);
                  break;
                }
                else 
                 i--; 
      }
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
      delay(150);
     break;
     case 40:
      i= n+1;
      while(i<9){
                  if(section[i][m].type != 1){
                   section[n][m].isActiveForKeyMode = false;
                   section[i][m].isActiveForKeyMode = true;
                   activeSectionForKeyMode = new PVector(i,m);
                  break;
                }
                else 
                 i++; 
      }
       if(musicSoundHelpButton.soundActivated == true){
  if(!keypress.isPlaying())
     keypress.play();
  
 }
      delay(150);
      break;
      
      default:
       break;
  }
   
} 
void generator(int i,int j){
    
    char x = char(int(random('1',':')));
       section[i][j].value = x;
       
       if(checking(i,j)){
        if(i==0){
         if(j==8){
         j=0;
         i=1;
         
       }
        else j++;
        
      }
      else i++;
       }
       if(i<9){
       generator(i,j);
       } 
       backtracking();
   
 }
  
 boolean backtracking(){
   int k=-1,l=-1;
    for(int i =0 ;i<9 ;i++){
        for(int j =0;j<9;j++){
            if(section[i][j].value == ' ')
              {k=i;l=j;}
        }
     }
   if(k == -1)return true;
   
  for(int i = 49;i<58;i++){
     section[k][l].value = char(i);
     if(checking(k,l))
     {  if(backtracking())
                 return true;
           section[k][l].value = ' ';
     }
     else section[k][l].value =' ';
  }
    return false;
}
   
 void settingLevel(){
   clearBoard();
   emptyBoardForNewLevel();
   generator(0,0);
  int i = 81 - 30 + LevelSelected;    // 20 minimum blocks
  for (;i>0;){
    int k = int(random(0,9));
    int l = int(random(0,9));
    if(section[k][l].value != ' ')
      {
        section[k][l].value =' ';
        section[k][l].type = 2;
      i--; 
      }
 }
  
        for(int k =0;k<9;k++){                            // find first blank section and  set is to keymode active
          for(int j=0;j<9;j++){  
            if(section[k][j].value == ' ') {
              activeSectionForKeyMode = new PVector(k,j);
              section[k][j].isActiveForKeyMode = true;
              return;
            }
          }
        }
        isLevelCreated = true;
  
 }
   
  
  boolean checking(int m,int n){
    for(int i = 0 ; i< 9;i++){
      if(section[m][i].value  == section[m][n].value && i!=n && section[m][i].value !=' ')
            return false;        
    }
      for(int j = 0 ; j< 9;j++){
      if(section[j][n].value  == section[m][n].value && j!=m && section[j][n].value!=' ')
            return false;        
      
      }
      
      int x = n/3;
      int y = m/3;
      
      
      for(int i =y*3 ; i<y*3+3 ; i++){
         for(int j= x*3 ;j< x*3+3 ; j++ ){ 
           if(section[i][j].value == section[m][n].value && !(i==m && j==n ) && section[i][j].value !=' ')
             return false;
           }
        
      }
      return true;
}
void isLevelWon(){
  boolean a = true;
 for(int i =0;i<9;i++){
  for(int j =0 ; j<9 ; j++){
   if(section[i][j].value != ' ' &&  section[i][j].type  != 3) {
     
   }
   else a = false;
    
  }
   
 }
 if(a == true ){
  
  if(LevelUnlocked == LevelSelected && LevelSelected<=10){
  PrintWriter writer = createWriter("data\\information\\currentlevelinfo.hardik");
         writer.print(char(LevelInfoEncryption+LevelUnlocked+1));
         writer.flush();
         writer.close();
LevelUnlocked++;
  for(int i = 0 ; i<10 ; i++){
   
     if(i+1<=LevelUnlocked)level[i].isLocked = false;
    
  }
}
LevelSelected++;
if(LevelSelected>10)LevelSelected =10;
   current = page.levelCompleted;  
   
 }
  
  
  
}

void defineAnimator(int i){
 animator = new Animator(new PVector(board.x,board.y),1,i);
 }
void animate(){
  
  PVector temp = animator.update();
  
  image(boardBack,temp.x-offset,temp.y-offset);
      image(boardFront,temp.x,temp.y); 
       
       
       stroke(0);
       float k =0;
       for(int i=0;i<=9;i++){
       strokeWeight(0.1);
       if(i%3==0) strokeWeight(3);
       line( temp.x, temp.y+k ,temp.x+Length-5, temp.y+k);
       line(  temp.x+k , temp.y , temp.x+k , temp.y+Length-5);
       k += Length/9; 
       }
       
  
  
  
}

}
