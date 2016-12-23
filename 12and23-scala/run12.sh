#!/bin/bash
scalac A.scala
echo "compilation done"
scala A 0 0 0 0 < input_12.txt
scala A 0 0 1 0 < input_12.txt
rm *.class
