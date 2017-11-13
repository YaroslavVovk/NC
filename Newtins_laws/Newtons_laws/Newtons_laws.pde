class Mover {
 
  PVector location;
  PVector velocity;
  PVector mouse;
  PVector acceleration;

  float topspeed;
 
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  void applyForce(PVector force) {
    acceleration.add(force);
 }
 
  void update() { //<>//
     //mouse = new PVector(mouseX,mouseY); //<>//
    velocity.add(acceleration); //<>//
    location.add(velocity); //<>//
    println(velocity.y);
   //acceleration = mouse.sub(location).setMag(0.5); //<>//
    velocity.limit(5); //<>//
  }
 

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,30,30);
  }
 
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
}
}
Mover mover;

void setup()
{
size(1200,800);

mover = new Mover();
}

void draw()
{
  frameRate(30);
  background(255);
fill(255);
PVector force = new PVector(0,0.2);
mover.applyForce(force);

mover.update();
mover.display();
mover.checkEdges();
}