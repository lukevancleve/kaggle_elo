#!/bin/bash

( 
echo "setoption name MultiPV value 10" ;
echo "position fen $1" ;
echo "go movetime 10000" ;

sleep 10;

) #| ~/Dropbox/Kaggle/elo/stockfish-6-mac/src/stockfish
