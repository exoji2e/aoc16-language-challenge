#!/bin/bash
mcs A.cs
mono A.exe < input.txt
rm A.exe
