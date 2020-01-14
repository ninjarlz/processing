import java.awt.event.KeyEvent;
class Spaceship {

  
  private PVector pos;
  private PShape shape;
  private int movingX;
  private int movingY;
  private int movingZ;
  
  public Spaceship() {
    pos = new PVector(-width/2, -height/2, 0);
    shape = loadShape("SpaceShip.obj");
    shape.scale(10);
    shape.rotateX(radians(90));
  }
  
  public void show(long deltaTime) {
    pushMatrix();
    pos.x += movingX * deltaTime;
    pos.y += movingY * deltaTime;
    pos.z += movingZ * deltaTime;
    translate(pos.x, pos.y, pos.z);
    shape(shape);
    popMatrix();
  }
  
  public void keyPressed(int keyCode) {
    if (key == CODED) {
      switch (keyCode) {
        case UP:
          movingY = -1;
          break;
         case DOWN:
          movingY = 1;
          break;
        case RIGHT:
         movingX = 1;
         break;
        case LEFT:
         movingX = -1;
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
          movingY = 0;
          break;
        case DOWN:
          movingY = 0;
          break;
        case RIGHT:
         movingX = 0;
         break;
        case LEFT:
         movingX = 0;
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
