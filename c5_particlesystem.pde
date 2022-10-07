class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle() {
    acceleration = rocket.getHeading().copy();
    velocity = rocket.getHeading().copy();
    velocity.rotate(random(-PI, PI));
    position = rocket.getHeading().copy().setMag(18*zoomlevel);
    position.x = -position.x;
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    acceleration.rotate(random(-PI*0.05, PI*0.05));
    velocity.add(acceleration);
    position.add(velocity);
    position.rotate(PVector.angleBetween(rocket.getHeading(), position));
    position.x = -position.x;
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(221, 87, 28, lifespan*rocket.getThrottle()/200);
    fill(221, 87, 28, lifespan*rocket.getThrottle()/200);
    ellipse(position.x, position.y, 5*zoomlevel, 5*zoomlevel);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle());
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
