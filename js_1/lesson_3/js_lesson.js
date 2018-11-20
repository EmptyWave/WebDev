"use strict";
//////////////////////////////////////////////////////////////
let i = 0;
while (i < 10) {
    console.log(i++);
}
//////////////////////////////////////////////////////////////
let j = 10;
do {
    console.log(--j);
} while (j > 0);
//////////////////////////////////////////////////////////////
outerLoop:
    for (let k = 0; k < 10; k++) {
        console.log(k);
        for (let z = 0; z === 2; z++) {
            if (z % 2) {
                break outerLoop;
            }
        }
    }

//////////////////////////////////////////////////////////////
// цикл по индексам
let arr = [-2, -6, -3, -6];
for (const key in arr) {
    console.log(`index = ${key} ; element = ${arr[key]} ;`);
}
arr.sort();

for (const key in arr) {
    console.log(`index = ${key} ; element = ${arr[key]} ;`);
}
//////////////////////////////////////////////////////////////
// цикл по значениям
for (const val of arr) {
    console.log(`element = ${val} ;`);
}
//////////////////////////////////////////////////////////////
// Быки и коровы

let generatedNumbers;
let attemptsCount;

resetGame();
gameLoop();

function resetGame() {
    attemptsCount = 0;
    generatedNumbers = [];

    while (generatedNumbers.length < 4) {
        const part = Math.floor(Math.random() * 10); //[0,9]

        if (!generatedNumbers.includes(part)) {
            generatedNumbers.push(part);
        }
    }
    console.log(`Загаданное число - ${generatedNumbers}`);
}

function gameLoop() {
    while (true) {
        const guess = prompt('введи 4 числааааа');

        if (guess === '-1') {
            return alert('End Game');
        }

        if (!isValidGuess(guess)) {
            alert('необходимо ввести 4 целых положительных цифры');
            continue;
        }

        attemptsCount++;
        const result = getGuessResult(guess);

        if (result[0] !== 4){
            alert(` Быки - ${result[0]}, Коровы - ${result[1]}`);
            continue;
        }

        alert(`Поздравляю, вы отгадали число с ${attemptsCount} попытки!`)
        if (!confirm('Хотите сыграть еще раз?')){
            return alert('До свидания');
        }

        resetGame();
    }
}

function isValidGuess(guess) {
    if (guess.length !== 4){
        return false;
    }
    for (let i = 0; i < guess.length; i++) {
        if (!Number.isInteger(parseInt(guess[i]))) {
            return false;
        }
    }
    return true;
}

function getGuessResult(guess) {
    let result = [0, 0];

    for (let i = 0; i < guess.length; i++) {
        if (+guess[i] === generatedNumbers[i]) {
            result[0]++;
        }else if (generatedNumbers.includes(+guess[i]) ) {
            result[1]++;
        }
    }
    return result;
}


