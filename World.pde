
class Planet {
  PVector Position = new PVector();
  PVector Radius = new PVector();

  //Is there an atmosphere?
  boolean atmosphere;
  //How far does the atmosphere reach out, for earth this would be about 70 km
  float edgeofatmosphere;
  //Air density at sea level
  float airdensity;

  Planet(float tempPositionx, float tempPositiony, boolean tempatmosphere, float tempradius, float tempedgeofatmosphere, float tempairdensity) {
    Position.x = tempPositionx;
    Position.y = tempPositiony;
    atmosphere = tempatmosphere;
    Radius.y = tempradius;
    edgeofatmosphere = tempedgeofatmosphere;
    airdensity = tempairdensity;
  }
  float airdensity(){
    return airdensity;
  }
}