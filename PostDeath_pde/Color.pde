class Color extends Clip {
  color fillColor;
  
  Color(color c) {
    this.fillColor = c;
  }
  void showBetweenFades() {
    if(this.playing){
      noStroke();
      fill(this.fillColor);
      rect(0, 0, width, height);
    }
  }
}
