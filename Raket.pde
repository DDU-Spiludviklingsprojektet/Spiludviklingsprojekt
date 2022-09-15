class Raket {
  //Vectors for calculations
  PVector Heading = new PVector(0, 1);
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = earth.getPosition().add(earth.getRadius());

  float drymass;
  float fueldensity;
  float tanksize;
  float ISP;
  float power;
  float CD;
  float Area;
  int throttle;
  float fuelpercent = 100;

  Raket(float tempdrymass, float tempfueldensity, float temptanksize, float tempISP, float temppower, float tempCD, float tempArea, int tempthrottle) {
    drymass = tempdrymass;
    fueldensity = tempfueldensity;
    tanksize = temptanksize;
    ISP = tempISP;
    power = temppower;
    CD = tempCD;
    Area = tempArea;
    throttle = tempthrottle;
    shape(raket, 10,10);
  }

  float currentmass() {
    return (drymass+tanksize*fueldensity);
  }

  float deltaV() {
    return ISP*G0*log(drymass/currentmass());
  }

  float getAltitude() {
    if (nearestplanet() == "earth") {
      return Location.dist(earth.getPosition())-earth.getradius().dist(0,0);
    } else {
      return Location.dist(moon.getPosition())-moon.getradius().dist(0,0);
    }
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

  String nearestplanet() {
    if (G * earth.getmass()/pow(Location.dist(earth.getPosition()), 2) >= G * moon.getmass()/pow(Location.dist(moon.getPosition()), 2)) {
      return "earth";
    } else {
      return "moon";
    }
  }

  void engine() {
    if (fuel()>0) {
      float x = (power*throttle)/currentmass()*1000;
      Heading.setMag(x);
      Acceleration.add(Heading);
      Heading.normalize();
    }
  }

  void gravity() {
    if ("earth" == nearestplanet()) {
      float x = G * earth.getmass()/pow(Location.dist(earth.getPosition()), 2);
      PVector Gravity = earth.getPosition().sub(Location);
      Gravity.setMag(x);
      Acceleration.add(Gravity);
    } else {
      float x = G * moon.getmass()/pow(Location.dist(moon.getPosition()), 2);
      PVector Gravity = moon.getPosition().sub(Location);
      Gravity.setMag(x);
      Acceleration.add(Gravity);
    }
  }

  void drag() {
    float x = CD*(earth.getairdensity()*pow(Velocity.mag(), 2))/2*Area;
    PVector Drag = Velocity.setMag(-1*x);
    Acceleration.add(Drag);
  }

  float fuel() {
    return fuelpercent;
  }

  void forces() {
    Acceleration.add(Velocity);
    Velocity.add(Location);
  }
}
