class Curtains extends Clip {
  Boolean exiting = false;
  int topOffset = 0;
  int bottomOffset = 0;
  
  void showBetweenFades() {
    if(playing){
      background(255);
      fill(0);
      //middle/bottom triangle
      triangle(0, height - bottomOffset, width, height - bottomOffset, width / 2, 0 - bottomOffset);
      //left triangle
      triangle(0, topOffset, width / 2 - 100, topOffset, 0, height - 100 + topOffset);
      //right triangle
      triangle(width / 2 + 100, topOffset, width, topOffset, width, height - 100 + topOffset);
      if(exiting) {

        if (!(bottomOffset < -height && topOffset < -100)) {
          bottomOffset--;
          topOffset--;
        }
      }
    }
  }
  
  void reset() {
    this.topOffset = 0;
    this.bottomOffset = 0;
    this.cutIn();
  }
  
  void toggleCut() {
    if(this.playing) {
      this.exit();
    } else {
      this.cutIn();
    }
  }
  
  void exit() {
    this.exiting = true;
  }
}
