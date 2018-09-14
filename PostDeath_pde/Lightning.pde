class Lightning extends Clip {
  int r = 255;
  int g = 0;
  int b = 255;
  color backgroundColor;
  color foregroundColor;
  LineNode baseLineNode;
  
  Lightning() {
    this.setColors();
    this.baseLineNode = new LineNode();
  }
  
  void showBetweenFades() {
    this.setColors();
    background(backgroundColor);
    stroke(foregroundColor);
    strokeWeight(3);
    this.baseLineNode.draw();
  }
  
  void setColors() {
    r = this.setColorValue(r);
    g = this.setColorValue(g);
    b = this.setColorValue(b);
    backgroundColor = color(r, g, b);
    foregroundColor = color(255 - r, 255 - g, 255 - b);
  }
  
  int setColorValue(int value){
    value = value + int(random(9)) - 4;
    if (value < 0) {
      value = abs(value);
    }
    if (value > 255) {
      value = 255 - abs(255 - value);
    }
    return value;
  }
}

class LineNode {
  int x1, y1, x2, y2;
  LightningPoint point;
  ArrayList<LineNode> connectedPoints = new ArrayList<LineNode>();
  Boolean alreadyMoved = false;
  Boolean alreadyDrawnConnectedPoints = false;
  int previousRecursions;
  int density = 7;
  float chanceToConnect = 0.5;
  
  LineNode(int tx1, int ty1, int tRecursions) {
    this.point = new LightningPoint(tx1, ty1);
    this.previousRecursions = tRecursions + 1;
    this.setConnectedPoints();
  }
  
  LineNode() {
    this.point = new LightningPoint(width / 2, height / 2);
    this.previousRecursions = 0;
    this.setConnectedPoints();
    this.connectUnrelatedNodes();
  }
  
  ArrayList<LineNode> getSubsetOfAllConnectedNodes() {
    // this would work better iteratively
    // whenever a new point is generated, add it to an ArrayList of all connected points,
    // then just iterate over it
    ArrayList<LineNode> nodes = new ArrayList<LineNode>();
    for(LineNode point : this.connectedPoints) {
      if(random(1) < this.chanceToConnect) {
        nodes.add(point);
        nodes.addAll(point.getSubsetOfAllConnectedNodes());
      }
    }
    return nodes;
  }
  
  void connectUnrelatedNodes() {
    ArrayList<LineNode> pointsToConnect = this.getSubsetOfAllConnectedNodes();
    ArrayList<LineNode> pointsToConnectTo = this.getSubsetOfAllConnectedNodes();
    int leastNodes = min(pointsToConnect.size(), pointsToConnectTo.size());
    for(int i = 0; i < leastNodes; i++) {
      pointsToConnect.get(i).connect(pointsToConnectTo.get(i));
    }
  }
  
  void connect(LineNode point) {
    this.connectedPoints.add(point);
  }
  
  void setConnectedPoints() {
    // if this point is onscreen
    if(this.point.x >= 0 && this.point.x < width && this.point.y >= 0 && this.point.y < height && this.previousRecursions < this.density) {
      int pointsToSet = 2 + int(random(2));
      // pass a subset of the connectedPoints down
      for(int i = 0; i < pointsToSet; i++) {
        LineNode point =  new LineNode(
          this.point.x + int(random(1000)) - 500,
          this.point.y + int(random(1000)) - 500,
          this.previousRecursions
        );
        this.connect(point);
      }
    } 
  }
  
  void moveConnectedPoints() {
    this.point.move();
    for(LineNode point : this.connectedPoints) {
      if(!point.alreadyMoved){
        point.moveConnectedPoints();  
      }
    }
  }
  
  void drawConnectedPoints() {
    this.alreadyDrawnConnectedPoints = true;
    for(LineNode point : this.connectedPoints) {
      line(this.point.x, this.point.y, point.point.x, point.point.y);
      if(!point.alreadyDrawnConnectedPoints) {
        point.drawConnectedPoints();
      }
    }
  }
  
  void resetConnectedPoints() {
    this.resetDraws();
    this.resetMoves();
  }
  
  void resetDraws() {
    this.alreadyDrawnConnectedPoints = false;
    for(LineNode point : this.connectedPoints) {
      if(point.alreadyDrawnConnectedPoints) {
        point.alreadyDrawnConnectedPoints = false;
        point.resetDraws();
      }
    }
  }
  
  void resetMoves() {
    this.alreadyMoved = false;
    for(LineNode point : this.connectedPoints) {
      if(point.alreadyMoved) {
        point.alreadyMoved = false;
        point.resetMoves();
      }
    }
  }
  
  void draw() {
    this.drawConnectedPoints();
    this.moveConnectedPoints();
    this.resetConnectedPoints();
  }
}

class LightningPoint {
  int x, y;
  
  LightningPoint(int tx, int ty) {
    x = tx;
    y = ty;
  }
  
  void move() {
    this.x += random(3) - 1;
    this.y += random(3) - 1;
  }
}
