import java.util.List;

class CelestialBody {
  private float radius;
  private float angle;
  private float distance;
  private float speed; 
  private List<CelestialBody> moons;
  private PImage img;
  
  public CelestialBody(float radius, float distance, float speed, List<CelestialBody> moons, String imgName) {
    this.radius = radius;
    this.distance = distance;
    angle = random(TWO_PI);
    this.speed = speed;
    this.moons = moons;
    img = loadImage(imgName);
    img.resize((int) radius * 2, (int) radius * 2);
  }
  
  public CelestialBody(float radius, float distance, float speed, String imgName) {
    this.radius = radius;
    this.distance = distance;
    angle = random(TWO_PI);
    this.speed = speed;
    img = loadImage(imgName);
    img.resize((int) radius * 2, (int) radius * 2);
  }
  
  public List<CelestialBody> getMoons() {
    return moons;
  }
  
  private void move() {
    angle += speed;
   }
   
   public void show() {
    pushMatrix();
    rotate(angle);
    translate(distance, 0);
    imageMode(CENTER);
    image(img, 0, 0);
    if (moons != null) {
    for (CelestialBody moon : moons) {
      moon.show();
      moon.move();
    } 
   }
   popMatrix();
  }

}
