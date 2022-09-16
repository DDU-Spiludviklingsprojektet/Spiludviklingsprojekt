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
    if(rocket.getAltitude() >= 0 && rocket.getAltitude() <= edgeofatmosphere){
    return edgeofatmosphere - 1/edgeofatmosphere * rocket.getAltitude();
    }
    else{
     return 0; 
    }
  }
  
  //returns mass of the planet
  float getMass() {
    return mass;
  }
}
