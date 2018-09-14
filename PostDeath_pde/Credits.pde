class CreditsController extends TextController{
  
  CreditsController(String[] tCredits, int tx, int ty, int tSize) {
    super(tCredits, tx, ty, tSize);
  }
  
  void show() {
    if(this.on){
      if(this.elapsedSeconds < this.showSeconds){
        this.currentText.show();
      }
      this.elapsedSeconds += 1.0 / frameRate;
      if(this.elapsedSeconds > this.showSeconds + this.hideSeconds && this.index < this.texts.length - 1) {
        this.elapsedSeconds = 0;
        this.next();
      }
    }
  }
}
