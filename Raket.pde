class Raket {
  //Meassured in meters
  PVector Heading = new PVector(0, 1);
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
  float throttle;
  float thrust;
  float pi = 3.14;

  //TODO: Fix den her kode, det er næsten sikkert forkert, men jeg ville bare lave et eller andet der ligner det kunne virke. Og selv hvis det virker er det sikkert stadigt dårlig kode.
  void turn(float x) {
    if (Heading.x>=0) {
      Heading.y = 180/pi*((atan(Heading.y/Heading.x)*pi/180)+x);
    } else {
      Heading.y = 180/pi*((atan(Heading.y/Heading.x)*pi/180)+x);
    }
  }

  void setThrotle(int x) {
    throttle = x;
  }
  void update() {
    thrust = (power*throttle)/currentmass*1000;
    Heading.setMag(thrust);
    Acceleration.add(Heading);
    Heading.normalize();
  }

  float deltaV() {
    float x;
    x = drymass/currentmass;
    return x;
  }
}
