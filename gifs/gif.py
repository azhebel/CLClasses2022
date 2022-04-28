import imageio

filenames = ["pic1.png", "pic2.png", "pic3.png"]
images = []

for filename in filenames:
    images.append(imageio.imread(filename))

imageio.mimsave('./movie.gif', images, format="GIF", fps=0.5)