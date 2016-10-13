//================================================================

class IconosphericCameraController extends CameraController
{
    protected float mouse_threshold;
    
    protected final PVector mouseDir = new PVector(0,0,0);
  
    public IconosphericCameraController(Cam cam)
    {
        super(cam);
    }

    public IconosphericCameraController(Cam cam, PVector up, PVector cen, PVector pos)
    {
        super(cam, up, cen, pos);
        
    }

    @Override
    public void setDefaults()
    {
        cursor(HAND); //display cursor in iconospheric view
        
        //set default vectors
        this.up.set(cam.getUp());
        this.cen.set(cam.getTarget());
        this.pos.set(cam.getPos());

        //detault speed values
        rot=0.005f;
        zoom=0.8f;
        zoomp = 0.08f;
        mouse_threshold = 50;
        cam.setMode(Cam.MODE_PERSPECTIVE);
        
        cursor(HAND);
    }

    @Override
    public void updateKeys()
    {
      
    }

    @Override
    public void updateMouse()
    {
        if (mouseButton == LEFT)
        {
            noCursor();
            float dx = (pmouseX-mouseX)*rot;
            //float dy = (pmouseY-mouseY)*rot;
            //cam.rotAround(cam.getTarget(), cam.getRight(), dx);
            cam.rotYAround(dx);
          
        }else{
            cursor();
            //move on mousex pos
            
            float cdx = -(mouseX - XCENTER)/100;
            float cdz =  (mouseY - YCENTER)/100;
            
            println(cdx+" "+cdz);
            mouseDir.set(cdx, 0, cdz);
            mouseDir.normalize();
            mouseDir.mult(5);
            cam.move(mouseDir);
            cam.lookAt(cam.getTarget().add(mouseDir));
            
        }
    }
}