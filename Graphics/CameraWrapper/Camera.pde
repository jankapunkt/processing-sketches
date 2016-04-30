
//================================================================
//
//  CAM Class
//
//================================================================

/** 
 Represents the camera with it's vectors and actions. 
 **/
class Cam
{
    //-------------------------------------------------------------
    //base vectors
    private final PVector upVec = new PVector(0.0f, -1.0f, 0.0f); //y is upwards, it is -1 because processing has negative y by default
    private final PVector cenVec = new PVector(0, 0, 0);
    private final PVector eyeVec = new PVector(70.0f, 65.0f, 120.0f); 

    //rotation vectors
    private final PVector u = new PVector(0, 0, 0);
    private final PVector q1 = new PVector(0, 0, 0);
    private final PVector q2 = new PVector(0, 0, 0);

    //buffer vector
    private final PVector tmp = new PVector(0, 0, 0);

    //-------------------------------------------------------------
    //for orthographic
    private float fov = PI/3.0;
    private float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));

    public static final int MODE_PERSPECTIVE = 0;
    public static final int MODE_ORTHO = 1;

    private int cameraMode = 0;


    //-------------------------------------------------------------
    //CONSTRUCTOR
    //-------------------------------------------------------------

    /** sets a new camera() with the default values of the final vectors **/
    public Cam()
    {
        this.set();
    }

    //-------------------------------------------------------------
    //UPDATE OPENGL CAMERA SETTINGS
    //-------------------------------------------------------------


    /** updates the current camera settings **/
    public void set()
    {
        camera(eyeVec.x, eyeVec.y, eyeVec.z, cenVec.x, cenVec.y, cenVec.z, 0, -1, 0);
    }

    public void setMode(int cameraMode)
    {
        this.cameraMode = cameraMode;
        if (this.cameraMode == MODE_PERSPECTIVE)
            perspective();

        if (this.cameraMode == MODE_ORTHO)
            ortho();
    }

    public int getMode()
    {
        return cameraMode;
    }

    //-------------------------------------------------------------
    //POSITION AND DIRECTION
    //-------------------------------------------------------------


    /** sets the up vector **/
    public void setUp(PVector up)
    {
        upVec.set(up);
    }

    /** gets the up vector **/
    public PVector getUp()
    {
        return upVec.copy();
    }

    /** gets the current right vector **/
    public PVector getRight()
    {
        return PVector.sub(cenVec, eyeVec).cross(upVec).normalize();
    }

    /** gets the current left vector **/
    public PVector getLeft()
    {
        return PVector.sub(eyeVec, cenVec).cross(upVec).normalize();
    }

    /** looks towards a given vector. Don't confuse with gluLookAt **/
    public void lookAt(PVector target)
    {
        cenVec.set(target);
    }

    /** returns the current center of the scene **/
    public PVector getTarget()
    {
        return cenVec.copy();
    }

    /** gets the normalized direction from the camera position to
     *  the center of the scene **/
    public PVector getDir()
    {
        return getDirUnnormal().normalize();
    }

    /** returns an unnormalized direction **/
    public PVector getDirUnnormal()
    {
        return PVector.sub(cenVec, eyeVec);
    }

    /** sets the current position of the camera **/
    public void setPos(PVector pos)
    {
        eyeVec.set(pos);
    }

    /** gets a copy of the current position of the camera **/
    public PVector getPos()
    {
        return eyeVec.copy();
    }


    //-------------------------------------------------------------
    //MOVE CAMERA
    //-------------------------------------------------------------


    /** moves the camera into given direction along the target axis 
     *  if target is null he current center of the scene will be used **/
    public void move(PVector dir, PVector target)
    {
        if (target!=null)lookAt(target);
        eyeVec.add(dir);
    }

    /** moves the camera relative to it's position **/
    public void move(PVector dir)
    {
        eyeVec.add(dir);
    }

    /** moves the camera relative to it's position **/
    public void move(float x, float y, float z)
    {
        eyeVec.add(x, y, z);
    }

    //-------------------------------------------------------------
    //ROTATE CAMERA
    //-------------------------------------------------------------

    /** rotates the camera around it's own x axis **/
    public void rotX(float r)
    {
        float newy = cenVec.y - eyeVec.y;
        float newz = cenVec.z - eyeVec.z;
        float q = TWO_PI * r;
        cenVec.set( cenVec.x, 
            eyeVec.y + newy * cos(q) - newz * sin(q), 
            eyeVec.z + newy * sin(q) + newz * cos(q));
    }

    /** rotates the camera around it's own x axis **/
    public void rotY(float r)
    {
        float q = TWO_PI * r;      
        float newx = cenVec.x - eyeVec.x;
        float newz = cenVec.z - eyeVec.z;
        cenVec.set( eyeVec.x + newx*cos(q) - newz * sin(q), 
            cenVec.y, 
            eyeVec.z + newx*sin(q) + newz * cos(q) );
        //PVectorUtils.rotY(upVec, r);
    }

    public void rotZ(float r)
    {
        float newx = cenVec.x - eyeVec.x;
        float newy = cenVec.y - eyeVec.y;
        float q = TWO_PI * r;
        cenVec.set( eyeVec.x + newx * cos(q) - newy * sin(q), 
            eyeVec.y + newx * sin(q) + newy * cos(q), 
            cenVec.z);
    }

    /** rotates the camera around the center on the Y axis **/
    public void rotYAround(float r)
    {
        rotYAround(r, cenVec);
    }

    /** rotates the camera around the center on the X axis **/
    public void rotXAround(float r)
    {
        rotXAround(r, cenVec);
    }

    /** rotates the camera around the center on the Z axis **/
    public void rotZAround(float r)
    {
        rotZAround(r, cenVec);
    }

    /** 
     * rotates the camera around the point on the x axis 
     x' = x
     y' = y*cos q - z*sin q
     z' = y*sin q + z*cos q
     **/
    public void rotXAround(float r, PVector point)
    {
        float newy = eyeVec.y - point.y;
        float newz = eyeVec.z - point.z;
        float q = TWO_PI * r;
        eyeVec.set( eyeVec.x, 
            point.y + newy * cos(q) - newz * sin(q), 
            point.z + newy * sin(q) + newz * cos(q));
    }

    /** rotates the camera around a given point on the y axis 
     
     z' = z*cos q - x*sin q
     x' = z*sin q + x*cos q
     y' = y
     **/
    public void rotYAround(float r, PVector point)
    {
        float newx = eyeVec.x - point.x;
        float newz = eyeVec.z - point.z;
        float q = TWO_PI * r;
        eyeVec.set( point.x + newx*cos(q) - newz*sin(q), 
            eyeVec.y, 
            point.z + newx*sin(q) + newz*cos(q) );
    }

    /** rotates the camera around the center on the z axis 
     x' = x*cos q - y*sin q
     y' = x*sin q + y*cos q
     z' = z 
     **/
    public void rotZAround(float r, PVector point)
    {
        float newx = eyeVec.x - point.x;
        float newy = eyeVec.y - point.y;
        float q = TWO_PI * r;
        eyeVec.set( point.x + newx * cos(q) - newy * sin(q), 
            point.y + newx * sin(q) + newy * cos(q), 
            eyeVec.z);
    }


    /* Rotates the camera around given point by a given axis and angle */
    public void rotAround(PVector target, PVector axis, float angle)
    {
        eyeVec.set(rotAny(eyeVec, TWO_PI * angle, target, axis));
    }

    /* Rotates the camera around itself by a given axis and angle */
    public void rotAroundItself(PVector axis, float angle)
    {
        tmp.set(PVector.add(eyeVec, axis));
        cenVec.set(rotAny(cenVec, TWO_PI * angle, eyeVec, tmp));
    }


    /** 
     All the credits for this function go to paul bourke: http://paulbourke.net/geometry/rotate/ 
     Rotates a vector P around a given axis (of two points P1 and P2) by theta.
     **/
    private PVector rotAny(PVector p, float theta, PVector p1, PVector p2)
    {
        u.set(0, 0, 0);
        q1.set(0, 0, 0);
        q2.set(0, 0, 0);

        float d;

        /* Step 1 */
        q1.x = p.x - p1.x;
        q1.y = p.y - p1.y;
        q1.z = p.z - p1.z;

        u.x = p2.x - p1.x;
        u.y = p2.y - p1.y;
        u.z = p2.z - p1.z;
        u.normalize();
        d = sqrt(u.y*u.y + u.z*u.z);

        /* Step 2 */
        if (d != 0) {
            q2.x = q1.x;
            q2.y = q1.y * u.z / d - q1.z * u.y / d;
            q2.z = q1.y * u.y / d + q1.z * u.z / d;
        } else {
            q2.set(q1);
        }

        /* Step 3 */
        q1.x = q2.x * d - q2.z * u.x;
        q1.y = q2.y;
        q1.z = q2.x * u.x + q2.z * d;

        /* Step 4 */
        q2.x = q1.x * cos(theta) - q1.y * sin(theta);
        q2.y = q1.x * sin(theta) + q1.y * cos(theta);
        q2.z = q1.z;

        /* Inverse of step 3 */
        q1.x =   q2.x * d + q2.z * u.x;
        q1.y =   q2.y;
        q1.z = - q2.x * u.x + q2.z * d;

        /* Inverse of step 2 */
        if (d != 0) {
            q2.x =   q1.x;
            q2.y =   q1.y * u.z / d + q1.z * u.y / d;
            q2.z = - q1.y * u.y / d + q1.z * u.z / d;
        } else {
            q2.set(q1);
        }

        /* Inverse of step 1 */
        q1.x = q2.x + p1.x;
        q1.y = q2.y + p1.y;
        q1.z = q2.z + p1.z;
        return(q1);
    }

    //-------------------------------------------------------------
    //ZOOM / PERSPECTIVE / FRUSTUM
    //-------------------------------------------------------------  

    /** zooms by position towards the center but keeps the perspective **/
    public void zoom(float z)
    {
        eyeVec.add(getDir().mult(z));
    }

    /** zooms the perspective but keeps the position **/
    public void zoomP(float z)
    {
        perspective(fov+=z, (width/height), cameraZ/10.0, cameraZ*10.0);
    }

    /** zooms in orthographic perspective **/
    public void zoomO(float z)
    {
        ortho();
    }


    //-------------------------------------------------------------
    //DEBUG
    //-------------------------------------------------------------

    public void printDebug()
    {
    }


    public void drawDebug(boolean drawxyz, boolean drawLeftUp)
    {
        if (!drawxyz && !drawLeftUp)
            return;

        pushMatrix();
        translate(cenVec.x, cenVec.y, cenVec.z);
        if (drawxyz)
        {
            stroke(255, 0, 0);
            line(-100, 0, 0, 100, 0, 0);
            stroke(0, 255, 0);
            line(0, -100, 0, 0, 100, 0);
            stroke(0, 0, 255);
            line(0, 0, -100, 0, 0, 100);
        }
        if (drawLeftUp)
        {
            tmp.set( getRight().mult(50) );
            stroke(0, 255, 255);
            line(-upVec.x*100, -upVec.y*100, -upVec.z*100, upVec.x*100, upVec.y*100, upVec.z*100);
            stroke(255, 0, 255);
            line(0, 0, 0, tmp.x, tmp.y, tmp.z);
        }

        popMatrix();
    }
}