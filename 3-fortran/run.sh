#!/bin/bash
#Assumes gfortran installed, and inputfile in input.txt.
gfortran A.f90
#Assumes that input file contains 1992 lines wiht 3 integers on each line.
a.out < input.txt
gfortran B.f90
a.out < input.txt
