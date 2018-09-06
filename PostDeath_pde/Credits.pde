class CreditsController{
  int index = 0;
  Credit[] credits;
  Credit currentCredit;
  float showSeconds = 1;
  float elapsedSeconds = 0;
  Boolean showing = false;
  Boolean on = false;
  
  CreditsController(String[] creditTexts, int tx, int ty) {
    this.credits = new Credit[creditTexts.length];
    for(int i = 0; i < this.credits.length; i++) {
      this.credits[0] = new Credit(creditTexts[i], tx, ty);
    }
    this.setCurrentCredit();
  }
  
  void show() {
    if(this.on){
      if(!this.currentCredit.notYetStarted) {
        this.currentCredit.fadeIn();
      }
      if(this.currentCredit.betweenFades) {
        elapsedSeconds += 1 / frameRate;
      }
      if(this.elapsedSeconds > this.showSeconds) {
        this.currentCredit.fadeOut();
      }
      if(this.currentCredit.finished && this.index < this.credits.length){
        this.next();
      }
    }
  }
  
  void next() {
    this.index = (this.index + 1) % this.credits.length;
    this.setCurrentCredit();
  }
  
  void reset() {
    this.index = 0;
    this.setCurrentCredit();
  }
  
  void turnOn() {
    this.on = true;
  }
  
  void turnOff() {
    this.on = false;
  }
  
  void setCurrentCredit() {
    this.currentCredit = this.credits[this.index];
  }

}

class Credit extends Fadeable {
  int xPadding;
  int yPadding;
  String text;
  
  Credit(String ttext, int tx, int ty) {
    super();
    this.text = ttext;
    this.xPadding = tx;
    this.yPadding = ty;
  }
  
  void showBetweenFades() {
    background(0);
    fill(255);
    text(this.text, this.xPadding, this.yPadding, width - this.xPadding, height - this.yPadding);
  }
  
  void show() {
    this.fade();
  }
}
