//================================================================

abstract class CameraController
{
    private final Cam cam;

    public final PVector up  = new PVector(0, 0, 0);
    public final PVector cen = new PVector(0, 0, 0);
    public final PVector pos = new PVector(0, 0, 0);

    //temp vector
    protected final PVector moveDir = new PVector(0, 0, 0);

    public float spd = 5.0f;
    public float mov = 1.0f;
    public float rot = 0.05f;
    public float zoomp = 0.05f;
    public float zoom  = 1.7f;


    protected boolean shiftKey  = false;
    protected boolean strgKey   = false;
    protected boolean altKey    = false;
    protected boolean leftKey   = false;
    protected boolean upKey     = false;
    protected boolean downKey   = false;
    protected boolean rightKey  = false;



    public float wheel = 0;

    public CameraController(Cam cam)
    {
        this.cam = cam;
        setDefaults();
        apply();
    }

    public CameraController(Cam cam, PVector up, PVector cen, PVector pos)
    {
        this.cam = cam;
        setDefaults();
        this.up.set(up);
        this.cen.set(cen);
        this.pos.set(pos);
        apply();
    }

    public final void update()
    {
        systemKeys();
        updateKeys();
        updateMouse();
        updateValues();
        cam.set();
    }

    public void setDefaults()
    {
        throw new Error("Invalid call to an abstract method.");
    }

    /** sets the systemkeys, required for shortcut and combos **/
    protected void systemKeys()
    {
        if (keyPressed)
        {
            shiftKey = keyCode == SHIFT   ? true : false;
            altKey   = keyCode == ALT     ? true : false;
            strgKey  = keyCode == CONTROL ? true : false;
            leftKey  = keyCode == LEFT    ? true : false;
            upKey    = keyCode == UP      ? true : false;
            downKey  = keyCode == DOWN    ? true : false;
            rightKey = keyCode == RIGHT   ? true : false;
        }
    }

    //TODO hook on keyevent
    protected void updateKeys()
    {
        throw new Error("Invalid call to an abstract method.");
    }

    //TODO hook on mouseevent
    protected void updateMouse()
    {
        throw new Error("Invalid call to an abstract method");
    }

    //TODO call on values changed
    protected void updateValues()
    {
        up.set(cam.getUp());
        pos.set(cam.getPos());
        cen.set(cam.getTarget());
    }

    public void apply()
    {
        cam.setUp(up);
        cam.setPos(pos);
        cam.lookAt(cen);
    }
}