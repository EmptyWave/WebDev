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

let TicketNum = prompt('Enter ticket number ( 6 symbols )');
let NumPart1, NumPart2;

console.log(`Номер вашего билета = ${TicketNum}`);

NumPart1 = parseInt(parseInt(TicketNum) / 1000);
NumPart2 = TicketNum % 1000;

let SumPart1 = NumPart1 % 10 + parseInt(NumPart1 % 100 / 10) + parseInt(NumPart1 % 1000 / 100);
let SumPart2 = NumPart2 % 10 + parseInt(NumPart2 % 100 / 10) + parseInt(NumPart2 % 1000 / 100);

console.log(`Сумма первых трех цифр = ${SumPart1}`);
console.log(`Сумма последних трех цифр = ${SumPart2}`);

if (SumPart1 === SumPart2) {
    console.log('Вы обладатель счастливого билета!!!');
}
else {
    console.log('В этот раз вам не повезло!');
}




