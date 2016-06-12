
public CameraController controller;
public Cam cam;

public PVector[] boxes;

public PFont font;

public MessageManager messages;

//-----------------------------------------------------------//

void setup()
{
    //create env
    size(1200, 600, P3D);
    smooth();
    noCursor();

    //runTestCamera();
    

    //create camera and control
    cam = new Cam();
    controller = new ThirdPersonCameraController(cam);

    //text and font
    font = createFont("Dialog.plain-48.wlv", 48);
    textFont(font);
    messages = new MessageManager(font,280, cam);
    
    //create some positions
    boxes = new PVector[25];
    for (int i=0; i<25; i++)
    {
        boxes[i] = new PVector(-(i*80) + random(0,150), 0, -(i*80) + random(0,150));
    }
    messages.add("Setup complete");
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
    
     // 3D code
 
    hint(DISABLE_DEPTH_TEST);
    camera();
    noLights();
    messages.display();
    hint(ENABLE_DEPTH_TEST);
}

//-----------------------------------------------------------//

public void drawDebug()
{
    println(controller.getClass());
    println(frameRate);
}