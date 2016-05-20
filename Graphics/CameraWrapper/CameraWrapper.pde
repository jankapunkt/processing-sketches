
public CameraController controller;
public Cam cam;

public PVector[] boxes;

public PFont font;

public final int WIDTH  = 1200;
public final int HEIGHT = 600;

public final int XCENTER = WIDTH/2;
public final int YCENTER = HEIGHT/2;


//-----------------------------------------------------------//

void setup()
{
    //create env
    size(1200, 600, P3D);
    smooth();
    noCursor();

    //create camera and control
    cam = new Cam();
    controller = new ThirdPersonCameraController(cam);

    //text and font
    font = createFont("Dialog.plain-48.wlv", 48);
    textFont(font);

    //create some positions
    boxes = new PVector[25];
    for (int i=0; i<25; i++)
    {
        boxes[i] = new PVector(-(i*80) + random(0,150), 0, -(i*80) + random(0,150));
    }
}

//-----------------------------------------------------------//

void draw()
{

    background(180);
    //drawDebug();
    //update
    controller.update();

    //draws
    cam.drawDebug(drawCamPos, drawCamUpLeft);
    
    fill(200, 49, 30);
    stroke(200);

    for (int i=0; i<25; i++)
    {
        pushMatrix();
        translate(boxes[i].x, boxes[i].y, boxes[i].z);
        fill(100+10*i, 100, 150+13*i);
        box(20, 20, 20);
        popMatrix();
    }
}

//-----------------------------------------------------------//

public void drawDebug()
{
    println(controller.getClass());
    println(frameRate);
}