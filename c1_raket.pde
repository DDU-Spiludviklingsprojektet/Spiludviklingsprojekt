class Raket {
  //Vectors for calculations
  PVector Heading = new PVector(0, 1);
  PVector Acceleration = new PVector();
  PVector Velocity = new PVector();
  PVector Location = PVector.add(earth.getRadius(), earth.getPosition());
  PVector Gravity = new PVector();
  PVector Engine = new PVector();
  PVector Drag = new PVector();

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
  float goalheading = 0;

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

  //Til Simon:
  public float getISP() {
    return ISP;
  }
  public float getPower() {
    return power;
  }
  public float getDryMass() {
    return drymass;
  }
  public float getFuelDensity() {
    return fueldensity;
  }
  public float getCD() {
    return CD;
  }
  public void setISP(float tempISP) {
    ISP = tempISP;
  }
  public void setPower(float temppower) {
    power = temppower;
  }
  public void setDryMass(float tempdrymass) {
    drymass = tempdrymass;
  }
  public void setFuelDensity(float tempfueldensity) {
    fueldensity = tempfueldensity;
  }
  public void setCD(float tempCD) {
    CD = tempCD;
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
      return (Location.dist(earth.getPosition()))-(earth.getRadiusMag());
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
    if (keyPressed == true &&(keyCode == 16 || keyCode == 17)) {
      throttle = x;
    }
  }
  void setChangedirection(float x) {
    if (keyPressed == true &&(keyCode == 37 || keyCode == 39)) {
      goalheading = radians(x)+goalheading;
      setHeading(goalheading+PI/2);
    }
  }

  float getGoalheading() {
    return goalheading;
  }
  //input float sets heading vector direction
  void setHeading(float x) {
    Heading = PVector.fromAngle(x);
    Heading.x = - Heading.x;
  }

  //calculates engine force, and adds to acceleration vector
  void engine() {
    if (fuelpercent>0) {
      float x = throttle*(tanksize*fueldensity/power)/pow(10, 9);
      fuelpercent = fuelpercent - x;
      float y = (power*throttle)/getCurrentmass()*1000;
      Engine = Heading.copy();
      Engine.setMag(y);
    }
  }

  //calculates gravity force, and adds to acceleration vector
  void gravity() {
    if ("earth" == getNearestplanet()) {
      float x = G * earth.getMass()/pow(Location.dist(earth.getPosition()), 2);
      Gravity = PVector.sub(earth.getPosition(), Location);
      Gravity.setMag(x);
    } else {
      float x = G * moon.getMass()/pow(Location.dist(moon.getPosition()), 2);
      Gravity = PVector.sub(moon.getPosition(), Location);
      Gravity.setMag(x);
    }
  }

  //calculates drag force, and adds to acceleration vector
  void drag() {
    PVector temp = new PVector();
    temp = Velocity.copy();
    float x = CD*(earth.getAirdensity()*pow(temp.mag(), 2))/2*Area*0.000000001;
    Drag = temp.setMag(x*-1);
  }
  boolean collision() {
    if (Location.dist(earth.getPosition()) <= earth.getRadiusMag()&&Velocity.mag()>=20) {
      return true;
    } else if (Location.dist(moon.getPosition()) <= moon.getRadiusMag()&&Velocity.mag()>=20) {
      return true;
    } else {
      return false;
    }
  }

  void planetcollision() {
    if (getNearestplanet() == "earth") {
      PVector tempDist = PVector.sub(Location, earth.getPosition());
      if (tempDist.mag() <= earth.getRadiusMag()&& PVector.dist(PVector.add(tempDist, Acceleration), earth.getPosition())<=tempDist.mag()) {
        Velocity = new PVector(0, 0);
        Location = PVector.add(earth.getPosition(), tempDist.setMag(earth.getRadiusMag()));
      }
    } else {
      PVector tempDist = PVector.sub(Location, moon.getPosition());
      if (tempDist.mag() <= moon.getRadiusMag()&& PVector.dist(PVector.add(tempDist, Acceleration), earth.getPosition())<=tempDist.mag()) {
        Velocity = new PVector(0, 0);
        Location = PVector.add(moon.getPosition(), tempDist.setMag(moon.getRadiusMag()));
      }
    }
  }

  //adds acceleration to velocity, and velocity to location.
  void forces() {
    Acceleration = new PVector();
    engine();
    drag();
    gravity();
    Acceleration.add(Engine);
    Acceleration.add(Drag);
    Acceleration.add(Gravity);
    Velocity.add(Acceleration);
    planetcollision();
    Location.add(Velocity);
  }
  void draw() {
    shapeMode(CENTER);
    if (zoomlevel >0.5) {
      translate(width/2, height/2);
      rotate(goalheading);
      shape(raket_img, 0, 0, zoomlevel*width/25, zoomlevel*width/25);
    } else {
      translate(width/2, height/2);
      rotate(goalheading);
      shape(arrow_img, 0, 0, width/50, width/50);
    }
  }
}
