size(500,100);
background(255);
strokeWeight(5);
smooth();

stroke(0,30);
line(20,50,480,50);

stroke(20,50,70);
float xstep = 1; //change this for more/less data points
float lastx = -999;
float lasty = -999;
float angle = 0;
float y = 50;

for(int x = 20; x <= 480; x += xstep) {
  float rad = radians(angle);
  y = 50 + (pow(sin(rad),3) * noise(rad*2) * 30); //-1 to 1; change between sin and cos
  if (lastx > -999) {
    line(x,y,lastx,lasty);
  }
  lastx = x;
  lasty = y;
  angle++;
}
