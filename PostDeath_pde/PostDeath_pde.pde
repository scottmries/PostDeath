import processing.video.*;
import processing.sound.*;

// THE STAGE RIGHT PROJECTOR IS FLIPPED, THE STAGE LEFT IS NOT

Boolean centerProjector = true;

//clips
Capture cam;
Lightning lightning;
Stripes stripes;
VideoClip trains;
Triangles triangles;
VJ vj;
Curtains curtains;
ThreeDObject shoe;
Color white;
Diagonals diagonals = new Diagonals();
Credits credits;

//controllers
//CreditsController creditsController;
SongLyricsController songLyricsController;
CameraController camController;

Movie myMovie;

void setup() {
  size(displayWidth, displayHeight, P3D);

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
    //cam = new Capture(this, 640, 480, "Logitech HD Webcam C310", 30);
    cam = new Capture(this, 640, 480, cameras[0], 30);
    cam.start(); 

    camController = new CameraController(cam);
  }

  // clips
  lightning = new Lightning();
  stripes = new Stripes();
  trains = new VideoClip(this, "Virginia.mp4", 0, 0);
  triangles = new Triangles();
  vj = new VJ(this, cam);
  curtains = new Curtains();
  shoe = new ThreeDObject("converse_obj.obj");
  white = new Color(color(255));
  credits = new Credits();

  // text controllers
  int xMargin = 50;
  int yMargin = 50;
  int textSize = 64;
  String[] credits = {"first credit", "second credit"};
  //creditsController = new CreditsController(credits, xMargin, yMargin, textSize);

  String[] songLyricImagePaths = new String[56];
  for (int i = 0; i < songLyricImagePaths.length; i++) {
    songLyricImagePaths[i] = "song/Post_Death-" + nf(i + 1, 2) + ".png";
  }
  songLyricsController = new SongLyricsController(songLyricImagePaths, xMargin, yMargin);
}

void draw() {
  background(0);
  noCursor();
  camController.show();
  credits.show();
  songLyricsController.show();
  lightning.show();
  stripes.show();
  trains.show();
  triangles.show();
  vj.show();
  if(centerProjector) {
    curtains.show();
  } else {
    diagonals.show();
  }
  shoe.show();
  white.show();
}

void captureEvent(Capture c) {
  c.read();
}

void movieEvent(Movie m) {
  m.read();
}
