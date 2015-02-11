import chess.pgn
import subprocess
import os


from os import listdir
from os.path import isfile, join
onlyfiles = [ f for f in listdir("./game_pgn") if isfile(join("./game_pgn",f)) ]


for file in onlyfiles:

    pgn = open("./game_pgn/"+file)
    game = chess.pgn.read_game(pgn)
    pgn.close

    node = game
    i = 1

    while node.variations:
        next_node = node.variation(0)
        fen = node.board().fen()
        cmd = "./eval_position.sh " + fen + " | ./stockfish-6-mac/src/stockfish | python extract_moves.py > ./final/" +file + "_" + str(i)
        print(cmd)
        subprocess.call(cmd, shell=True )
        node = next_node
        i = i + 1
