
int _width=7680,_height=1080,projectorColumnCount=4,projectorRowCount=1;
PVector realSize=new PVector(3.86,2.365,4.39);
float lineDis=0.1f;
void setup(){
  size(400,400);
  windowResize(_width/projectorColumnCount,_height/projectorRowCount);
  textSize(20);
   background(125);
    stroke(0);
    
}
void saveFront(float mySpaceW,float mySpaceH,String fileName){
   background(125);
    float countW=mySpaceW/lineDis;
  
    for(int i =0;i<=countW;i++){
      float xValue=i*lineDis/mySpaceW*width;
        line(xValue,0,xValue,height);
        float textYPos= i%2*100+100;
        int cm=int(i*lineDis*100);
        text("X:"+cm, xValue, textYPos); 
    }
    float countH=mySpaceH/lineDis;
    for(int i =0;i<=countH;i++){
      float yValue=i*lineDis/mySpaceH*height;
       line(0, yValue,width,yValue);
        float textYPos= i%2*100;
        int cm=int(i*lineDis*100);
        text("Y:"+cm,  textYPos,yValue+5); 
    }
    saveFrame(fileName+".png");
}
void saveGround(){}
void draw(){
  if (keyPressed) {
    if (key == 'L' || key == 'l') {
      saveFront(realSize.z,realSize.y,"left");
    }
    if (key == 'R' || key == 'r') {
      saveFront(realSize.z,realSize.y,"right");
    }
    if (key == 'F' || key == 'f') {
      saveFront(realSize.x,realSize.y,"front");
    }
    if (key == 'G' || key == 'g') {
      saveFront(realSize.z,realSize.x,"ground");
    }
  }
}
