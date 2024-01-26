#include <iostream>
#include <cstdlib>
#include <vector>
#include <random>

// built with clion
int main() {
    std::cout << "Enter Dice Roll in format 2d6+3: ";
    std::string input;
    std::cin >> input;
    std::cout << std::endl;

    int dind;
    dind = input.find('d');

    int numDice = std::stoi(input.substr(0, dind));
//    find mod symbol
    int mind;
    mind = input.find('+');
    if (mind == -1) {
        mind = input.find('-');
    }
    if (mind == -1) {
        mind = input.length();
    }


    int sides = std::stoi(input.substr(dind + 1, mind - dind - 1));

//    init random
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, sides);


    std::vector<int> rolls(numDice);

    for (int i = 0; i < numDice; i++) {
        rolls.at(i) = dis(gen);
    }
    int mod = std::stoi(input.substr(mind, input.length() - mind));
    int sum = 0;
    for (int i = 0; i < numDice; i++) {
        sum += rolls.at(i);
    }
    sum += mod;
    std::cout << "Rolls: ";
    for (int i = 0; i < numDice; i++) {
        std::cout << rolls.at(i) << " ";
    }
    std::cout << std::endl;
    std::cout << "Sum: " << sum << std::endl;


    return 0;
}
//make class?
