"use strict";

/*const price1 = getPriceByCount('Яблоки', 4);
const price2 = getPriceByCount('Бананы', 5);
const price3 = getPriceByCount('Апельсины', 1);

alert(price1 ? price1 : 'товар не найден');
alert(price2 ? price2 : 'товар не найден');
alert(price3 ? price3 : 'товар не найден');*/

/*if (good === 'Бананы'){
    console.log('Цена на бананы 50руб./кг.')
} else if (good === 'Манго'){
    console.log('Цена на манго 80руб./кг.')
} else if (good === 'Яблоки' || good === 'Груши'){
    console.log('Цена на яблоки и груши 40руб./кг.')
} else if (good === 'Апельсины'){
    console.log('Цена на апельсины 100руб./кг.')
} else {
    console.log('Неизвестный фрукт')
}*/
/*function getPriceByCount(good, count) {
    const price = getGoodPrice(good);
    if (price){
        return price * count
    } else {
        console.error('ERR');
        return false;
    }
}

function getGoodPrice(good) {
    switch (good) {
        case 'Бананы':
            return 50;
        case 'Манго':
            return 80;
        case 'Яблоки':
        case 'Груши':
            return 40;
        case 'Апельсины':
            return 100;
        default:
            return false;
    }
}

function sayPrice(price = 'Неизвестна') {
    console.log(`Цена за товар: ${price}`)
}

sayPrice('50 руб.');
sayPrice();

function add(a, b) {
    return a + b;
}
const mySum = add(2, 3);
console.log(mySum);

function recursion(x) {
    if (x === 1 || x === -1) {
        return `${x}`;
    } else if (x > 0) {
        return recursion(x - 1) + " " + x;
    } else if (x < 0){
        return recursion(x + 1) + " " + x;
    } else return 0;
}
console.log(recursion(0));*/


// Game

let number;
let attempts;

resetGame();
tryGuessNumber();

function resetGame() {
    attempts = 0;
    number = Math.floor(Math.random() * 100);
}

function tryGuessNumber() {
    const userAnswer = parseInt(prompt('enter number (0 - 100)'));

    if (userAnswer === -1) {
        return alert('buy buy');
    } else if (Number.isNaN(userAnswer) || userAnswer < 0 || userAnswer >= 100) {
        alert('need some int value');
        return tryGuessNumber();
    }

    attempts++;

    if (userAnswer > number) {
        alert('попробуйте число меньше');
    } else if (userAnswer < number) {
        alert('попробуйте число больше');
    } else {
        alert(`Вы отгадали число с ${attempts} попытки`);
        if (!confirm('Хотите сыграть еще раз?')) {
            return;
        }
        resetGame();
    }
    tryGuessNumber();
}