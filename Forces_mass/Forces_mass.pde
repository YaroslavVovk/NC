class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    position = new PVector(random(width),height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(1,2);
  }
  
  void applyForce(PVector force) {
    PVector f =PVector.div(force,mass);
    println(f);
    acceleration.add(f);
    f.mult(0);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
   acceleration.mult(0);
   
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(127,100);
    ellipse(position.x,position.y,mass*15,mass*15);
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
Mover[] movers;
PVector gravity;
PVector wind;
void setup()
{
size(800,800);
background(255);
movers = new Mover[5];
for(int i=0;i<movers.length;i++)
{
movers[i] = new Mover();
}

}
void draw()
{
 background(255);

 for(Mover m:movers)
 {
 gravity = new PVector(0,0.1);
 wind = new PVector(0.1,0);
 gravity.mult(m.mass);
 m.applyForce(gravity);
 if(mousePressed)
 m.applyForce(wind);
 
m.display();
m.update();
m.checkEdges();
 }

}