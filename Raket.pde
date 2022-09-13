class Raket {
  //Meassured in meters
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = new PVector();
  
  // Drymass in KG
  float drymass;
  float fueldensity;
  float tanksize;
  float ISP;
  

  Raket(float tempdrymass) {
    drymass = tempdrymass;
  }
  void setThrotle(int x){
    
  }
  float deltaV(){
    x = drymass/currentmass;
    return x;
}
