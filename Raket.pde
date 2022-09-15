class Raket {
  //Vectors for calculations
  PVector Heading = new PVector(0, 1);
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = earth.getPosition().add(earth.getRadius());

  //setup of the object, all variables described in Game tab.
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
    shape(raket, 10, 10);
  }

  //returns mass of rocket
  float getCurrentmass() {
    return (drymass+tanksize*fueldensity);
  }

  //returns rocket deltaV (remaining change in velocity)
  float getDeltaV() {
    return ISP*G0*log(drymass/getCurrentmass());
  }

  //returns altitude of rocket over current planet with stronget gravity
  float getAltitude() {
    if (getNearestplanet() == "earth") {
      return Location.dist(earth.getPosition())-earth.getRadiusMag();
    } else {
      return Location.dist(moon.getPosition())-moon.getRadiusMag();
    }
  }

  //returns current throttle percentage
  int getThrottle() {
    return throttle;
  }

  //returns location PVector
  PVector getLocation() {
    return Location;
  }

  //returns string of name of planet with strongest gravitational pull
  String getNearestplanet() {
    if (G * earth.getMass()/pow(Location.dist(earth.getPosition()), 2) >= G * moon.getMass()/pow(Location.dist(moon.getPosition()), 2)) {
      return "earth";
    } else {
      return "moon";
    }
  }

  //returns the fuelpercent of the rocket
  float getFuel() {
    return fuelpercent;
  }

  //sets new throttle percentage
  void setThrottle(int x) {
    throttle = x;
  }

  //Changes direction, by rotating heading vector
  void setTurn(float x) {
    Heading.rotate(x*pi/180);
  }

  //calculates engine force, and adds to acceleration vector
  void engine() {
    if (getFuel()>0) {
      float x = (power*throttle)/getCurrentmass()*1000;
      Heading.setMag(x);
      Acceleration.add(Heading);
    }
  }

  //calculates gravity force, and adds to acceleration vector
  void gravity() {
    if ("earth" == getNearestplanet()) {
      float x = G * earth.getMass()/pow(Location.dist(earth.getPosition()), 2);
      PVector Gravity = earth.getPosition().sub(Location);
      Gravity.setMag(x);
      Acceleration.add(Gravity);
    } else {
      float x = G * moon.getMass()/pow(Location.dist(moon.getPosition()), 2);
      PVector Gravity = moon.getPosition().sub(Location);
      Gravity.setMag(x);
      Acceleration.add(Gravity);
    }
  }

  //calculates drag force, and adds to acceleration vector
  void drag() {
    float x = CD*(earth.getAirdensity()*pow(Velocity.mag(), 2))/2*Area;
    PVector Drag = Velocity.setMag(-1*x);
    Acceleration.add(Drag);
  }

  //adds acceleration to velocity, and velocity to location.
  void forces() {
    Acceleration.add(Velocity);
    Velocity.add(Location);
  }
}
