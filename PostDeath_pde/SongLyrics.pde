// this should just be measure-by-measure images of the score with the words correctly attached

class SongLyricsController extends TextController{
  
  SongLyricsController(String[] tLyrics, int tx, int ty, int tSize) {
    super(tLyrics, tx, ty, tSize);
  }
  
  void show() {
    if(this.on){
      this.currentText.show();
    }
  }
}
