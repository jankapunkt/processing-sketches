import java.util.List;

//===========================================================//
//
//    UI - input handling, gui drawing and stuff...
//
//===========================================================//

public boolean drawCamPos=false;
public boolean drawCamUpLeft = false;


//-----------------------------------------------------------//



class MessageManager
{
    private final List<Message> _messages = new ArrayList<Message>();
    private PFont font;
    private int _time;
    private Cam cam;
    private final PVector tmp = new PVector(0,0,0);
    private float x,y,z;
      
    public MessageManager(PFont font, int defaultTime, Cam cam)
    {
       setFont(font);
       this._time = defaultTime;
       this.cam = cam;
    }
    
    public void setFont(PFont font)
    {
        this.font = font;
    }
    
    public void add(String text) 
    {
        _messages.add(new Message(text, _time , 0,0,0,font));
    }
    
    public void display()
    {
        int size = _messages.size();
        if (size <= 0)
            return;
        
        hint(DISABLE_DEPTH_TEST);
        camera();
        noLights();
         
        for (int i = size-1; i>=0;i--)
        {
           
            Message m = _messages.get(i);
            if (m.isDead)
            {
                m.dispose();
                _messages.remove(i);
                continue;
            }
            println(size+" "+i+" "+m.timer);
            m.update();
            m.display(20,50 + i*14);
        }
        hint(ENABLE_DEPTH_TEST);
    }
}


class Message
{
     private String text;
     public int timer;
     private int r, g, b;
     private PFont font;
     
     public boolean isDead = false;
     
     public Message(String text, int timer, int r, int g, int b, PFont font)
     {
         this.font = font;
         this.text = text;
         this.timer = timer;
         this.r = r;
         this.g = g;
         this.b = b;
     }
     
     public void dispose()
     {
          this.font = null;   
     }
     
     public void update()
     {
          timer--;
          if (timer == 0)
              this.isDead = true;
     }
     
     public void display(float x, float y)
     {
         pushMatrix();
             translate(x,y);
             textFont(font, 12);
             fill(r,g,b,timer);
             text(this.text,0,0);
         popMatrix();
     }
}

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
            messages.add("Third Person mode activated");
        }
        break;
    case 50:
        if (!(controller instanceof EgoCameraController))
        {
            controller = new EgoCameraController(cam, controller.up, controller.cen, controller.pos);
            messages.add("First Person mode activated");
        }
        break;
    case 51:
        if (!(controller instanceof IconosphericCameraController))
        {
            controller = new IconosphericCameraController(cam, controller.up, controller.cen, controller.pos);
            messages.add("Iconospheric Person mode activated");
        }
        break;
    case 52:
        if (!(controller instanceof OrthographicCameraController))
        {
            controller = new OrthographicCameraController(cam, controller.up, controller.cen, controller.pos);
            messages.add("Orthographic mode activated");
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