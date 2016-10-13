//================================================================

class OrthographicCameraController extends CameraController
{
    public OrthographicCameraController(Cam cam)
    {
        super(cam);
    }

    public OrthographicCameraController(Cam cam, PVector up, PVector cen, PVector pos)
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
        rot=0.005f;
        zoom=0.8f;
        zoomp = 0.08f;
        cam.setMode(Cam.MODE_ORTHO);
    }

    @Override
    public void updateKeys(){}

    @Override
    public void updateMouse(){}
}