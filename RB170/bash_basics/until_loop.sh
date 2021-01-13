num=7
target=14

until [[ $num -ge $target ]]
do
  echo $num
  ((num++))
  ((num++))
done
if [[ $num -eq $target ]]
then
  echo $num is odd
else
  echo $num is even
fi