class Stripes extends Clip {
  int yOffset = 0;
  int startTime = 0;
  float yIncrement = 50.0 / 15.0;
  
  Stripes() {
    super();
  }
  
  void showBetweenFades() {
    if(this.playing) {
      background(0);
      //startTime += 1;
      startTime = 100;
      this.yOffset += yIncrement;
      noStroke();
      fill(255);
      for(float i = 0; i < 2 * height; i += height / 16) {
        if(i % 2 == 0) {
          float sum = (yOffset - (i - height / 16)) % (2 * height) - height / 8;
          quad(0, sum + height / 32, width, sum, width, sum - height / 32, 0, sum);
        }
      }
    } else {
      this.yOffset = 0;
      this.startTime = 0;
    }
  }
  
  void up() {
    if(this.playing) {
      yIncrement += 10.0 / 15.0;
    }
  }
  
  void down() {
    if(this.playing) {
      yIncrement -= 10.0 / 15.0;    }
  }
}
