from PIL import Image

# im = Image.open('icon.png')
im = Image.open('waves.jpg')

pix = im.load()
width,height=im.size

palete=[' ','.',',',';','i','x','a','l','A','5','H','X','#','8','$']
l=len(palete)

scale=2
for j in range(int(height/scale)):
    for i in range(int(width/scale)):
        color=pix[i*scale,j*scale]
        r,g,b,a=0,0,0,0
        if(len(color)==4):r,g,b,a=color
        if(len(color)==3):r,g,b=color
        b/=256
        b*=l
        b=int(b)
        print(palete[b]+palete[b],end="")
    print()