// Inspirado em 
// GenerateMe https://twitter.com/generateme_blog/status/995927701419683841

void setup() { 
  size(600, 600);
  smooth();
  background(0);
  stroke(255, 100);
} 
void draw() { 
  background(0);
  randomSeed(mouseX);
  noiseSeed(mouseY);
  for (int i=-10000; i<10000; i++) { 
    float x = random(-1,1);
    float y = random(-1,1);
    //float x = i/100.;
    //float y = 1+1/100.;
    float xx = map(noise(x, y, mouseX*0.01), 0, 1, 50, 550); 
    float yy = map(noise(y, x, mouseX*0.01), 0, 1, 50, 550); 
    point(xx, yy);
  }
}

// Outra opção estranha

//float scale = 0.01;

//void setup() { 
//  size(600, 600);
//  smooth();
//  background(0);
//  stroke(255);
//} 
//void draw() { 
//  background(0);
//  for (int i=1; i<1000; i++) { 
//    float xx = map(noise(0+i*scale, 1+i*scale, mouseX*scale), 0, 1, 50, 550); 
//    float yy = map(noise(2+i*scale, 3+i*scale, mouseY*scale), 0, 1, 50, 550); 
//    point(xx, yy);
//  }
//}
