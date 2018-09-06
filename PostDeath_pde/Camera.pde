class CameraController extends Fadeable{
  Capture cam;
  
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
      image(this.cam, 0, 0, width, height);
    }
  }
  
  void start() {
    this.cam.start();
  }
  
  void stop() {
    this.cam.stop();
  }
}
