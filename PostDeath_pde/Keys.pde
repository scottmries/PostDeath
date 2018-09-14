void keyPressed() {
  println(key);
  switch(key) {
    case 'c':
      camController.fadeIn();
      break;
    case 'v':
      camController.fadeOut();
      break;
    case 't':
      creditsController.turnOn();
      break;
    case 'l':
      songLyricsController.turnOn();
      break;
    case 'm':
      songLyricsController.next();
      break;
    case 'n':
      songLyricsController.turnOff();
      break;
    case 'p':
      stripes.cutIn();
      break;
    case 'o':
      stripes.cutOut();
      break;
    case 'h':
      lightning.cutIn();
      break;
    case 'g':
      lightning.cutOut();
      break;
    default:
      println(key);
      break;
  }
}
