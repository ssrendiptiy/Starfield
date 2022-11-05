popcorn[] pop = new popcorn[200];
void setup(){
  size(500,500);
  for(int i = 0; i < pop.length-20; i++){
    pop[i] = new popcorn();
  }
  for(int i = 180; i < pop.length; i++){
    pop[i] = new kernel();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < pop.length; i++){
    pop[i].cook();
    pop[i].show();
    
  }
}

class popcorn{
  double myX, myY, col, ang, spd, siz;
  popcorn(){
    myX = 250.0;
    myY = 250.0;
    spd = (double)(Math.random()*10)+1;
    ang = (double)(Math.random()*(Math.PI*2));
  }
  void cook(){
    myX += Math.cos(ang)*spd;
    myY += Math.sin(ang)*spd;
    if(myX >= width || myX <= 0 || myY >= height || myY <= 0){
      myX = width/2;
      myY = height/2;
      spd = (double)(Math.random()*6)+1;
    }
  }
  void show(){
    fill(#DB99D2);
    ellipse((float)myX-5, (float)myY-5, 10,10);
    ellipse((float)myX+5, (float)myY-5, 10,10);
    ellipse((float)myX, (float)myY, 20,20);
    
    //snout
    fill(#DB99D2);
    ellipse((float)myX+.25, (float)myY+4, 7, 5);
    
    //nostrils and eyes
    fill(#FFFFFF);
    ellipse((float)myX-4, (float)myY-1, 2, 2);
    ellipse((float)myX+4, (float)myY-1, 2, 2);
  }
}
class kernel extends popcorn{
  kernel(){
    myX = 250.0;
    myY = 250.0;
    spd = (double)(Math.random()*3)+1;
    ang = (double)(Math.random()*(Math.PI*2));
  }
  void show(){
    textSize(25);
    stroke(#000000);
    text("oink", (int)myX, (int)myY);
  }
}
