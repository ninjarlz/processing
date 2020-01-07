import java.util.List;

PImage bg;
CelestialBody star;
List<CelestialBody> planets = new ArrayList<CelestialBody>();
long time = 0;
void setup() {
  size(1600, 1000);
  
  List<CelestialBody> moons1 = new ArrayList<CelestialBody>();
  moons1.add(new CelestialBody(6, 20, 0.1, "planet6.png"));
  planets.add(new CelestialBody(13, 50, 0.05, moons1, "planet1.png"));
  
  List<CelestialBody> moons2 = new ArrayList<CelestialBody>();
  moons2.add(new CelestialBody(7, 30, 0.1, "planet2.png"));
  moons2.add(new CelestialBody(6, 45, 0.07, "planet3.png"));
  
  planets.add(new CelestialBody(13, 130, -0.01, moons2, "planet4.png"));
  
  List<CelestialBody> moons3 = new ArrayList<CelestialBody>();
  moons3.add(new CelestialBody(8, 40, -0.09, "planet5.png"));
  moons3.add(new CelestialBody(6, 60, 0.03, "planet7.png"));
  moons3.add(new CelestialBody(7, 74, 0.017, "planet7.png"));
  planets.add(new CelestialBody(12, 230, 0.01, moons3, "planet10.png"));
  
  planets.add(new CelestialBody(14, 324, -0.016, "planet11.png"));
  
  
  List<CelestialBody> moons4 = new ArrayList<CelestialBody>();
  moons4.add(new CelestialBody(6, 40, 0.09, "planet12.png"));
  moons4.add(new CelestialBody(7, 90, -0.017, "planet14.png"));
  planets.add(new CelestialBody(11, 430, 0.008, moons4, "planet15.png"));
  
  
  List<CelestialBody> moons5 = new ArrayList<CelestialBody>();
  moons5.add(new CelestialBody(6, 20, 0.1, "planet16.png"));
  planets.add(new CelestialBody(13, 580, 0.007, moons5, "planet17.png"));
  
  List<CelestialBody> moons6 = new ArrayList<CelestialBody>();
  moons6.add(new CelestialBody(8, 40, 0.09, "planet18_0.png"));
  moons6.add(new CelestialBody(6, 60, -0.03, "planet19.png"));
  moons6.add(new CelestialBody(7, 74, -0.017, "planet20.png"));
  planets.add(new CelestialBody(12, 680, -0.01, moons6, "planet1.png"));

  star = new CelestialBody(20, 0, 0, planets, "star.png");
  bg = loadImage("space.jpg");
  bg.resize(width, height);
 }


void draw() {
  background(bg);
  translate(width / 2, height / 2);
  star.show();
}
