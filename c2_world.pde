class Planet {
  //setup for the object, all variables explained in game.
  PVector Position = new PVector();
  PVector Radius = new PVector();
  boolean atmosphere;
  float edgeofatmosphere;
  float airdensity;
  float mass;
  PShape image;
  int red;
  int green;
  int blue;

  Planet(float tempPositionx, float tempPositiony, boolean tempatmosphere, float tempradius, float tempedgeofatmosphere, float tempairdensity, float tempmass, PShape tempimage, int tempred, int tempgreen, int tempblue) {
    Position.x = tempPositionx;
    Position.y = tempPositiony;
    atmosphere = tempatmosphere;
    Radius.y = tempradius;
    edgeofatmosphere = tempedgeofatmosphere;
    airdensity = tempairdensity;
    mass = tempmass;
    image = tempimage;
    red = tempred;
    green = tempgreen;
    blue = tempblue;
  }

  //function returns positionvector of the planet
  PVector getPosition() {
    return Position;
  }

  //return edgeofatmosphere
  float getedgeofatmosphere() {
    return edgeofatmosphere;
  }

  //returns airdensity
  float getairdensity() {

    return airdensity;
  }

  //returns mass
  float getmass() {

    return mass;
  }

  //returns radius
  float getradius() {
    return Radius.y;
  }

  //returns atmosphere
  boolean getatmosphere() {
    return atmosphere;
  }


  //returns radius vector of the planet
  PVector getRadius() {
    return Radius;
  }

  //returns radius float of the planet
  float getRadiusMag() {
    return Radius.mag();
  }

  //returns air density based on current altitude
  float getAirdensity() {
    if (rocket.getAltitude() >= 0 && rocket.getAltitude() <= edgeofatmosphere) {
      return edgeofatmosphere - 1/edgeofatmosphere * rocket.getAltitude();
    } else {
      return 0;
    }
  }

  //returns mass of the planet
  float getMass() {
    return mass;
  }

  //returns pvector from rocket to planet center
  PVector getDistance() {
    return PVector.sub(Position, rocket.getLocation());
  }

  //draws the planet
  void draw() {
    //Draws a blue circle at the position of the planet, which extends to the edge of the atmosphere
    if (atmosphere == true) {
      for (int i=0; i<255; i++) {
        fill(0, 0, i);
        ellipseMode(CENTER);
        circle(width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, (getRadiusMag()+edgeofatmosphere-(edgeofatmosphere*i/255))*2*zoomlevel);
      }
    }
  
  if (zoomlevel <= 0.2 || rocket.getAltitude() >=2000) {
    shape(image, width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, getRadiusMag()*2*zoomlevel*1.01, getRadiusMag()*2*zoomlevel*1.01);
  } else {
    fill(red, green, blue);
    ellipseMode(CENTER);
    circle(width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, getRadiusMag()*2*zoomlevel);
  }
}

}
