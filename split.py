import sys, random

trees = sys.stdin.read().split('\n\n')

print(trees[:2])

print(len(trees))

batch = int(len(trees)/10)

print(len(trees), batch)

random.shuffle(trees)

prefix = './splits/'

i = 0
for part in range(0, len(trees)-batch, batch):
	f = open(prefix + str(i).zfill(2)+'.conllu', 'w+')
	f.write('\n\n'.join(trees[part:part+batch]))
	f.write('\n\n')
	print(i, part, part+batch)
	f.close()
	i += 1
