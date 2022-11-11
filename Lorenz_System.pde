// Constants used in the Lorenz Attractor
float sigma = 10;
float p = 28;
float beta = float(8)/3;

float x = 0.1, y = 0, z = 0;

// The derivatives
float dx, dy, dz;

float time = 0.0115;
float frame = 0;
boolean reverse = false;
float colorAdd = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

import camera3D.Camera3D;

Camera3D camera3D;

float rotX = 0; 
float rotY = 0;
float rotZ = 0;


void setup() {
  size(600,600,P3D);
  background(0);
  beginShape();
  frameRate(200);
  //camera(width/2, height/2 + 100, 400, width/2, height/2, 300, 
  //     0.0, 0.0, 0.0);
  camera3D = new Camera3D(this);
  //camera3D.renderRegular();
  camera3D.setBackgroundColor(color(0));
  //camera3D.renderDefaultAnaglyph().setDivergence(1);

}

void preDraw() {
  rotX += 0.3;
  rotY += 0.2;
  rotZ += 0.1;
}

void draw() {
  
  dx = (sigma * (y - x)) * time;
  dy = ((x * (p - z) - y)) * time;
  dz = (x * y - beta * z) * time;
  
  x += dx;
  y += dy;
  z += dz;
  
  //time += 0.001;
  
  translate(width/2, height/2);
  //rotate(PI);
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
  scale(5);
  stroke(255);
  noFill();
  
  
  
    
    points.add(new PVector(x, y, z));
    
    for(PVector p : points) {
      stroke(colorAdd/5, 0, 230);
      //stroke(255, 0, 0);
      point(p.x, p.y, p.z);
      
      if(!reverse) {
        colorAdd += 0.5;
      }
      else {
        colorAdd -= 0.5;
      }
      
      println(colorAdd);
      if(colorAdd/2 > 255) {
        reverse = true;
      }
      
      if(colorAdd/2 < 0) {
        reverse = false;
      }
    }
    
    
    

    
    
    
  
  saveFrame("/images/line-###########################.png");

}

void postDraw() {
  draw();
}
