
public void runTestCamera()
{
    Cam cam = new Cam();
    testCamera_set(cam);
    testCamera_setMode(cam);
    testCamera_getMode(cam);
    testCamera_setUp(cam);
    testCamera_getUp(cam);
    testCamera_getRight(cam);
    testCamera_getLeft(cam);
    testCamera_lookAt(cam);
    testCamera_getTarget(cam);
    testCamera_getDir(cam);
    testCamera_getDirUnnormal(cam);
    testCamera_setPos(cam);
    testCamera_getPos(cam);
}

/** updates the current camera settings **/
public void testCamera_set(Cam cam)
{
}

public void testCamera_setMode(Cam cam)
{
}

public void testCamera_getMode(Cam cam)
{
}

//-------------------------------------------------------------
//POSITION AND DIRECTION
//-------------------------------------------------------------


/** sets the up vector **/
public void testCamera_setUp(Cam cam)
{
}

/** gets the up vector **/
public void testCamera_getUp(Cam cam)
{
}

/** gets the current right vector **/
public void testCamera_getRight(Cam cam)
{
}

/** gets the current left vector **/
public void testCamera_getLeft(Cam cam)
{
}

/** looks towards a given vector. Don't confuse with gluLookAt **/
public void testCamera_lookAt(Cam cam)
{
}

/** returns the current center of the scene **/
public void testCamera_getTarget(Cam cam)
{
}

/** gets the normalized direction from the camera position to
 *  the center of the scene **/
public void testCamera_getDir(Cam cam)
{
}

/** returns an unnormalized direction **/
public void testCamera_getDirUnnormal(Cam cam)
{
}

/** sets the current position of the camera **/
public void testCamera_setPos(Cam cam)
{
}

/** gets a copy of the current position of the camera **/
public void testCamera_getPos(Cam cam)
{
}


//-------------------------------------------------------------
//MOVE CAMERA
//-------------------------------------------------------------


/** moves the camera into given direction along the target axis 
 *  if target is null he current center of the scene will be used **/
public void testCamera_move1(Cam cam)
{
}

/** moves the camera relative to it's position **/
public void testCamera_move2(Cam cam)
{
}

/** moves the camera relative to it's position **/
public void testCamera_move3(Cam cam)
{
}

//-------------------------------------------------------------
//ROTATE CAMERA
//-------------------------------------------------------------

/** rotates the camera around it's own x axis **/
public void testCamera_rotX(Cam cam)
{
}

/** rotates the camera around it's own x axis **/
public void testCamera_rotY(Cam cam)
{
}

public void testCamera_rotZ(Cam cam)
{
}

/** rotates the camera around the center on the Y axis **/
public void testCamera_rotYAround1(Cam cam)
{
}

/** rotates the camera around the center on the X axis **/
public void testCamera_rotXAround1(Cam cam)
{
}

/** rotates the camera around the center on the Z axis **/
public void testCamera_rotZAround1(Cam cam)
{
}

/** 
 * rotates the camera around the point on the x axis 
 x' = x
 y' = y*cos q - z*sin q
 z' = y*sin q + z*cos q
 **/
public void testCamera_rotXAround2(Cam cam)
{
}

/** rotates the camera around a given point on the y axis 
 
 z' = z*cos q - x*sin q
 x' = z*sin q + x*cos q
 y' = y
 **/
public void testCamera_rotYAround2(Cam cam)
{
}

/** rotates the camera around the center on the z axis 
 x' = x*cos q - y*sin q
 y' = x*sin q + y*cos q
 z' = z 
 **/
public void testCamera_rotZAround2(Cam cam)
{
}


/* Rotates the camera around given point by a given axis and angle */
public void testCamera_rotAround(Cam cam)
{
}

/* Rotates the camera around itself by a given axis and angle */
public void testCamera_rotAroundItself(Cam cam)
{
}


//-------------------------------------------------------------
//ZOOM / PERSPECTIVE / FRUSTUM
//-------------------------------------------------------------  

/** zooms by position towards the center but keeps the perspective **/
public void testCamera_zoom(Cam cam)
{
}

/** zooms the perspective but keeps the position **/
public void testCamera_zoomP(Cam cam)
{
}

/** zooms in orthographic perspective **/
public void testCamera_zoomO(Cam cam)
{
}