class Circle {
  float x,y;
  float radius;
  color lineColor, fillColor;
  float alph;
  float xmove,ymove;
 
 Circle() {
   x = random(width);
   y = random(height);
   radius = random(50) + 10;
   lineColor = color(random(255), random(255), random(255));
   fillColor = color(random(255), random(255), random(255));
   alph = random(255);
   xmove = random(4) - 2;
    ymove = random(4) - 2;
 }
  
  void drawMe() {
    noStroke();
    fill(fillColor,alph);
    ellipse(x,y,radius*2,radius*2);
    stroke(lineColor,150);
    noFill();
    ellipse(x,y,10,10);
  }
  
  void updateMe() {
    x += xmove;
    y +=ymove;
    println("x/y: " + x + " / " + y);
    if (x > (width+radius)) { x = 0 -radius; }
    if (x < (0-radius)) { x = width + radius; }
    if (y > (height + radius)) { y = 0 - radius; }
    if (y < (0 - radius)) { y = height + radius; }
    
    boolean touching = false;
    for(int i = 0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
         float dis = dist(x,y, otherCirc.x, otherCirc.y);
         float overlap = dis - radius - otherCirc.radius;
         if (overlap < 0) { //negative overlap = touching
           float midX, midY;
           midX = (x+otherCirc.x)/2;
           midY = (y+otherCirc.y) / 2;
           stroke (0,100);
           noFill();
           overlap *= -1;
           ellipse(midX,midY,overlap,overlap);
         }        
      }
    }
    drawMe();
  }
}
