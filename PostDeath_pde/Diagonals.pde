class Diagonals extends Clip {
  Boolean exiting = false;
  int topOffset = 0;
  int bottomOffset = 0;
  
  void showBetweenFades() {
    if(playing){
      background(255);
      fill(0);
      //bottom-left triangle
      triangle(0, height - bottomOffset, width, height - bottomOffset, 0, 0 - bottomOffset);
      //top-right triangle
      triangle(100, topOffset, width, topOffset, width, height - 100 + topOffset);
      if(exiting) {
        bottomOffset--;
        topOffset--;
        if (bottomOffset < -height && topOffset < -100) {
          this.fadeOut();
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
