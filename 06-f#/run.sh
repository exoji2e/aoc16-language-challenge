#!/bin/bash
fsharpc A.fs
mono A.exe < input.txt
rm A.exe
