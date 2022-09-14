class Planet {
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
  float getairdensity() {
    return airdensity;
  }
  float getmass() {
    return mass;
  }
  float getradius(){
    return Radius.Mag();
}
