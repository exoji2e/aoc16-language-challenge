#!/bin/bash
#Assumes xcode installed wiht swiftc-compiler
xcrun -sdk macosx swiftc A.swift
./A < input.txt
rm A
