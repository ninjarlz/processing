import java.util.List;
import peasy.*;

PImage bg;
CelestialBody star;
List<CelestialBody> planets = new ArrayList<CelestialBody>();
long time = 0;
PeasyCam cam;

void setup() {
  size(1600, 1000, P3D);
  cam = new PeasyCam(this, width /2, height /2 ,0, 600);
  List<CelestialBody> moons1 = new ArrayList<CelestialBody>();
  moons1.add(new CelestialBody(6, 20, 0.005, "planet6.jpg"));
  planets.add(new CelestialBody(13, 50, 0.0025, moons1, "planet1.jpg"));
  
  List<CelestialBody> moons2 = new ArrayList<CelestialBody>();
  moons2.add(new CelestialBody(7, 30, 0.005, "planet2.jpg"));
  moons2.add(new CelestialBody(6, 45, 0.0035, "planet3.jpg"));
  
  planets.add(new CelestialBody(13, 130, -0.0005, moons2, "planet4.jpg"));
  
  List<CelestialBody> moons3 = new ArrayList<CelestialBody>();
  moons3.add(new CelestialBody(8, 40, -0.0045, "planet5.jpg"));
  moons3.add(new CelestialBody(6, 60, 0.0015, "planet2.jpg"));
  moons3.add(new CelestialBody(7, 74, 0.00085, "planet4.jpg"));
  planets.add(new CelestialBody(12, 230, 0.0005, moons3, "planet1.jpg"));
  
  planets.add(new CelestialBody(14, 324, -0.0008, "planet1.jpg"));
  
  
  List<CelestialBody> moons4 = new ArrayList<CelestialBody>();
  moons4.add(new CelestialBody(6, 40, 0.0045, "planet2.jpg"));
  moons4.add(new CelestialBody(7, 90, -0.00085, "planet4.jpg"));
  planets.add(new CelestialBody(11, 430, 0.0004, moons4, "planet5.jpg"));
  
  
  List<CelestialBody> moons5 = new ArrayList<CelestialBody>();
  moons5.add(new CelestialBody(6, 20, 0.001, "planet6.jpg"));
  planets.add(new CelestialBody(13, 580, 0.00035, moons5, "planet1.jpg"));
  
  List<CelestialBody> moons6 = new ArrayList<CelestialBody>();
  moons6.add(new CelestialBody(8, 40, 0.0045, "planet3.jpg"));
  moons6.add(new CelestialBody(6, 60, -0.0015, "planet5.jpg"));
  moons6.add(new CelestialBody(7, 74, -0.00085, "planet2.jpg"));
  planets.add(new CelestialBody(12, 680, -0.0005, moons6, "planet1.jpg"));

  star = new CelestialBody(20, 0, 0, planets, "star.jpg");
  bg = loadImage("space.jpg");
  bg.resize(width, height);
 }


void draw() {
  background(bg);
  lights();
  translate(width / 2, height / 2);
  long currTime = millis();
  star.show(currTime - time);
  time = currTime;
}
