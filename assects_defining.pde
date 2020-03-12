void defineMainMenu(){
 mainLogo.resize(int(0.558634 *height),int(0.142857*height));
 dimensionQuit = new PVector( 0.214285 * height , 0.1*height);
 dimensionPlay = new PVector( 0.2542857*height ,0.26 * height );
 dimensionCustom = new PVector(0.42181776*height,0.142857*height);
 cquit = new PVector(width - 0.0183016*width -dimensionQuit.x/2,0.092857 *height);
  cplay = new PVector(width/2,height/2);
  ccustom = new PVector(3*width/4,0.8214285*height);
   playButton = loadImage("images\\mainmenu\\playred.png");
  playButton.resize(int(dimensionPlay.x),int(dimensionPlay.y));
  quitButton = loadImage("images\\mainmenu\\quitbutton.png");
   quitButton.resize(int(dimensionQuit.x),int(dimensionQuit.y));
  //customLevel  = loadImage("images\\mainmenu\\customlevel.png");
  //customLevel.resize(int(dimensionCustom.x),int(dimensionCustom.y));
  //customLevelSelected  = loadImage("images\\mainmenu\\customlevelselected.png");
  // customLevelSelected.resize(int(dimensionCustom.x),int(dimensionCustom.y));
  
}

void defineLevelSelection(){
  levelLocked = loadImage("images\\levelbuttons\\levellock.png");
  levelLocked.resize(int(0.1428571 * height),int(0.1428571 * height));
  backButton = loadImage("images\\mainmenu\\backbutton.png");
  backButton.resize(int(height * 0.1071429),int(height * 0.1071429));
  float j = (0.892857*height - (height* 0.2142857  + height * 0.1071429 ) - 2 * 0.1428571 * height ) /3 ;
  float m = height* 0.2142857  + height * 0.1071429 +j;
  float l = ((width - (0.1*width+0.1071429*height)*2) - 5*0.1428571 * height)/4  + (0.1428571 * height);
  int k = 0;
  for(int i = 0 ; i<10 ; i++){
    if(i==5)k=0;
      level[i] = new Level(i+1);
      level[i].posX = (0.1*width+0.1071429*height)+  l *k;
      level[i].posY = m + (int(i/5) *( j+0.1428571 * height) );
     k++;
     if(i+1<=LevelUnlocked)level[i].isLocked = false;
    
  }
  cback = new PVector(0.05*width, height* 0.2142857);
}

void definePlayMode(){
     defineKeyBoardPosition();
     board = new Board(boardPosition.x,boardPosition.y,0.65*height);
     clock = new Clock();
     keyMouseButton = new KeyMouseButton();
     deleteClearButton = new DeleteClearButton();
     scribbleButton = new ScribbleButton();
     playPauseButton = new PlayPauseButton();
     musicSoundHelpButton = new MusicSoundHelpButton();
     
}
void defineKeyBoardPosition(){
  
  float x = 0.78 * height;
  float y = 2 * 0.1823 * height;
  
  float z = ( width - (x+y) - (0.0366 * width) )/2;
  float p = height - x - 0.026042 * height + 0.065*height;
  
  keyPosition = new PVector(z,p);
  
 boardPosition =  new PVector(z+y+0.0366*width+0.065*height,p);

  
}

void defineQuitMenu(){
  dimensionAreusure = new PVector(3*width/4,0.069603045 *3*width/4);
  posAreusure = new PVector(width/2,height/2);
  dimensionCorrect = new PVector(0.1142857*height,height*0.1142857);
  dimensionCross   = new PVector(0.1142857*height,height*0.1142857);
  posCross = new PVector( width/2+width/8,height/2 +  dimensionAreusure.y/2 );
  posCorrect =new PVector( width/2-width/8-dimensionCross.x,height/2 +dimensionAreusure.y/2 );
  areusure = loadImage("images\\quitmenu\\areusure.png");
  areusure.resize(int(dimensionAreusure.x),int(dimensionAreusure.y));
  crossgreen =  loadImage("images\\quitmenu\\crossgreen.png");
  crossgreen.resize(int(dimensionCross.x),int(dimensionCross.y));
  correctred =  loadImage("images\\quitmenu\\correctred.png");
  correctred.resize(int(dimensionCorrect.x),int(dimensionCorrect.y));

  
}
void definePauseMenu(){
  
  pauseMenu = new PauseMenu();
  levelCompleted = new LevelCompleted();
  
}
