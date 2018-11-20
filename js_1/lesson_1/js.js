"use strict";

// №1
let Tc = prompt('Enter temperature, °C');
let Tf = (9 / 5) * Tc + 32;
alert(Tf);

// №2
let admin, name;
name = 'Василий';
admin = name;
console.log(admin);

// №3
console.log(10 + 10 + "10");    // сначала складываются 2 числа, потом идет конкатенация
console.log(10 + "10" + 10);    // конкатенация 2 раза
console.log(10 + 10 + +"10");  // складываются 3 числа ( строка преобразуется из-за плюса )
console.log(10 / -"");          // делим на 0
console.log(10 / +"2,5");      // из-за запятой строка преобразуется в NaN

// №4
//defer - откладывает выполнение скрипта до окончания загрузки страницы
//async - скрипт выполняется без ожидания загрузки страницы, но и страница загружается не ожидая выполнения скрипта

// №5

let ticketNum = prompt('Enter ticket number ( 6 symbols )'),
    numPart1 = parseInt(parseInt(ticketNum) / 1000),
    numPart2 = ticketNum % 1000;

console.log(`Номер вашего билета = ${ticketNum}`);

let sumPart1 = numPart1 % 10 + parseInt(numPart1 % 100 / 10) + parseInt(numPart1 % 1000 / 100),
    sumPart2 = numPart2 % 10 + parseInt(numPart2 % 100 / 10) + parseInt(numPart2 % 1000 / 100);

console.log(`Сумма первых трех цифр = ${sumPart1}`);
console.log(`Сумма последних трех цифр = ${sumPart2}`);

if (sumPart1 === sumPart2) {
    console.log('Вы обладатель счастливого билета!!!');
} else {
    console.log('В этот раз вам не повезло!');
}




