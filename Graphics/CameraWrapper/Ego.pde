//================================================================

class EgoCameraController extends CameraController
{

    private final PVector right = new PVector(0, 0, 0);


    public EgoCameraController(Cam cam)
    {
        super(cam);
    }

    public EgoCameraController(Cam cam, PVector up, PVector cen, PVector pos)
    {
        super(cam, up, cen, pos);
    }

    @Override
    public void setDefaults()
    {
        noCursor();
        //set default vectors
        this.up.set(cam.getUp());
        this.cen.set(cam.getTarget());
        this.pos.set(cam.getPos());

        //detault speed values
        rot=0.001f;
        zoom=0.8f;
        zoomp = 0.08f;
        cam.setMode(Cam.MODE_PERSPECTIVE);
    }

    @Override
        public void updateKeys()
    {
        if (!keyPressed)return;
        moveDir.set(0, 0, 0);
        switch(key)
        {
        case '+':
            cam.zoomP(-zoomp);
            break;
        case '-':
            cam.zoomP(zoomp);
            break;
        case 'w':
            moveDir.set(cam.getDir().mult(spd));
            cam.move(moveDir);
            cam.lookAt(cam.getTarget().add(moveDir));
            break;
        case 's':
            moveDir.set(cam.getDir().mult(-spd));
            cam.move(moveDir);
            cam.lookAt(cam.getTarget().add(moveDir));
            break;
        case 'a':
            moveDir.set(cam.getDir());
            moveDir.set(moveDir.cross(new PVector(0, 1, 0))).mult(spd);
            cam.move(moveDir);
            moveDir.y = 0;
            cam.lookAt(cam.getTarget().add(moveDir));
            break;
        case 'd':
            moveDir.set(cam.getDir());
            moveDir.set(moveDir.cross(new PVector(0, 1, 0))).mult(-spd);
            moveDir.y = 0;
            cam.move(moveDir);
            cam.lookAt(cam.getTarget().add(moveDir));
            break;
        }
    }

    @Override
        public void updateMouse()
    {
        if (mousePressed && mouseButton == LEFT)
        {
            float angley = (pmouseY - mouseY) * rot;
            float anglex = (pmouseX - mouseX) * rot;
            cam.rotAroundItself(cam.getRight(), -angley);
            cam.rotY(anglex);
        }
    }
}