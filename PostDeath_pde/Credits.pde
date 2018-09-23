class Credits extends Clip {
  
  PImage img;
  int index = 0;
  PShape s;
  Boolean moving = false;
  int framesInCycle = 0;
  int movingFactor = 0;
  PImage[] images = new PImage[26];
  int colorIndex = 0;
  color bgColor;
  color[] bgColors = {
      color(255, 0, 0),
      color(84, 105, 127),
      color(84, 78, 12),
      color(255, 0, 255),
      color(0, 255, 0)
    };
    
    Credits() {
      for(int i = 0; i < images.length; i++) {
        String path;
        if(i % 2 == 1) {
          path = "post-death_BW" + floor((i + 2) / 2) + ".jpg";
        } else {
          path = "" + floor((i + 2) / 2) + ".jpg";
        }
        images[i] = loadImage(path);
        images[i].resize(images[i].width / 2, images[i].height / 2);
      }
    }
    
    void cutIn() {
      this.playing = true;
      this.opacity = 255;
      this.index = 0;
    }
  
    void showBetweenFades() {
      if(playing){
      img = images[index];
      s = createShape();
      if(framesInCycle > 90) {
        if(index < images.length){
          index++;
        } else {
          this.cutOut();
        }
        //index = (index + 1) % images.length;
        moving = !moving;
        framesInCycle = 0;
        colorIndex = (colorIndex + 1) % bgColors.length;
      }
      if (moving) {
        movingFactor = 1;
        bgColor = bgColors[colorIndex];
        background(bgColors[colorIndex]);
      } else {
        bgColor = color(255);
        movingFactor = 0;
      }
      background(bgColor);
      ambientLight(red(bgColor), green(bgColor), blue(bgColor));
      
      directionalLight(red(bgColor), green(bgColor), blue(bgColor), 0, 0, 1);
      //rotateX(mouseX / width * 2 * PI);
      //pushMatrix();
      translate(width /2 - images[0].width / 2 , height / 2 - images[0].height / 2, 250);
      s.beginShape();
      
      s.noStroke();
      s.texture(img);
      for(int i = 0; i < img.width; i += img.width / 100) {
        s.vertex(i, 0, 25 * sin((i / img.width + frameCount / frameRate * 100) * 2 * PI)  * movingFactor, i, 0);
      }
      for(int i = 1; i < img.height; i += img.height / 100) {
        s.vertex(img.width, i, 25 * cos((1 / img.height + frameCount / frameRate * 93) * 2 * PI) * movingFactor, img.width, i);
      }
      for(int i = img.width - 1; i>= 0; i -= img.width / 100) {
        s.vertex(i, img.height, -25 *  sin((i / img.width + frameCount / frameRate * 91) * 2 * PI) * movingFactor, i, img.height);
      }
      for(int i = img.height - 1; i >= 0; i -= img.height / 100) {
        s.vertex(0, i, - 25 * sin((i / img.height + frameCount / frameRate) * 2 * PI * 97) * movingFactor, 0, i);
      }
      s.endShape(CLOSE);
      shape(s, 0, 0);
      //popMatrix();
      framesInCycle++;
      }
    }
}
