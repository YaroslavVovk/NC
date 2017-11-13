class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    position = new PVector(width/2,height/2-200);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
   acceleration.mult(0);
   
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x,position.y,48,48);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }

  }

}
Mover mover;
PVector gravity;
PVector wind;
void setup()
{
size(800,800);
background(255);
mover = new Mover();
gravity = new PVector(0,0.2);
wind = new PVector(0.2,0);
}
void draw()
{
 background(255);
 
 mover.applyForce(gravity);
 if(mousePressed)
 mover.applyForce(wind);
 
mover.display();
mover.update();
mover.checkEdges();
}