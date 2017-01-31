from PIL import Image
import socket

def tohex(i):
	return '%02x%02x%02x' % i

file = "lenna.ppm"
size = map(int, open(file, "r").readlines()[1].split(" "))

im = Image.open(file).load()

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('localhost', 1234))
for x in range(size[0]):
	for y in range(size[1]):
		c = tohex(im[x, y])
		sock.send(" ".join(["set", str(x), str(y), c]) + "\n")