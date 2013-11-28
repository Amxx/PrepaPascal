set terminal pngcairo size 700,500 enhanced font 'Verdana,11'
set output 'SIR5.png'

#set logscale x

# Color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0000FF' lt 1 lw 1 # --- blue
set style line 2 lc rgb '#FF00FF' lt 1 lw 1 # --- red
set style line 3 lc rgb '#FF0000' lt 1 lw 1 # --- red
set style line 4 lc rgb '#FFFF00' lt 1 lw 1 # --- red
set style line 5 lc rgb '#00FF00' lt 1 lw 1 # --- green

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 11 back ls 11
set tics nomirror

set xlabel "Temps"
set xrange [0:*]
set ylabel "Population"
set yrange [0:*]

plot	"output" u 1:2 w line ls 1 lw 1 t "S", \
			"output" u 1:3 w line ls 2 lw 1 t "E", \
			"output" u 1:4 w line ls 3 lw 1 t "I", \
			"output" u 1:5 w line ls 4 lw 1 t "R", \
			"output" u 1:6 w line ls 5 lw 1 t "D"

