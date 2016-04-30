//===========================================================//
//
//    UI - input handling, gui drawing and stuff...
//
//===========================================================//

public boolean drawCamPos=false;
public boolean drawCamUpLeft = false;


//-----------------------------------------------------------//




//-----------------------------------------------------------//

void mouseWheel(MouseEvent event) { //TODO wrap into camera controller
    float e = event.getCount();
    cam.zoom(e*5);
}

//-----------------------------------------------------------//

void keyPressed() {
    switch (keyCode)
    {
    case 49:
        if (!(controller instanceof ThirdPersonCameraController))
        {
            controller = new ThirdPersonCameraController(cam, controller.up, controller.cen, controller.pos);
        }
        break;
    case 50:
        if (!(controller instanceof EgoCameraController))
        {
            controller = new EgoCameraController(cam, controller.up, controller.cen, controller.pos);
        }
        break;
    case 51:
        if (!(controller instanceof IconosphericCameraController))
        {
            controller = new IconosphericCameraController(cam, controller.up, controller.cen, controller.pos);
        }
        break;
    case 52:
        if (!(controller instanceof OrthographicCameraController))
        {
            controller = new OrthographicCameraController(cam, controller.up, controller.cen, controller.pos);
        }
        break;  
    case 57:
        drawCamUpLeft = !drawCamUpLeft;
    break;
    case 56:
        drawCamPos = !drawCamPos;
    break;
    }
}