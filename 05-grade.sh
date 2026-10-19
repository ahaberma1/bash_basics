#!/bin/sh


echo "What did you get in the first ITEC 3860 test?"
echo "Please give a numeric answer"
read grade

if [ $grade -ge 90 ]; then
   echo "You got an A. Nice."
elif [ $grade -ge 80 ]; then
   echo "You got a B. That's good."
elif [ $grade -ge 70 ]; then
   echo "You got a C. Not bad."
else
   echo "Time to work on some extra credit assignments"
fi

# exercise: write a script (that utilizes weather-util) 
# that prints "it's cold" if the temperature is < 40
# it's chilly if < 60, it's okay if < 70 and, it's hot for 
# everything else

if command -v weather-util >/dev/null 2>&1; then
   echo "Which weather station ID (e.g. KATL)?"
   read station
   temp=$(weather-util "$station" --headers=Temperature -q | sed -n 's/.*: *\([-0-9.]*\) F.*/\1/p' | cut -d. -f1)
else
   echo "weather-util not found. What is the temperature (F)?"
   read temp
fi

if [ "$temp" -lt 40 ]; then
   echo "It's cold"
elif [ "$temp" -lt 60 ]; then
   echo "It's chilly"
elif [ "$temp" -lt 70 ]; then
   echo "It's okay"
else
   echo "It's hot"
fi
