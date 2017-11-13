float x = 10; //<>//
float y = 10;
float xspeed = 1;
float yspeed = -3.3;

void setup() {
size(100,100); //<>//
  background(255);

}

void draw() { //<>//

 background(255);
 

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width-8) || (x < 8)) {
    xspeed = xspeed * -1;
  }
  if ((y > height-8) || (y < 8)) {
    yspeed = yspeed * -1;
  }
 
  stroke(0);
  fill(175);
  ellipse(x,y,16,16); //<>//
   //<>//
}