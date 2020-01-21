import java.util.List;

abstract class CelestialBody {
  protected float radius;
  protected float angle;
  protected float distance;
  protected float speed; 
  protected List<CelestialBody> moons;
  protected PShape shape;
  protected float rotAng;
  
  public CelestialBody(float radius, float distance, float speed, List<CelestialBody> moons) {
    this.radius = radius;
    this.distance = distance;
    angle = random(TWO_PI);
    this.speed = speed;
    this.moons = moons;
    this.rotAng = random(0, PI/8);
    noStroke();
   }
  
  public CelestialBody(float radius, float distance, float speed) {
    this.radius = radius;
    this.distance = distance;
    angle = random(TWO_PI);
    this.speed = speed;
    this.rotAng = random(0, PI/8);
    noStroke();
  }
  
  public List<CelestialBody> getMoons() {
    return moons;
  }
  
  private void move(long deltaTime) {
    angle += speed * deltaTime;
   }
   public void show(long deltaTime) {
    pushMatrix();
    rotateY(rotAng);
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


class ImportedCelestialBody extends CelestialBody {
   public ImportedCelestialBody(float radius, float distance, float speed, List<CelestialBody> moons, String modelName) {
    super(radius, distance, speed, moons);
    noFill();
    shape = loadShape(modelName);
    shape.scale(0.01);
  }
  
  public ImportedCelestialBody(float radius, float distance, float speed, String modelName) {
    super(radius, distance, speed);
    noFill();
    shape = loadShape(modelName);
    shape.scale(0.01);
  }
}


class ColouredCelestialBody extends CelestialBody {
   public ColouredCelestialBody(float radius, float distance, float speed, List<CelestialBody> moons, int r, int g, int b) {
    super(radius, distance, speed, moons);
    fill(r,g,b);
    shape = createShape(SPHERE, radius);
   }
  
  public ColouredCelestialBody(float radius, float distance, float speed, int r, int g, int b) {
    super(radius, distance, speed);
    fill(r,g,b);
    shape = createShape(SPHERE, radius);
   }
   
   @Override
   public void show(long deltaTime) {
    pushMatrix();
    rotateY(rotAng);
    rotate(angle);
    translate(distance, 0);
    specular(255, 255, 255);
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
    noFill();
    shape = createShape(SPHERE, radius);
    shape.setTexture(img);
  }
  
  public TexturedCelestialBody(float radius, float distance, float speed, String imgName) {
    super(radius, distance, speed);
    noFill();
    img = loadImage(imgName);
    shape = createShape(SPHERE, radius);
    shape.setTexture(img);
  }
}

class ShiningCelestialBody extends TexturedCelestialBody {
public ShiningCelestialBody(float radius, float distance, float speed, List<CelestialBody> moons, String imgName) {
    super(radius, distance, speed, moons, imgName);
  }
  
  public ShiningCelestialBody(float radius, float distance, float speed, String imgName) {
    super(radius, distance, speed, imgName);
  }

  @Override
  public void show(long deltaTime) {
    pushMatrix();
    rotateY(rotAng);
    rotate(angle);
    translate(distance, 0);
    spotLight(255, 0, 0, 0, 0, 0, -1, 0, 0, PI/2, 2);
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


class Star extends TexturedCelestialBody {
    
  public Star(float radius, float distance, float speed, List<CelestialBody> moons, String imgName) {
    super(radius, distance, speed, moons, imgName);
  }
  
  public Star(float radius, float distance, float speed, String imgName) {
    super(radius, distance, speed, imgName);
  }
  
   @Override
   public void show(long deltaTime) {
    pushMatrix();
    rotateY(rotAng);
    rotate(angle);
    translate(distance, 0);
    emissive(255, 255, 255);
    shape(shape);
    pointLight(255, 255, 255, 0, 0, 0);
    directionalLight(0, 0, 255, 0, -100, 0);
    if (moons != null) {
    for (CelestialBody moon : moons) {
      moon.show(deltaTime);
      moon.move(deltaTime);
    } 
   }
   popMatrix();
  }

}
