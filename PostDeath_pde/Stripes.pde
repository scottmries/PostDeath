class Stripes extends Clip {
  int yOffset = 0;
  int startTime = 0;
  
  Stripes() {
    super();
  }
  
  void showBetweenFades() {
    if(this.playing) {
      startTime += 1;
      println("hi");
      yOffset += floor(startTime / 15);
      fill(255);
      for(float i = 0; i < 2 * height; i += height / 16) {
        if(i % 2 == 0) {
          float sum = (yOffset - (i - height / 16)) % (2 * height) - height / 8;
          quad(0, sum + height / 16, width, sum, width, sum - height / 16, 0, sum);
        }
      }
    } else {
      this.yOffset = 0;
      this.startTime = 0;
    }
  }
}
