import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  String inputString = input();

  print("Rolling $inputString");
  Roll roll = makeDie(inputString);
  print("Total: ${roll.rollDice()}");
  print("Rolls: ${roll.getlastRolls()}");
}

input() {
  print("enter a dice in from 1d6+5");
  return stdin.readLineSync() ?? input();
}

makeDie(String input) {
  if (input.contains("+")) {
    List<String> splitInput = input.split("+");
    List<String> splitDice = splitInput[0].split("d");
    int numberOfDice = int.parse(splitDice[0]);
    int dieSize = int.parse(splitDice[1]);
    int bonus = int.parse(splitInput[1]);
    return Roll(numberOfDice, dieSize, bonus);
  }
  if (input.contains("-")) {
    List<String> splitInput = input.split("-");
    List<String> splitDice = splitInput[0].split("d");
    int numberOfDice = int.parse(splitDice[0]);
    int dieSize = int.parse(splitDice[1]);
    int bonus = int.parse(splitInput[1]);
    return Roll(numberOfDice, dieSize, -bonus);
  }
  List<String> splitInput = input.split("d");
  int numberOfDice = int.parse(splitInput[0]);
  int dieSize = int.parse(splitInput[1]);
  return Roll(numberOfDice, dieSize);
}

class Roll {
  int total = 0;
  int numberofDice = 0;
  int dieSize = 0;
  int bonus = 0;
  List<int> rolls = [];

  Roll(int numDice, int dieSize, [int bonus = 0]) {
    this.numberofDice = numDice;
    this.dieSize = dieSize;
    this.bonus = bonus;
  }

  rollDice() {
    total = 0;
    rolls = [];
    for (int i = 0; i < numberofDice; i++) {
      rolls.add(Random.secure().nextInt(dieSize) + 1);
      total += rolls[i];
    }
    total += bonus;
    return total;
  }

  getlastRolls() {
    return rolls;
  }
}
