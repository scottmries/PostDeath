class TextController{
  int index = 0;
  Text[] texts;
  Text currentText;
  Boolean showing = false;
  Boolean on = false;
  float showSeconds = 1;
  float hideSeconds = 1;
  float elapsedSeconds = 0;
  
  TextController(String[] tTexts, int tx, int ty, int tSize) {
    this.texts = new Text[tTexts.length];
    for(int i = 0; i < this.texts.length; i++) {
      //this.texts[i] = new Text(tTexts[i], tx, ty, tSize);
    }
    this.setCurrentText();
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
  
  void next() {
    this.index = (this.index + 1) % this.texts.length;
    this.setCurrentText();
  }
  
  void reset() {
    this.index = 0;
    this.setCurrentText();
  }
  
  void turnOn() {
    this.on = true;
  }
  
  void turnOff() {
    this.on = false;
  }
  
  void setCurrentText() {
    this.currentText = this.texts[this.index];
  }

}
