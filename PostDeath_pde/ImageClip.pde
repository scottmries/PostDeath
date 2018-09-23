class ImageClip extends Clip {
  PImage img;
  int xPadding, yPadding;
  ImageClip(String imagePath, int tx, int ty) {
    this.img = loadImage(imagePath);
    this.xPadding = tx;
    this.yPadding = ty;
  }
  
  void show() {
    this.fade();
  }
  
  void showBetweenFades() {
    float multiplierToMatchWidth = (width - 2 * xPadding) / this.img.width;
    float multiplierToMatchHeight = (height - 2 * yPadding) / img.height;
    Boolean widerThanTall = multiplierToMatchWidth < multiplierToMatchHeight;
    float multiplier;
    if(widerThanTall) {
      multiplier = multiplierToMatchWidth;
    } else {
      multiplier = multiplierToMatchHeight;
    }
    image(img, xPadding, yPadding, img.width * multiplier, img.height * multiplier);
  }
}
