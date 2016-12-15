#!/bin/bash
#Assumes xcode installed wiht swiftc-compiler
xcrun -sdk macosx swiftc 1.swift
./1 < input.txt
xcrun -sdk macosx swiftc 2.swift
./2 < input.txt
rm 1
rm 2
