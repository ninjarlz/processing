import java.util.List;

abstract class CelestialBody {
  protected float radius;
  protected float angle;
  protected float distance;
  protected float speed; 
  protected List<CelestialBody> moons;
  protected PShape shape;
  
  public CelestialBody(float radius, float distance, float speed, List<CelestialBody> moons) {
    this.radius = radius;
    this.distance = distance;
    angle = random(TWO_PI);
    this.speed = speed;
    this.moons = moons;
    noStroke();
    noFill();
    shape = createShape(SPHERE, radius);
  }
  
  public CelestialBody(float radius, float distance, float speed) {
    this.radius = radius;
    this.distance = distance;
    angle = random(TWO_PI);
    this.speed = speed;
    noStroke();
    noFill();
    shape = createShape(SPHERE, radius);
  }
  
  public List<CelestialBody> getMoons() {
    return moons;
  }
  
  private void move(long deltaTime) {
    angle += speed * deltaTime;
   }
   
   public void show(long deltaTime) {
    pushMatrix();
    noStroke();
    fill(255);
    rotate(angle);
    translate(distance, 0);
    shape(shape);
    if (moons != null) {
    for (CelestialBody moon : moons) {
      moon.show(deltaTime);
      moon.move(deltaTime);
    } 
   }
   popMatrix();
  }

}


class TexturedCelestialBody extends CelestialBody {
    
  protected PImage img;
  
  public TexturedCelestialBody(float radius, float distance, float speed, List<CelestialBody> moons, String imgName) {
    super(radius, distance, speed, moons);
    img = loadImage(imgName);
    shape.setTexture(img);
  }
  
  public TexturedCelestialBody(float radius, float distance, float speed, String imgName) {
    super(radius, distance, speed);
    img = loadImage(imgName);
    shape.setTexture(img);
  }

}
