class Lightning extends Clip {
  color backgroundColor;
  color foregroundColor;
  color sourceColor = color(255, 0 , 255);
  color destinationColor = color(255, 0, 255);;
  float transitionSeconds = 0.5;
  int colorTransitionElapsedFrames = 0;
  int points = 50;
  LightningPoint[] lightningPoints = new LightningPoint[points];
  
  Lightning() {
    this.setColors();
    for(int i = 0; i < points; i++) {
      lightningPoints[i] = new LightningPoint(random(2 * width) - width / 2, random(2 * height) - height / 2);
    }
    for(int i = 0; i < points; i++) {
      int numberToConnect = 1 + floor(random(20));
      for(int j = 0; j <= numberToConnect; j++) {
        lightningPoints[i].connect(lightningPoints[floor(random(points))]);
      }
    }
  }
  
  void showBetweenFades() {
    if(this.playing){
      this.setColors();
      background(backgroundColor);
      stroke(foregroundColor);
      strokeWeight(3);
      for(int i = 0; i < points; i++) {
        lightningPoints[i].draw();
        lightningPoints[i].move();
      }
    }
  }
  
  void setColors() {
    if(this.colorTransitionElapsedFrames / frameRate > this.transitionSeconds) {
      this.colorTransitionElapsedFrames = 0;
      this.sourceColor = this.destinationColor;
      this.destinationColor = color(
        this.setColorValue(red(this.sourceColor)), 
        this.setColorValue(green(this.sourceColor)),
        this.setColorValue(blue(this.sourceColor))
      );
    }
    float factor = (this.colorTransitionElapsedFrames / frameRate) / this.transitionSeconds;
    float r = lerp(this.sourceColor >> 16 & 0xFF, this.destinationColor >> 16 & 0xFF, factor);
    float g = lerp(this.sourceColor >> 8 & 0xFF, this.destinationColor >> 8 & 0xFF, factor);
    float b = lerp(this.sourceColor >> 0 & 0xFF, this.destinationColor >> 0 & 0xFF, factor);
    backgroundColor = color(r, g, b);
    foregroundColor = color(255 -r, 255 - g, 255 - b);
    this.colorTransitionElapsedFrames++;
  }
  
  float setColorValue(float value){
    int direction = 0;
    if(random(1) > 0.5) {
      direction = 1;
    } else {
      direction = -1;
    }
    value = value + (12 + random(25)) * direction;
    if (value < 0) {
      value = abs(value);
    }
    if (value > 255) {
      value = 255 - abs(255 - value);
    }
    return value;
  }
}

class LightningPoint {
  float x, y, sourceX, sourceY, destinationX, destinationY;
  float moveTransitionSeconds = 2;
  float elapsedTransitionFrames = 0;
  ArrayList<LightningPoint> connectedPoints = new ArrayList<LightningPoint>();
  
  LightningPoint(float tx, float ty) {
    x = tx;
    y = ty;
    this.sourceX = tx;
    this.sourceY = ty;
    this.setDestinationCoordinates();
  }
  
  void move() {
    if (this.elapsedTransitionFrames / frameRate > this.moveTransitionSeconds) {
      this.elapsedTransitionFrames = 0;
      this.sourceX = this.destinationX;
      this.sourceY = this.destinationY;
      this.setDestinationCoordinates();
    }
    float factor = (this.elapsedTransitionFrames / frameRate) / this.moveTransitionSeconds;
    this.x = lerp(this.sourceX, this.destinationX, factor);
    this.y = lerp(this.sourceY, this.destinationY, factor);
    this.elapsedTransitionFrames++;
  }
  
  void setDestinationCoordinates() {
    this.destinationX = this.getDestinationCoordinate(this.x);
    this.destinationY = this.getDestinationCoordinate(this.y);
  }
  
  float getDestinationCoordinate(float source) {
    return source + random(41) - 20;
  }
  
  void connect(LightningPoint p){
    connectedPoints.add(p);
  }
  
  void draw(){
    for(int i = 0; i < connectedPoints.size(); i++) {
      LightningPoint p = connectedPoints.get(i);
      line(this.x, this.y, p.x, p.y);
    }
  }
}
