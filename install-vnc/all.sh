while true;  do
  DISPLAY=:1 google-chrome "http://google.com" --profile-directory="Profile 1"   --user-data-dir=/root/chrome/ & 
  browserPID = $!
  sleep 3
  DISPLAY=:1 google-chrome "http://google.vn" --profile-directory="Profile 2"  --user-data-dir=/root/chrome/ &
  sleep 1800
  kill $browserPID
  sleep 1800
  killall chrome
done
