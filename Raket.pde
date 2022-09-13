class Raket {
  //Meassured in meters
  PVector Heading = new PVector(0, 1);
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = new PVector();
  PVector Center = new PVector(0, 0);
  //PVector Gravity = new PVector();

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
  //Drag coefficient
  float CD;
  //Rocket area
  float Area;

  Raket(float tempdrymass, float tempfueldensity, float temptanksize, float tempISP, float temppower, float tempCD, float tempArea) {
    drymass = tempdrymass;
    fueldensity = tempfueldensity;
    tanksize = temptanksize;
    ISP = tempISP;
    power = temppower;
    CD = tempCD;
    Area = tempArea;
  }

  float throttle;
  float pi = 3.14;
  float G = pow(6.674, -11);
  float G0 = 9.82;
  //Disse to skal tages et andet sted fra når man har genereret planeten.
  float planetmass;
  float planetradius;
  //densiteten skal laves som funktion af luftmodstand.
  float rho;



  //TODO: Jeg ved ikke om denne float bliver opdateret hver frame, fordi det burde den.
  float currentmass() {
    return (drymass+tanksize*fueldensity);
  }

  //Det samme gælder denne.
  float deltaV() {
    return ISP*G0*log(drymass/currentmass());
  }

  void turn(float x) {
    Heading.rotate(x*pi/180);
  }

  void setThrottle(int x) {
    throttle = x;
  }

  void engine() {
    float x = (power*throttle)/currentmass()*1000;
    Heading.setMag(x);
    Acceleration.add(Heading);
    Heading.normalize();
  }

  void gravity() {
    float x = G * planetmass/pow(Location.dist(Center), 2);
    PVector Gravity = Center.sub(Location);
    Gravity.setMag(x);
    Acceleration.add(Gravity);
  }

  void drag() {
    float x = CD*(rho*pow(Velocity.mag(), 2))/2*Area;
    PVector Drag = Velocity.setMag(-1*x);
    Acceleration.add(Drag);
  }

  void draw() {
    engine();
    gravity();
    drag();
    Acceleration.add(Velocity);
    Velocity.add(Location);
  }
}
