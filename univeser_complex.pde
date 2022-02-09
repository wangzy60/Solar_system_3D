int num= 7;//define the number of displaying stars(unclude the sun)
float theta= 0; 
float thetb= 1.05;
float sunSize= 100;
Star[] star= new Star[num];

void setup(){
  fullScreen(P3D);
  for(int i =0; i<num; i++){
    star[i]= new Star(random(300,800),random(20,30),0.8*i,random(0.005,0.01),color(random(0,100),random(0,100),random(0,100)),random(55,65),random(5,10),0.6*i,random(-0.04,-0.08),color(random(0,255),random(0,255),random(0,255)));
  }
}

void draw(){
  background(0);
  translate(width/2,height/2-100);
  pushMatrix();
  rotate(theta);
  rotateX(thetb);
  translate(50,0);
  //noStroke();
  fill(255,50,50);
  lights();
  sphere(sunSize);
  for(int i =0; i<num; i++){
    pushMatrix();
    rotateX(PI/90*i);
    star[i].creats();
    popMatrix();
    //ellipse(0,0,star[i].distance,star[i].distance);
  }
  popMatrix();
  theta += 0.00001;
  //filter(THRESHOLD,0.9);
}

class SmallStar{
  float distance;
  float dia;
  float theta;
  float speed;
  color c;
  
  SmallStar(float tmpDistance, float tmpD, float tmpTheta, float tmpSpeed, color tmpC){
    distance= tmpDistance;
    dia= tmpD;
    theta= tmpTheta;
    speed = tmpSpeed;
    c= tmpC;
  }
  
  void creats(){
    pushMatrix();
    translate(distance,0);
    rotate(theta);
    //noStroke();
    fill(c);
    sphere(dia);
    theta+=speed;
    popMatrix();
  }
}

class Star{
  float distance;
  float dia;
  float theta;
  float speed;
  color c;
  SmallStar sstar;
  
  Star(float tmpDistance, float tmpD, float tmpTheta, float tmpSpeed, color tmpC,float sDistance, float sD, float sTheta, float sSpeed, color sC){
    distance= tmpDistance;
    dia= tmpD;
    theta= tmpTheta;
    speed = tmpSpeed;
    c= tmpC;
    sstar = new SmallStar(sDistance,sD,sTheta,sSpeed,sC);
  }
  
  void creats(){
    //creat star
    pushMatrix();
    noFill();
    //creat circles
    stroke(50);
    ellipse(0,0,2*distance,2*distance);
    rotate(theta);
    translate(distance,0);
    noStroke();
    fill(c);
    sphere(dia);
    //creat small star
    pushMatrix();
    rotate(sstar.theta);
    translate(sstar.distance,0);
    noStroke();
    fill(sstar.c);
    sphere(sstar.dia);
    popMatrix();
    sstar.theta+=sstar.speed;
    theta+=speed;
    popMatrix();
  }
}
