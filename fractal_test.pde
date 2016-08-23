float theta;
float control = 0;
int flag = 0;
int[] interval = {0, 600};
int inter = 5;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);


  if (flag == 0) {
    if (keyPressed == true) {  
      control += 3;
    } else {
      control -= 3;
    }

    if (control < interval[0]) {
      control = interval[0];
    }
    if (control > interval[1]) {
      if (keyPressed == true) {
        flag = 1;
        interval[0] = 450;
      }
      control = interval[1];
    }
  } else if (flag ==1) {
    if (keyPressed == true) {
      if (control < interval[0]) {
        inter = 3;
      }
      if (control>interval[1]) {
        inter = -3;
      }
      control += inter;
    } else {
      flag = 0;
      interval[0] = 0;
    }
  }
  float a = (control / (float) width) * 30f;
  theta = radians(a);
  translate(width/2, height);
  line(0, 0, 0, -height/3);
  translate(0, -height/3);
  branch(150);
}


void branch(float h) {
  h *= 0.66;

  if (h > 3) {
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}