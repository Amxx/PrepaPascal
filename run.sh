#!/bin/bash

totaltime=60.0
steptime=0.01
p=1.0
l=0.3
a=0.2
d=0.01
alpha=2

echo "###################################"
echo "#            COMPILING            #"
echo "###################################"

./generator.sh

echo "###################################"
echo "#       RUNNING SIMULATION        #"
echo "###################################"

echo "output"					> input
echo ${totaltime}			>> input
echo ${steptime}			>> input
echo ${p}							>> input
echo ${a}							>> input
./build/sir						< input
gnuplot script/SIR.gnuplot

echo "output"					> input
echo ${totaltime}			>> input
echo ${steptime}			>> input
echo ${p}							>> input
echo ${l}							>> input
echo ${a}							>> input
echo ${d}							>> input
./build/sir5					< input
gnuplot script/SIR5.gnuplot

echo "output"					> input
echo ${totaltime}			>> input
echo ${steptime}			>> input
echo ${alpha}					>> input
./build/lotkavolterra	< input
gnuplot script/lotkavoltera.gnuplot


rm input output

echo "###################################"
echo "#       DISPLAYING RESULTS        #"
echo "###################################"

eog SIR.png
#eog SIR5.png
#eog lotkavoltera.png
