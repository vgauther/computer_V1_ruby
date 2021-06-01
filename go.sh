# ruby computer.rb "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"
# ruby computer.rb "5 * X^0 + 4 * X^1 = 4 * X^0"
# ruby computer.rb "6.7 * X^0 + 4.5 * X^1 = 0 * X^0"
# ruby computer.rb "0 * X^0 + 0 * X^1 = 0 * X^0 - 0 * X^1"
# ruby computer.rb "5.2 * X^0 - 4.5 * X^1 = 4 * X^0 - 40.2 * X^1"

echo "$(tput setaf 6)/**************************************\\"
echo "|************** MAIN TEST **************|"
echo "\\**************************************/$(tput sgr 0)"
echo ""

echo "----------------"
echo "Polynom degree 2"
echo "----------------"

echo ""
echo "$(tput setaf 113)positive delta$(tput sgr 0)"
echo ""

ruby computer.rb "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"

echo ""
echo "$(tput setaf 113)delta = 0$(tput sgr 0)"
echo ""

ruby computer.rb "2 * X^0 + 4 * X^1 + 2 * X^2 = 0 * X^0"

echo ""
echo "$(tput setaf 113)negative delta$(tput sgr 0)"
echo ""

ruby computer.rb "5 * X^0 + 4 * X^1 + 9.3 * X^2 = 1 * X^0"

echo ""

echo "----------------"
echo "Polynom degree 1"
echo "----------------"
echo ""

ruby computer.rb "5 * X^0 + 4 * X^1 = 1 * X^0"
echo ""

ruby computer.rb "24 * X^0 - 42 * X^1 = 0 * X^0"

echo "----------------"
echo "Polynom degree 0"
echo "----------------"
echo ""

ruby computer.rb "24 * X^0 - 42 * X^0 = 0 * X^0"
echo ""

ruby computer.rb "24 * X^0 = 0 * X^0"
echo ""

echo ""
read -n 1 -s -r -p "Press any key to continue"
echo ""
echo ""

echo "$(tput setaf 6)/**************************************\\"
echo "|****** HIGH POTENTIAL ERROR TEST ******|"
echo "\\**************************************/$(tput sgr 0)"
echo ""

echo "--------------------"
echo "Asked On The Subject"
echo "--------------------"
echo ""

ruby computer.rb "42 * X^0 = 42 * X^0"
echo ""

echo ""
read -n 1 -s -r -p "Press any key to continue"
echo ""
echo ""

echo "-----------------------"
echo "Test for equal equation"
echo "-----------------------"
echo ""
echo "level $(tput setaf 3)easy$(tput sgr 0) :"
echo ""

ruby computer.rb "6 * X^3 = 0 * X^0"
echo ""
ruby computer.rb "6 * X^2 = 6 * X^2"
echo ""
ruby computer.rb "6 * X^1 = 6 * X^1"
echo ""
ruby computer.rb "6 * X^0 = 6 * X^0"

echo ""
echo "level $(tput setaf 209)medium$(tput sgr 0) :"
echo ""

ruby computer.rb "6 * X^0 + 42 * X^1 = 6 * X^0 + 42 * X^1"
echo ""
ruby computer.rb "24 * X^2 + 42 * X^1 = 24 * X^2 + 42 * X^1"
echo ""
ruby computer.rb "24 * X^2 + 42 * X^2 = 24 * X^2 + 42 * X^2"
echo ""
ruby computer.rb "24 * X^2 + 42 * X^0 = 24 * X^2 + 42 * X^0"
echo ""
echo "level $(tput setaf 1)hard$(tput sgr 0) :"
echo ""

ruby computer.rb "1 * X^0 + 2 * X^1 - 3 * X^3 = 1 * X^0 + 2 * X^1 - 3 * X^3"
echo ""
ruby computer.rb "1 * X^0 + 2 * X^1 - 3 * X^3 + 1 * X^0 + 2 * X^1 - 3 * X^3 = 1 * X^0 + 2 * X^1 - 3 * X^3 + 1 * X^0 + 2 * X^1 - 3 * X^3"
echo ""
ruby computer.rb "1 * X^0 + 2 * X^1 - 3 * X^4 + 1 * X^5 + 2 * X^1 - 3 * X^3 = 1 * X^0 + 2 * X^1 - 3 * X^4 + 1 * X^5 + 2 * X^1 - 3 * X^3"
