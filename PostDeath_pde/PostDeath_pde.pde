import processing.video.*;

Capture cam;
CameraController camController;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, width, height, cameras[0], 30);
    cam.start(); 
    
    camController = new CameraController(cam);

  }
}

void draw() {
  background(0);
  camController.show();
}

void captureEvent(Capture c) {
  c.read();
}
