// this should just be measure-by-measure images of the score with the words correctly attached

class SongLyric extends ImageClip{
  SongLyric(String imagePath, int tx, int ty) {
    super(imagePath, tx, ty);
  }
}

class SongLyricsController{
  ArrayList<SongLyric> lyrics = new ArrayList<SongLyric>();
  int index = 0;
  Boolean on = false;
  
  SongLyricsController(String[] imagePaths, int tx, int ty) {
    for(int i = 0; i < imagePaths.length; i++) {
      this.lyrics.add(
        new SongLyric(
          imagePaths[i], 
          tx, 
          ty
        )
      );
    }
  }
  
  SongLyric current() {
    if(index < this.lyrics.size()) {
      return this.lyrics.get(this.index);
    }
    return null;
  }
  
  void next() {
    index++;
    if(this.current() != null){
      this.current().cutIn();
    }
    if(this.index >= this.lyrics.size()) {
      this.index = this.lyrics.size() - 1;
      this.turnOff();
    }
  }
  
  void turnOn() {
    this.on = true;
    this.current().cutIn();
  }
  
  void turnOff() {
    this.on = false;
    this.current().fadeOut();
  }
  
  void show() {
    if(this.on){
      background(255);
      if(this.index < this.lyrics.size()){
        this.current().show();
      }
    }
  }
}
