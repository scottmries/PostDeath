class VideoClip extends Clip {
  Movie mov;
  int xPadding, yPadding;
  VideoClip(PApplet p, String moviePath, int tx, int ty) {
    this.mov = new Movie(p,  moviePath);
    this.xPadding = tx;
    this.yPadding = ty;
    this.mov.loop();
    this.mov.volume(0);
  }
  
  void show() {
    this.fade();
    mov.play();
  }
  
  void showBetweenFades() {
    //if(mov.available()){
      //mov.read();
      float multiplierToMatchWidth = (width - 2 * xPadding) / this.mov.width;
      float multiplierToMatchHeight = (height - 2 * yPadding) / mov.height;
      Boolean widerThanTall = multiplierToMatchWidth < multiplierToMatchHeight;
      float multiplier;
      if(widerThanTall) {
        multiplier = multiplierToMatchWidth;
      } else {
        multiplier = multiplierToMatchHeight;
      }
      image(mov, xPadding, yPadding, mov.width * multiplier * 2, mov.height * multiplier * 2);
    }
  //}
}
