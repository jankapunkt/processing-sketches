//================================================================

/**
 * Provides a third person view control for the camera.
 **/
class ThirdPersonCameraController extends CameraController
{
    public ThirdPersonCameraController(Cam cam)
    {
        super(cam);
    }

    public ThirdPersonCameraController(Cam cam, PVector up, PVector cen, PVector pos)
    {
        super(cam, up, cen, pos);
    }

    @Override
    public void setDefaults()
    {
        noCursor();
        //set default vectors
        this.up.set(0.0f, -1.0f, 0.0f);
        this.cen.set(cam.getTarget());
        this.pos.set(70.0f, 35.0f, 120.0f);

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
        float angl;
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
            moveDir.y = 0;
            cam.move(moveDir);
            cam.lookAt(cam.getTarget().add(moveDir));
            break;
        case 's':
            moveDir.set(cam.getDir().mult(-spd));
            moveDir.y = 0;
            cam.move(moveDir);
            cam.lookAt(cam.getTarget().add(moveDir));
            break;
        case 'a':
            moveDir.set(cam.getDir());
            moveDir.set(moveDir.cross(new PVector(0, 1, 0))).mult(spd);
            moveDir.y = 0;
            cam.move(moveDir);
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

        switch(keyCode)
        {
        case 129:
            this.pos.set(150.0f, 150.0f, 150.0f);
            apply();
            break;
        case 130:
            this.pos.set(0.1f, 0.0f, 100.0f);
            apply();
            break;
        case 131:
            this.pos.set(100.0f, 0.0f, 0.1f);
            apply();
            break;
        case 132:
            this.pos.set(0.1f, 150.0f, 0.0f);
            apply();
            break;
        }
    }

    @Override
    public void updateMouse()
    {
        if ((wheel==0 && !mousePressed) || pmouseX-mouseX == 0)
            return;

        if (wheel != 0)
        {
            cam.zoom(wheel);
            wheel = 0;
        }

        if (mouseButton == LEFT)
        {
            float dx = (pmouseX-mouseX)*rot;
            float dy = (pmouseY-mouseY)*rot;
            cam.rotAroundRight(dy);
            cam.rotYAround(dx);
        }

        if (mouseButton == RIGHT)
        {
            cam.rotZAround((pmouseX-mouseX)*rot);
        }
    }
}