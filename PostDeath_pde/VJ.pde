class VJ extends Clip {
  
  FFT fft;
  Amplitude amp;
  AudioIn in;
  AudioIn in2;
  int bands = 512;
  int waitFrames = 0;
  int framesPassed = 0;
  float gain = 1000.0;
  float[] spectrum = new float[bands];
  float amplitude;
  Capture cam;

  float prevX = width / 2.0;
  float prevY = height / 2.0;

  int xDirection = 1;
  int yDirection = 1;
  VJ (PApplet p, Capture tcam) {
    this.fft = new FFT(p, this.bands);
    cam = tcam;
    amp = new Amplitude(p);
    in = new AudioIn(p, 0);
    in2 = new AudioIn(p, 0);
    in.start();
    in2.start();
    fft.input(in2);
    amp.input(in);
  }
   void showBetweenFades() {
     if(this.playing && frameCount % 3 == 0){
      prevX = abs(prevX + 10 * width) % width;
      prevY = abs(prevY + 10 * height) % height;
      float amplitude = amp.analyze();
      fft.analyze(spectrum);
      //fill(color(0,mouseX / 100));
      
      fill(0);
      
      rect(0,0,width,height);
      
      int points = 0;
      for(int i = 0; i < bands - 1; i++) {
  
        float r = random(255);
        float g = random(255);
        float b = random(255);
        fill(color(r, g, b, ( r + g + b) / 3));
        //fill(0);
        
        noStroke();

        if (points == 0) {
          beginShape();
        }
        
        //vertex(random(width), random(height));
        
        float theta = spectrum[i + 1];
        //float prevTheta = spectrum[i];
        float x = ((amplitude * gain * cos(theta * 1000) + prevX * xDirection) + width) % width;
        float y = ((amplitude * gain * sin(theta * 1000) + prevY * yDirection) + height) % height;
        if (x > width || x < 0) {
          xDirection *= -1;
        }
        if ( y > height || y < 0) {
          yDirection *= -1;
        }
        if (x < width && x > -1 && y < height && y > -1){
          vertex(prevX, prevY);
          points++;
        }
        
        if (points == 4) {
          texture(cam);
          endShape();
          points = 0;  
        }

        prevX = x;
        prevY = y;
      }
     }
   }
}
