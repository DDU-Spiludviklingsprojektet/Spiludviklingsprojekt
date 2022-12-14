class Planet {
  //setup for the object, all variables explained in game.
  PVector Position = new PVector();
  PVector Radius = new PVector();
  boolean atmosphere;
  float edgeofatmosphere;
  float airdensity;
  float mass;

  Planet(float tempPositionx, float tempPositiony, boolean tempatmosphere, float tempradius, float tempedgeofatmosphere, float tempairdensity, float tempmass) {
    Position.x = tempPositionx;
    Position.y = tempPositiony;
    atmosphere = tempatmosphere;
    Radius.y = tempradius;
    edgeofatmosphere = tempedgeofatmosphere;
    airdensity = tempairdensity;
    mass = tempmass;
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

  //TODO: These two functions should really be one function, it is a class afterall, and it should be better adaptable to new planets
  //The color really should have been a setup for the object. But I wasnt forward thinking enough to do that.
  //Draws the earth
  void earthdraw() {
    if (zoomlevel <= 0.2 || rocket.getAltitude() >=2000) {
      shape(jorden_img, width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, getRadiusMag()*2*zoomlevel*1.01, getRadiusMag()*2*zoomlevel*1.01);
    } else {
      fill(0, 255, 0);
      ellipseMode(CENTER);
      circle(width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, getRadiusMag()*2*zoomlevel);
    }
  }
  //Draws the moon
  void moondraw() {
    if (zoomlevel <= 0.2 || rocket.getAltitude() >=2000) {
      shape(moon_img, width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, getRadiusMag()*2*zoomlevel*1.01, getRadiusMag()*2*zoomlevel*1.01);
    } else {
      fill(100);
      ellipseMode(CENTER);
      circle(width/2+getDistance().x*zoomlevel, height/2-getDistance().y*zoomlevel, getRadiusMag()*2*zoomlevel);
    }
  }
}
