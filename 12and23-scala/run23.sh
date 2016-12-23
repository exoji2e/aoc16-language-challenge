#!/bin/bash
scalac A.scala
echo "compilation done"
scala A 7 0 0 0 < input_23.txt
scala A 12 0 0 0 < input_23.txt
rm *.class
