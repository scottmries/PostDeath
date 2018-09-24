class CameraController extends Clip{
  Capture cam;
  Boolean invert = false;
  
  CameraController(Capture tempC) {
    super();
    this.cam = tempC;
    this.start();
  }
  
  void show() {
    this.fade();
  }
  
  void showBetweenFades() {

    if(this.finished) {
      this.stop();
    } else {
      this.start();
      //this.cam.read();
      //image(this.cam, width / 2 - this.cam.width / 2, 0, width - (width / 2 - this.cam.width / 2), 960);
      image(this.cam, 0, 0, 2560, 1920);
      //image(this.cam, 0, 0, 1280, 960);
      if(this.invert && frameCount % 2 == 0) {
        filter(INVERT);
      }
    }
  }
  
  void start() {
    this.cam.start();
  }
  
  void stop() {
    this.cam.stop();
  }
}
