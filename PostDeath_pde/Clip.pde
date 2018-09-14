class Clip{
  Boolean fadingIn = false;
  Boolean fadingOut = false;
  Boolean playing = false;
  Boolean notYetStarted = true;
  Boolean finished = false;
  Boolean betweenFades = false;
  float opacity = 0;
  float fadeSeconds = 1;
  
  void show() {
    this.fade();
  }
  
  void showBetweenFades() {
    
  }
  
  void fadeIn() {
    println("fading in");
    this.notYetStarted = false;
    this.finished = false;
    this.playing = true;
    this.fadingIn = true;
    this.fadingOut = false;
    if (this.opacity <= 255) {
      this.opacity += this.fadeSeconds / frameRate * 255;
      println("opacity: " + this.opacity);
    } else {
      this.fadingIn = false;
      this.betweenFades = true;
    }
  }
  
  
  void fadeOut() {
    println("fading out");
    this.fadingIn = false;
    this.fadingOut = true;
    this.betweenFades = false;
    if (this.opacity > 0) {
      this.opacity -= this.fadeSeconds / frameRate * 255;
      println("opacity: " + this.opacity);
    } else {
      this.fadingOut = false;
      this.playing = false;
      this.finished = true;
    }
  }
  
  void fade() {
    if (this.fadingIn){
      this.fadeIn();
    }
    if (this.fadingOut){
      this.fadeOut();
    }
    tint(255, this.opacity);
    this.showBetweenFades();
    tint(255, 255);
  }
  
  void cutIn() {
    this.playing = true;
    this.opacity = 255;
  }
  
  void cutOut() {
    this.playing = false;
    this.opacity = 0;
  }
  
}
