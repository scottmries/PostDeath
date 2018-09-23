class Text extends Clip {
  int xPadding;
  int yPadding;
  String text;
  int fontSize = 64;
  PFont font;
  
  Text(String ttext, int tx, int ty, int tSize, String pathToFont) {
    super();
    this.text = ttext;
    this.xPadding = tx;
    this.yPadding = ty;
    this.fontSize = tSize;
    this.font = loadFont(pathToFont);
    textFont(this.font);
  }
  
  void showBetweenFades() {
    textSize(fontSize);
    background(0);
    fill(255);
    text(this.text, this.xPadding, this.yPadding, width - this.xPadding, height - this.yPadding);
  }
  
  void show() {
    this.fade();
  }
}
