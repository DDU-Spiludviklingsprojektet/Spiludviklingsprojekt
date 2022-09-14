class Raket {
  //Vectors for calculations
  PVector Heading = new PVector(0, 1);
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = new PVector();
  PVector Center = new PVector(0, 0);

  float drymass;
  float fueldensity;
  float tanksize;
  float ISP;
  float power;
  float CD;
  float Area;
  int throttle;

  Raket(float tempdrymass, float tempfueldensity, float temptanksize, float tempISP, float temppower, float tempCD, float tempArea, int tempthrottle) {
    drymass = tempdrymass;
    fueldensity = tempfueldensity;
    tanksize = temptanksize;
    ISP = tempISP;
    power = temppower;
    CD = tempCD;
    Area = tempArea;
    throttle = tempthrottle;
  }


  float currentmass() {
    return (drymass+tanksize*fueldensity);
  }

  float deltaV() {
    return ISP*G0*log(drymass/currentmass());
  }

  int getThrottle() {
    return throttle;
  }
  void setThrottle(int x) {
    throttle = x;
  }

  void turn(float x) {
    Heading.rotate(x*pi/180);
  }

  void engine() {
    float x = (power*throttle)/currentmass()*1000;
    Heading.setMag(x);
    Acceleration.add(Heading);
    Heading.normalize();
  }

  void gravity() {
    float x = G * earth.getmass()/pow(Location.dist(Center), 2);
    PVector Gravity = Center.sub(Location);
    Gravity.setMag(x);
    Acceleration.add(Gravity);
  }

  void drag() {
    float x = CD*(earth.getairdensity()*pow(Velocity.mag(), 2))/2*Area;
    PVector Drag = Velocity.setMag(-1*x);
    Acceleration.add(Drag);
  }
  void forces() {
    Acceleration.add(Velocity);
    Velocity.add(Location);
  }
}
