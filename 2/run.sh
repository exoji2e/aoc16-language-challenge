#!/bin/bash
#Assumes ghc and input.txt
ghc A.hs
ghc B.hs
./A < input.txt
./B < input.txt
rm *.o
rm *.hi
rm A
rm B
