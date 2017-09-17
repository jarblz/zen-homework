# # This is definitely an unconventional way to approach testing,
# # but I do not have a lot of experience testing pure bash scripts outside
# # of the context of a rails app.  There doesn't seem to be a clear path forward
# # with RSpec in this context.
#
# # However, I would argue that these tests provide coverage of over 90% of the functionality
# # The only downfall is that you have to visually inspect to make sure the tests return the
# # correct number of results.
#
# # Any crashes in the system are very obvious and easy to uncover quickly.
#
# echo -e "\033[4;34m###############Test 1 - return 3 matching users (fuzzy) ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: Search type 1 for users on 'name', makes sure that partial string "
# echo " match search works, and that it is case insensitive"
# echo "|"
# echo -e "\x1b[m"
# ruby ../environments/test.rb "3" "1" "fr" "0" "0" "0"
# echo -e "\033[1;36m"
# echo "|"
# echo -e "\x1b[m"
# echo -e "\033[4;34m############### END Test 1 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
# echo -e "\033[4;34m###############Test 2 - return 35 tickets (exact) ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: Search type 2 for tickets on 'type', makes sure that partial string "
# echo " match search works, and that it is case sensitive."
# echo " This also tests navigation through the interface."
# echo -e "| \x1b[m"
# # navigate around, make sure nothing breaks
# ruby ../environments/test.rb "1" "2" "0" "0" "3" "0" "2" "2" "incident" "0" "0" "0"
# echo -e "\033[1;36m | \x1b[m"
# echo -e "\033[4;34m############### END Test 2 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
# echo -e "###############Test 3 - return 0 organizations (fuzzy) ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: Testing a partial string match search (name) that returns nothing on organizations"
# echo " This also tests navigation through the interface."
# echo -e "| \x1b[m"
# # navigate around, make sure nothing breaks
# ruby ../environments/test.rb "2" "1" "0" "0" "2" "0" "1" "1" "yas yas" "0" "0" "0"
# echo -e "\033[1;36m | \x1b[m"
# echo -e "\033[4;34m############### END Test 3 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
# echo -e "\033[4;34m###############Test 4 - test bad inputs ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: testing bad input clauses on all levels of the menu navigation"
# echo -e "| \x1b[m"
# ruby ../environments/test.rb "10" "1" "sfkjsldk" "02" "0" "30" "1" "2" "  !sdfs _+?><~!@#$~``" "0" "0" "0"
# echo -e "\033[1;36m | \x1b[m"
# echo ""
# echo -e "\033[4;34m############### END Test 4 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
# echo -e "\033[4;34m############### Test 5 - just exit ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: Test exiting out of the top menu"
# echo -e "| \x1b[m"
# ruby ../environments/test.rb "0"
# echo -e "\033[1;36m | \x1b[m"
# echo ""
# echo -e "\033[4;34m############### END Test 5 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
# echo -e "\033[4;34m############### Test 6 - exact match on organization id (1 result) ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: testing exact match on organization search for _id"
# echo -e "| \x1b[m"
# ruby ../environments/test.rb "1" "2" "101" "0" "0" "0"
# echo -e "\033[1;36m | \x1b[m"
# echo ""
# echo -e "\033[4;34m############### END Test 6 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
# echo -e "\033[4;34m############### Test 7 - partial match on organization name (1 result) ######################\x1b[m "
# echo -e "\033[1;36m"
# echo "Description: testing partial word match on organization search for name.  Also tests case insensitivity on the search term"
# echo -e "| \x1b[m"
# ruby ../environments/test.rb "1" "1" "Th" "0" "0" "0"
# echo -e "\033[1;36m | \x1b[m"
# echo ""
# echo -e "\033[4;34m############### END Test 7 ######################\x1b[m "
#
# echo "|"
# echo "|"
# echo "|"
#
echo -e "\033[4;34m############### Test 8 - partial match on ticket subject (2 results) ######################\x1b[m "
echo -e "\033[1;36m"
echo "Description: testing partial word match on ticket search for subject."
echo -e "| \x1b[m"
ruby ../environments/test.rb "2" "1" " korea" "0" "0" "0"
echo -e "\033[1;36m | \x1b[m"
echo ""
echo -e "\033[4;34m############### END Test 8 ######################\x1b[m "
