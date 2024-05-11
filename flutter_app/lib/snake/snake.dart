class SnakePart{
  int x,y;
  SnakePart(this.x,this.y);
}

class Snake{
  int vx=1,vy=0;
  List<SnakePart> parts=[];
  Snake();
  void init(int width,int height){
     parts.add(SnakePart(width~/2, height~/2));
  }
  void add({int n=1}){
    for(int i=0;i<n;i++)parts.add(SnakePart(parts.last.x, parts.last.y));
  }
  void update(int width,int height){
    for(int i=parts.length-1;i>=1;i--){
      parts[i].x=parts[i-1].x;
      parts[i].y=parts[i-1].y;
    }
    parts.first.x+=vx;
    parts.first.y+=vy;
    if(parts.first.x>=width)parts.first.x=0;
    if(parts.first.y>=height)parts.first.y=0;
    if(parts.first.x<0)parts.first.x=width-1;
    if(parts.first.y<0)parts.first.y=height-1;
  }
}