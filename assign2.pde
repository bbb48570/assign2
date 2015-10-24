//You should implement your assign2 here.
final int Game_Start=0;
final int Game_Play=1;
final int Game_GG=2;

int Game_State;

boolean Up=false;
boolean Down=false;
boolean Left=false;
boolean Right=false;


PImage fighter;
PImage backgroungImg;
PImage backgroungImg1;
PImage enemy;
PImage hp;
PImage treasure;

PImage start1;
PImage start2;
PImage end1;
PImage end2;


int x;
int y;
int hpp;
int z; //treasure x
int x1;
int x2;
int EnemyY;

int fighterX;
int fighterY;
float fighterwidth;

float speed=5;
// new.



void setup () {
  
  Game_State=Game_Start;
  EnemyY=floor(random(20,430));  
  hpp=97;
  x=1;
  y=floor(random(20,430));
  z=floor(random(20,400));
  size(640,480) ;  // must use this size.
  
  x1=1;
  x2=-639;
  
  
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  backgroungImg=loadImage("img/bg1.png");
  backgroungImg1=loadImage("img/bg2.png");
  fighter=loadImage("img/fighter.png");
  enemy=loadImage("img/enemy.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  // your code
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  fighterX=550;
  fighterY=240;
  fighterwidth=61;
  
  
}

void draw() {
     
     image(start2,0,0);  
     switch(Game_State){
     case Game_Start:
    
     if(mouseX>200&&mouseX<460&&mouseY>375&&mouseY<420){
      
     if (mousePressed){
     Game_State=Game_Play;
     }else{  
     noStroke();
     image(start1,0,0);}      
     }
     break;
  
  
    case Game_Play:  
    x%=640;    
    if(x2==639){
       x2=-639;
    }
    
    if(x1==639){
    x1=-639;
    }
    
    image(backgroungImg,x2=x2+1,0);    
    image(backgroungImg1,x1=x1+1,0);         
    image(enemy,x=x+4,EnemyY);    
    image(treasure,z,y);    
    rectMode(CORNERS);    
    fill(255,0,0);
    rect(57,20,hpp,50);    
    image(hp,50,20);    
    image(fighter,fighterX,fighterY);
    
    if(fighterY<=EnemyY){
    EnemyY-=1;
    }
     if(fighterY>=EnemyY){
    EnemyY+=1;
    }
    
    
    
    if (Up){
      fighterY-=speed;
      if (fighterY<=0){
      fighterY=0;}
    }
    if (Down){
      fighterY+=speed;
      if (fighterY>=430){
      fighterY=430;}
    }
    if (Left){
      fighterX-=speed;
      if (fighterX<=0){
      fighterX=0;}
    }
    if (Right){
      fighterX+=speed;
      if (fighterX>=590){
      fighterX=590;}
    }
    if (((z+treasure.width>=fighterX) && (z+treasure.width<=(fighterX+fighter.width))) || ((z>=fighterX) && (z<=(fighterX+fighter.width))))

    if (((y+treasure.height>=fighterY) && (y+treasure.height<=(fighterY+fighter.height))) || ((y>=fighterY) && (y<=(fighterY+fighter.height))))
    {
    if(hpp>=255){hpp=255;}else{
    hpp=hpp+20;}
    y=floor(random(20,450));
    z=floor(random(20,400));  
    image(treasure,z,y);
    }
    

    if (((x+enemy.width>=fighterX) && (x+enemy.width<=(fighterX+fighter.width))) || ((x>=fighterX) && (x<=(fighterX+fighter.width))))

    if (((EnemyY+enemy.height>=fighterY) && (EnemyY+enemy.height<=(fighterY+fighter.height))) || ((EnemyY>=fighterY) && (EnemyY<=(fighterY+fighter.height))
    ||((EnemyY+10>=fighterY)&&(EnemyY+enemy.height-10<=fighterY+fighter.height))
    ))

    {hpp=hpp-40;
    x=0; 
    EnemyY=floor(random(20,450));
    } 
    if(hpp<=57){Game_State=Game_GG;
    }
    break;
    case Game_GG:
    
    image(end2,0,0);  
    
     if(mouseX>200&&mouseX<445&&mouseY>310&&mouseY<345){
          
     if (mousePressed){
     Game_State=Game_Play;   
     
     hpp=97;
     
     
     
     
     
     
     }else{  
     noStroke();
     image(end1,0,0);}      
     }
      break; 
      
     }
     }
   
   
  

  
  // your code

void keyPressed(){
  if(key== CODED){
    switch (keyCode){
    case UP:
      Up=true;
      break;
    case DOWN:
      Down=true;
      break;
    case LEFT:
      Left=true;
      break;
    case RIGHT:
      Right=true;
      break;
    }
  }
}

void keyReleased(){
  if(key==CODED){
    switch (keyCode){
    case UP:
      Up=false;
      break;
    case DOWN:
      Down=false;
      break;
    case LEFT:
      Left=false;
      break;
    case RIGHT:
      Right=false;
      break;
    }
  }
}
