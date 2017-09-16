# This is definitely an unconventional way to approach testing,
# but I do not have a lot of experience testing pure bash scripts.
# if this was a web app i would just use RSpec
echo "###############Test 1 - return 3 matching users (fuzzy) ######################"
echo ""
echo "|"
ruby test.rb "3" "1" "fr" "0" "0" "0"
echo "|"
echo ""
echo "################################# END Test 1 ############################"

echo "###############Test 2 - return 35 tickets (exact) ########################"
echo ""
echo "|"
# navigate around, make sure nothing breaks
ruby test.rb "1" "2" "0" "0" "3" "0" "2" "2" "incident" "0" "0" "0"
echo "|"
echo ""
echo "################################# END Test 2 ############################"

echo "###############Test 3 - return 0 organizations (exact) ########################"
echo ""
echo "|"
# navigate around, make sure nothing breaks
ruby test.rb "2" "1" "0" "0" "2" "0" "1" "1" "yas yas" "0" "0" "0"
echo "|"
echo ""
echo "################################# END Test 3 ############################"


echo "###############Test 4 - test bad inputs ########################"
echo ""
echo "|"
ruby test.rb "10" "1" "sfkjsldk" "02" "0" "30" "1" "2" "  !sdfs _+?><~!@#$~``" "0" "0" "0"
echo "|"
echo ""
echo "################################# END Test 4 ############################"

echo "############### Test 5 - just exit ########################"
echo ""
echo "|"
ruby test.rb "0"
echo "|"
echo ""
echo "################################# END Test 5 ############################"
