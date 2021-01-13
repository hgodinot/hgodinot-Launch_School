counter=0
max=15

while [[ $counter -le $max ]]
do
  echo $counter
  ((counter++))
done