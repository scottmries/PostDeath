class Triangles extends Clip {
  float framesSinceStarted = 0;
  int spacingDivisor = 40;
  float spacing = width / spacingDivisor;
  float speed = 10;
  float xOffset;
  Boolean exiting = false;
  Boolean halted = false;
  float speedMultiplier = 1;
  int framesSinceEnding = 0;
  float[] topLeftPoints = new float[2 * spacingDivisor];
  
  Triangles() {
    for(int i = 0; i < topLeftPoints.length; i++) {
      topLeftPoints[i] = i * spacing - 3 *  width;
    }
  }
  
  void showBetweenFades() {
    if (this.playing){
      noStroke();
      for(int i = topLeftPoints.length - 1; i > 0; i--) {
        if(i % 2 == 1){
          fill(255);
        } else {
          fill(0);
        }
        float xOffset = topLeftPoints[i];
        beginShape();
        vertex(xOffset, 0);
        vertex(xOffset + spacing, 0);
        vertex(xOffset + width, height / 2);
        vertex(xOffset + spacing, height);
        vertex(xOffset, height);
        vertex(xOffset + width - spacing, height / 2);
        endShape(CLOSE);
        if(!this.exiting){
          if(xOffset > width){
            topLeftPoints[i] = (topLeftPoints[i] + this.speed) - 2 * width;
          } else {
            topLeftPoints[i] = topLeftPoints[i] + this.speed;
          }
        }
      }
    }
  }
  void exit() {
    this.exiting = true;
  }
  void toggleFade() {
    if(this.playing) {
      this.exit();
    } else {
      this.cutIn();
    }
  }
  void halt() {
    if(this.playing) {
      this.speed = 0;
    }
  }
  void up() {
    if(this.playing) {
      if(this.speed == 0) {
        this.speed = 10;
      } else {
        this.speed += 1;
      }
    }
  }
}
