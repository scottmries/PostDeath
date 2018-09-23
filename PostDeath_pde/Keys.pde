void keyPressed() {
  switch(key) {
    case '1':
      if(centerProjector) {
        curtains.cutIn();
      } else {
        diagonals.cutIn();
      }
      break;
    case '2':
      if(centerProjector) {
        curtains.exit();
        camController.fadeIn();
      } else { 
        diagonals.exit();
      }
      break;
    case '3':
      if(centerProjector) {
        camController.fadeOut();
        curtains.cutOut();
        credits.cutIn();
      } else {
        diagonals.cutOut();
      }
      break;
    case '4':
      if(centerProjector) {
        songLyricsController.turnOn();
      }
      break;
    case 'n':
    case 'N':
      if(centerProjector) {
        songLyricsController.next();
      }
      break;
    case '5':
      stripes.cutIn();
      break;
    case '6':
      stripes.cutOut();
      triangles.cutIn();
      break;
    case '7':
      triangles.cutOut();
      white.cutIn();
      break;
    case '8':
      white.cutOut();
      triangles.cutIn();
      break;
    case 'b':
    case 'B':
      triangles.cutOut();
      trains.cutOut();
      camController.cutOut();
      break;
    case '9':
      lightning.cutIn();
      break;
    case '0':
      lightning.cutOut();
      shoe.cutIn();
      break;
    case 'q':
    case 'Q':
      shoe.cutOut();
      trains.fadeIn();
      break;
    case 'r':
    case 'R':
      trains.cutOut();
      if(centerProjector){
        vj.cutIn();
      }
      break;
    case 't':
    case 'T':
      if(centerProjector) {
        vj.fadeOut();
        camController.fadeIn();
      }
      break;
    case 'c':
    case 'C':
      if(centerProjector) {
        curtains.reset();
      } else {
        diagonals.reset();
      }
      break;
    default:
      println("key: " + key);
      break;
  }
  
  switch(keyCode) {
    case 38:
      println("pressed up");
      //up
      stripes.up();
      triangles.up();
      break;
    case 40:
      println("pressed down");
      //down
      triangles.halt();
      stripes.down();
      break;
    default:
      println(keyCode);
      break;
  }
}
