from PIL import Image

# im = Image.open('icon.png')
im = Image.open('waves.jpg')

pix = im.load()
width,height=im.size

def getPixel(pix,x,y):
    if(x<0):x=0
    if(y<0):y=0
    if(x>width-1):x=width-1
    if(y>height-1):y=height-1
    return pix[x,y]

def average(pix,x,y):
    r,g,b=0,0,0
    size=10
    for i in range(-size,size+1,1):
        for j in range(-size,size+1,1):
            color=getPixel(pix,x+i,y+j)
            r+=color[0]
            g+=color[1]
            b+=color[2]
        
    r/=(size*2+1)*(size*2+1)
    g/=(size*2+1)*(size*2+1)
    b/=(size*2+1)*(size*2+1)
    return (int(r),int(g),int(b))


for j in range(height):
    for i in range(width):
        pix[i,j]=average(pix,i,j)
    print("row",end="")
    print(j,end="")
    print("/",end="")
    print(height)


im.save("output.png")