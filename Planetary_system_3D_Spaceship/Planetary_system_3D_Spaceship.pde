import java.util.List;
import peasy.*;

PImage bg;
CelestialBody star;
List<CelestialBody> planets = new ArrayList<CelestialBody>();
long time = 0;
Spaceship spaceship;
PeasyCam cam;

void setup() {
  size(1600, 1000, P3D);
  cam = new PeasyCam(this, width/ 2, height / 2, 0, 600);
  star = new Star(20, 0, 0, planets, "star.jpg");
  
  List<CelestialBody> moons1 = new ArrayList<CelestialBody>();
  moons1.add(new ImportedCelestialBody(6, 20, 0.005, "asteroid.obj"));
  planets.add(new ShiningCelestialBody(13, 50, 0.0025, moons1, "planet3.jpg"));
  
  List<CelestialBody> moons2 = new ArrayList<CelestialBody>();
  moons2.add(new TexturedCelestialBody(7, 30, 0.005, "planet2.jpg"));
  moons2.add(new TexturedCelestialBody(6, 45, 0.0035, "planet3.jpg"));
  
  planets.add(new TexturedCelestialBody(13, 130, -0.0005, moons2, "planet4.jpg"));
  
  List<CelestialBody> moons3 = new ArrayList<CelestialBody>();
  moons3.add(new TexturedCelestialBody(8, 40, -0.0045, "planet5.jpg"));
  moons3.add(new TexturedCelestialBody(6, 60, 0.0015, "planet2.jpg"));
  moons3.add(new TexturedCelestialBody(7, 74, 0.00085, "planet4.jpg"));
  planets.add(new TexturedCelestialBody(12, 230, 0.0005, moons3, "planet1.jpg"));
  
  planets.add(new TexturedCelestialBody(14, 324, -0.0008, "planet3.jpg"));
  
  
  List<CelestialBody> moons4 = new ArrayList<CelestialBody>();
  moons4.add(new TexturedCelestialBody(6, 40, 0.0045, "planet2.jpg"));
  moons4.add(new TexturedCelestialBody(7, 90, -0.00085, "planet4.jpg"));
  planets.add(new TexturedCelestialBody(11, 430, 0.0004, moons4, "planet5.jpg"));
  
  
  List<CelestialBody> moons5 = new ArrayList<CelestialBody>();
  moons5.add(new TexturedCelestialBody(6, 20, 0.001, "planet6.jpg"));
  planets.add(new TexturedCelestialBody(13, 580, 0.00035, moons5, "planet3.jpg"));
  
  List<CelestialBody> moons6 = new ArrayList<CelestialBody>();
  moons6.add(new TexturedCelestialBody(8, 40, 0.0045, "planet3.jpg"));
  moons6.add(new TexturedCelestialBody(6, 60, -0.0015, "planet5.jpg"));
  moons6.add(new TexturedCelestialBody(7, 74, -0.00085, "planet2.jpg"));
  planets.add(new ColouredCelestialBody(12, 680, -0.0005, moons6, 0, 255, 0));
  
  
  spaceship = new Spaceship();
  
  bg = loadImage("space.jpg");
  bg.resize(width, height);
 }


void draw() {
  background(bg);
  translate(width / 2, height / 2);
  long currTime = millis();
  long deltaTime = currTime - time;
  star.show(deltaTime);
  spaceship.show(deltaTime);
  time = currTime;
}


 void keyPressed() {
    if (key == CODED) {
      spaceship.keyPressed(keyCode);
    }
  }
  
   void keyReleased() {
    if (key == CODED) {
      spaceship.keyReleased(keyCode);
    }
  }
  
  void mouseMoved() {
    spaceship.mouseMoved(mouseX - pmouseX, mouseY - pmouseY);
  }
