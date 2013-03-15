int _maxLevels = 3;
int _numChildren = 3;

Branch _trunk;

void setup() {
  frameRate(24);
 size(800,800);
background(255);
noFill();
smooth();
newTree();
}

void draw() {
  background(255);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();  
}
  
void newTree() {
 _trunk = new Branch(1,0,width/2,height/2);
_trunk.drawMe(); 
}



