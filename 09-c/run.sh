#!/bin/bash
gcc A.c
./a.out < input.txt
gcc B.c
./a.out < input.txt
rm a.out

