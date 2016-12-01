import pnmmodules.imageio as ii

# Set up list.
x = 3
y = 4

d = []

for i in range(x):
    d.append([])
    for j in range(y):
        d[i].append(i + j)

print(d)

ii.writepgm(d, (x+y-2), "test.pgm")
ii.writepbm(d, 3, "test.pbm")
