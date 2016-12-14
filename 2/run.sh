#!/bin/bash
#Assumes ghc and input.txt
ghc A.hs
./A < input.txt
rm A.o
rm A.hi
rm A
