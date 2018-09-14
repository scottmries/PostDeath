import processing.video.*;

//clips
Capture cam;
Lightning lightning;
Stripes stripes;

//controllers
CreditsController creditsController;
SongLyricsController songLyricsController;
CameraController camController;

void setup() {
  size(displayWidth, displayHeight);

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
    cam = new Capture(this, 640, 480, "Logitech HD Webcam C310", 30);
    cam.start(); 

    camController = new CameraController(cam);
  }
  
  // clips
  lightning = new Lightning();
  stripes = new Stripes();
  
  // text controllers
  int xMargin = 50;
  int yMargin = 50;
  int textSize = 64;
  String[] credits = {"first credit", "second credit"};
  creditsController = new CreditsController(credits, xMargin, yMargin, textSize);
  
  String[] songLyrics = {"stopping", "starting"};
  songLyricsController = new SongLyricsController(songLyrics, xMargin, yMargin, textSize);
}

void draw() {
  background(0);
  noCursor();
  camController.show();
  //creditsController.show();
  //songLyricsController.show();
  //lightning.show();
  //stripes.show();
}

void captureEvent(Capture c) {
  c.read();
}
