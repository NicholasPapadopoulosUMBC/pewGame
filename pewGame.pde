/*
 * variables
 */
 
 //start word
 String startWord = "Start";
 
 //position of starter text x,y
 int[] textPos = {500, 500};
 
 //start box pos and size, x,y,w,h
 int[] boxSize = {400,150};
 
 //counter for deaths (to determine startWord)
 int deaths = 0;
 
 //how long the player has survived
 int score = 0;
 
 //checks if the game start
 boolean gameState = false;
 
 int playerPos[] = {500,500};
 
 int enemyPos[] = {500,0};
 
 int scoreP = 0;
 //<>//
 int difficulty = 10;
 
 
 
 
 
 
 
/*
 * void setup - Makes 1000, by 1000 canvas
 */
void setup() {
  size(1000,1000);
  frameRate(200);
}

/*
 * void draw - begins to draw every command within the draw command
 */
void draw() {
  
  if(gameState == false) {

  //checks what the word in the start box should be
  checkStartWord();
  
  //draws the start menu
  drawStartMenu();
  
  //checks what the mouse has clicked and wether it should start the game
  checkMouse();
  
  //just a testinng line print
  println(gameState);
  } else {
  drawBackground2();
  drawPlayer();
  drawEnemy();
  checkMouse();
  checkDeath();
  }
}












/*
 * checkStartWord - checks the start word to see wether to change it
 */
void checkStartWord() {
  if (deaths >= 1) {
    startWord = "Start Again...";
    boxSize[0] = 700;
  }
}

/*
 * drawStartMenu - draws the start menu box as well as the black background
 */
void drawStartMenu() {
  //draws background
  background(50);
  
  //draws start box
  fill(240);
  rectMode(CENTER);
  rect(500,500, boxSize[0], boxSize[1]);
  
  //draws text
  fill(20);
  textAlign(CENTER,CENTER);
  textSize(100);
  text(startWord, 500,500-20);
  
  fill(240);
  textAlign(CENTER,CENTER);
  textSize(50);
  text(scoreP, 500,500+100);
}

/*
 * checkMouse - checks when the mouse clicks the start menu to initialize starGame
 */
void checkMouse() {
  if (mousePressed) {
    if (mouseX >= 500 - (boxSize[0]/2) && mouseX <= boxSize[0] + (boxSize[0]/2)) {
      if (mouseY >= 500 - (boxSize[1]/2) && mouseY <= 500 + (boxSize[1]/2)) {
        gameState = true;
        scoreP = 0;
      } else {
        gameState = false;
      }
    }
  }
}












/*
 * drawBackground2 - draws background for the actual game
 */
void drawBackground2() {
  background(0);
  fill(240);
  textAlign(CENTER,CENTER);
  textSize(500);
  text("RUN", 500,500-100);
}

/*
 * drawPlayer - draws the posisiton of the player
 */
void drawPlayer() {
  playerPos[0] = mouseX;
  playerPos[1] = mouseY;
  fill(240);
  circle(playerPos[0], playerPos[1],50);
}

void drawEnemy() {
  if (enemyPos[0] > playerPos[0]) {
    enemyPos[0]-= 10;
  }
  if (enemyPos[0] < playerPos[0]) {
    enemyPos[0]+= 10;
  }
  if (enemyPos[1] > playerPos[1]) {
    enemyPos[1]-= 10;
  }
  if (enemyPos[1] < playerPos[1]) {
    enemyPos[1]+= difficulty;
  }
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(enemyPos[0],enemyPos[1], 50, 50);
  scoreP++;
}

void checkDeath() {
  if (playerPos[0] + 20 >= enemyPos[0]) {
    if (playerPos[0] - 20 <= enemyPos[0]) {
      if (playerPos[1] + 20 >= enemyPos[1]) {
        if (playerPos[1] - 20 <= enemyPos[1]) {
          gameState = false;
          deaths ++; //<>//
          enemyPos[0] = 500;
          enemyPos[1] = 0;
        }
      }
    }
  }
}
