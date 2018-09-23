class ThreeDObject extends Clip {
  PShape shape;
  float scale = 30.0;
  float x = 5.0;
  float y = 7.0;
  float xRotation = 0;
  int framesSinceStart = 0;
  ThreeDObject(String pathToShape) {
    this.shape = loadShape(pathToShape);
    this.shape.setVisible(false);
    this.shape.scale(this.scale);
    this.shape.rotateX(PI/2);
    this.shape.rotateZ(PI);
  }
  
  void showBetweenFades() {
    if(this.playing){
      float fov = PI/3.0;
      float cameraZ = (height/2.0) / tan(fov/2.0);
      perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*100.0);
      if(framesSinceStart == 90) {
        if(this.xRotation < 0.1) {
          this.xRotation += 0.025;
        }
      }
      // transformations to the shape are cumulative
      // abstract transformations in a push/popMatrix are not
      //ambientLight(255, 255, 255);
      directionalLight(255, 255, 255, 0, 0, 1);
      directionalLight(255, 255, 255, 1, 0, 0);
      directionalLight(255, 255, 255, 1, 0, 0);
      pushMatrix();
      translate(width / 2, height / 2);
      this.shape.rotateX(xRotation);
      shape(this.shape, 0, 0);
      popMatrix();
      framesSinceStart++;
    }
  }
  
  void moveRandomVertex() {
    int vertices = this.shape.getVertexCount();
    int index = int(random(vertices));
    PVector vertex = this.shape.getVertex(index);
    float seed = random(1);
    if(seed < 1/3.0) {
      vertex.x *= random(1) + 1.0;
    } else if (seed < 2/3.0) {
      vertex.y *= random(1) + 1.0;
    } else {
      vertex.z *= random(1) + 1.0;
    }
    this.shape.setVertex(index, vertex);
  }
  void cutIn() {
    this.shape.setVisible(true);
    this.playing = true;
  }
  void cutOut() {
    this.shape.setVisible(false);
    this.playing = false;
  }
}
