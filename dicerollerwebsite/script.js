// get input box & roll button
inputBox = document.getElementById("rollInput");
rollbtn = document.getElementById("rollButton");

// add event listener to roll button
rollbtn.addEventListener("click", () => {
    // get input
    die = inputBox.value;
    // log input
    console.log("rolling " + die + " ...");
    // get output box
    outputBox = document.getElementById("output");
    // write output
    outputBox.innerHTML = "You rolled a " + makeDie(die);
});

makeDie(die){
    sides = parseInt(die.substring(die.indexOf("d") + 1, die.indexOf("+")));
    numDie = parseInt(die.substring(0, die.indexOf("d")));
    if (die.indexOf("+") != -1) {
        mod = parseInt(die.substring(die.indexOf("+") + 1, die.length));
    }
    else if (die.indexOf("-") != -1) {
        mod = parseInt(die.substring(die.indexOf("-") + 1, die.length)) * -1;
    }
    else {
        mod = 0;
    }
    total = 0;
    for (i = 0; i < numDie; i++) {
        total += Math.floor(Math.random() * sides) + 1;
    }
    total += mod;
    return total;
}


