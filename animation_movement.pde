class Animator{
  PVector per;
  PVector vel = new PVector(0,0);
  PVector  acc;
  float damping = 0.90;
  float k = 0.01;
  PVector temp;
  
  Animator(PVector p,int i,int j){    ///j = 0  inside j =1 outside
    
    per = p;
   if(i==1)
    temp = new PVector(width +150,p.y);
   if(i == 0) 
    temp = new PVector(p.x,height+150);
   if(i == 2) 
    temp = new PVector(p.x,-150);
   if(i == 3) 
    temp = new PVector(-150,p.y);
   
   if(j==1){              // j==1 swap;
     PVector flag = per;
     per = temp;
     temp = flag;
   }
   
 }
 
 PVector update(){
  acc = PVector.sub(per,temp);
  float stretch = acc.mag();
  acc.normalize();
  acc.mult( k* stretch);
  vel.add(acc);
  vel.mult(damping);
  temp.add(vel);
   return temp;

   
   
 }
  
   
}
