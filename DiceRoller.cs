using System;

class DiceRoller {
    static void Main(string[] args){
        Console.WriteLine("Enter a roll in the form 1d6+5");
        string input = Console.ReadLine();
        string[] inputArray = input.Split('d', '+');
        int numberOfDice = int.Parse(inputArray[0]);
        int numberOfSides = int.Parse(inputArray[1]);
        int modifier = int.Parse(inputArray[2]);
        int total = 0;
        Random random = new Random();
        for (int i = 0; i < numberOfDice; i++){
            int roll = random.Next(1, numberOfSides + 1);
            total += roll;
            Console.WriteLine("Roll {0}: {1}", i + 1, roll);
        }
        total += modifier;
        Console.WriteLine("Total: {0}", total);
        

    }


}