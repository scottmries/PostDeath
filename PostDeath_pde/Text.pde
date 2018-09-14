class Text extends Clip {
  int xPadding;
  int yPadding;
  String text;
  int fontSize;
  
  Text(String ttext, int tx, int ty, int tSize) {
    super();
    this.text = ttext;
    this.xPadding = tx;
    this.yPadding = ty;
    this.fontSize = tSize;
  }
  
  void showBetweenFades() {
    textSize(64);
    background(0);
    fill(255);
    text(this.text, this.xPadding, this.yPadding, width - this.xPadding, height - this.yPadding);
  }
  
  void show() {
    this.fade();
  }
}
