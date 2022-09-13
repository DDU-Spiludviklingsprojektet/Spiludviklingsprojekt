class Raket {
  //Meassured in meters
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = new PVector();

  // Drymass in KG
  float drymass;
  //Fuel density in kg per cubic meter
  float fueldensity;
  //Tank size in cubic meters
  float tanksize;
  //ISP in seconds
  float ISP;
  //Enginepower in KN
  float power;
  
  Raket(float tempdrymass, float tempfueldensity, float temptanksize, float tempISP, float temppower) {
    drymass = tempdrymass;
    fueldensity = tempfueldensity;
    tanksize = temptanksize;
    ISP = tempISP;
    power = temppower;
  }

  float currentmass;
  float DeltaV;
  float thrust;

  void setThrotle(int x) {
    thrust = (power*x)/currentmass*1000;
    
  }
  
  float deltaV() {
    float x;
    x = drymass/currentmass;
    return x;
  }
}
