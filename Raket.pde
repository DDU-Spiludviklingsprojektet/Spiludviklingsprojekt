class Raket {
  //Meassured in meters
  PVector Heading = new PVector(0, 1);
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = new PVector();
  PVector Center = new PVector(0,0);

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

  float DeltaV;
  float throttle;
  float thrust;
  float G0;
  float pi = 3.14;
  float G = pow(6.674,-11);
  float planetmass;

  void turn(float x){
    float xrad = x*pi/180;
    Heading = PVector.fromAngle(Heading.heading()+xrad);
  }

  void setThrottle(int x) {
    throttle = x;
  }

  float currentmass() {
    return (drymass+tanksize*fueldensity);
  }

  float deltaV() {
    return ISP*G0*log(drymass/currentmass());
  }

  void engine() {
    thrust = (power*throttle)/currentmass()*1000;
    Heading.setMag(thrust);
    Acceleration.add(Heading);
    Heading.normalize();
  }

  void gravity(){
   pow(Location.dist(Center),2);
  }

  void draw() {
    engine();
    gravity();
    Acceleration.add(Velocity);
    Velocity.add(Location);
  }
}
