import java.awt.event.KeyEvent;

class Spaceship {

  private PVector pos;
  private PVector fwd = new PVector(1, 0);
  private PShape shape;
  private PShape secondaryShape;
  private int movingFwd;
  private int rotatingZ;
  private float currentZRot = 0;
  private int movingZ;
  
  public Spaceship() {
    pos = new PVector(-width/2, -height/2, 0);
    shape = createShape(BOX, 20, 20, 20);
    secondaryShape = createShape(BOX, 10, 10, 50);
    secondaryShape.rotateY(radians(90));
   }
  
  public void show(long deltaTime) {
    pushMatrix();
    float prevZRot = currentZRot;
    currentZRot += rotatingZ * deltaTime * 0.5;
    float deltaRot = radians(currentZRot) - radians(prevZRot);
    pos.x += movingFwd * fwd.x * deltaTime * 0.1;
    pos.y += movingFwd * fwd.y * deltaTime * 0.1;
    pos.z += movingZ * deltaTime * 0.1;
    translate(pos.x, pos.y, pos.z);
    fwd.rotate(deltaRot);
    rotateZ(radians(currentZRot));
    shape(shape);
    shape(secondaryShape);
    popMatrix();
  }
  
  public void keyPressed(int keyCode) {
    if (key == CODED) {
      switch (keyCode) {
        case UP:
          movingFwd = 1;
          break;
        
        case DOWN:
          movingFwd = -1;
          break;
        
        case RIGHT:
         rotatingZ = 1;
         break;
        
        case LEFT:
         rotatingZ = -1;
         break;
        
        case SHIFT:
         movingZ = 1;
         break;
        case ALT:
         movingZ = -1;
         break;
      }
    }
  }
  
  public void keyReleased(int keyCode) {
    if (key == CODED) {
      switch (keyCode) {
        case UP:
          movingFwd = 0;
          break;
        case DOWN:
          movingFwd = 0;
          break;
        case RIGHT:
         rotatingZ = 0;
         break;
        case LEFT:
         rotatingZ = 0;
         break;
        case SHIFT:
         movingZ = 0;
         break;
        case ALT:
         movingZ = 0;
         break; 
      }
    }
  }
  
  public void mouseMoved(double xDelta, double yDelta) {
    pos.x += xDelta;
    pos.y += yDelta;
  }
 
}
