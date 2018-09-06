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
      //creditsController.turnOn();
      break;
    default:
      println(key);
      break;
  }
}
