import fileinput
import re

cp = []
move = []

for line in fileinput.input():
    match = re.match(r'.* multipv (.*?) score cp (.*?) .* pv (.*?) ', line)
    if match:
        cp.insert(int(match.group(1))-1, match.group(2))
        move.insert(int(match.group(1))-1, match.group(3))

for i in range(0,9):
    print(str(cp[i]) + " " + str(move[i]))
