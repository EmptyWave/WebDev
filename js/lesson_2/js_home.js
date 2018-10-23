"use strict";

// № 1
/*  значение возвращаемое оператором инкремента зависит от его расположения относительно операнда
    перед операндом - прибавляется 1, а результатом является увеличенное значение
    после операнда - прибавляется 1, но результатом является неувеличенное значение                 */

let a = 1, b = 1, c, d;

c = ++a;    //a=1
alert(c); // 2  // c=2 a=2

d = b++;    //b=1
alert(d); // 1  //d=1 b=2

c = 2 + ++a;    //a=3
alert(c); // 5  //c=5 a=3

d = 2 + b++;    //b=2
alert(d); // 4  //d=4 b=3

alert(a); // 3
alert(b); // 3

// № 2

//let a = 2;
//let x = 1 + (a *= 2);
//  a=2, сначала действие в скобках, получаем a=4, прибавляем 1, в итоге получаем x=5 a=4

// № 3

const a1 = 15, b1 = -2;

if (a1 >= 0 && b1 >= 0) {
    console.log(a1 - b1);
} else if (a1 >= 0 && b1 >= 0) {
    console.log(a1 * b1);
} else {
    console.log(a1 + b1);
}

// № 4

/**v.1
 * Функция производит сложение 2 переданных числа.
 * @param {number} arg1 Первое слагаемое
 * @param {number} arg2 Второе слагаемое
 * @returns {number} Возвращает сумму переданных чисел
 */
function sum(arg1, arg2) {
    return arg1 + arg2;
}

/**v.1
 * Функция производит сложение с отрицательным числом XD
 * @param {number} arg1 Уменьшаемое число
 * @param {number} arg2 Вычитаемое число
 * @returns {number} Возвращает разность 2 переданных чисел
 */
function sub(arg1, arg2) {
    return arg1 - arg2;
}

/**v.1
 * Функция перемножает 2 переданныч числа
 * @param {number} arg1 Множимое число
 * @param {number} arg2 Множитель
 * @returns {number} Возвращает произведение переданных чисел
 */
function mult(arg1, arg2) {
    return arg1 * arg2;
}

/**v.1
 * Функция выполнгяет деление переданных чисел
 * @param {number} arg1 Делимое число
 * @param {number} arg2 Делитель
 * @returns {number} Возвращает отношение переданных чисел
 */
function div(arg1, arg2) {
    return arg1 / arg2;
}

/**v.1.1
 * Функция производит сложение 2 переданных числа.
 * @param {number} arg1 Первое слагаемое
 * @param {number} arg2 Второе слагаемое
 * @returns {number} Возвращает сумму переданных чисел
 */
const sum1 = (arg1, arg2) => arg1 + arg2;

/**v.1.1
 * Функция производит сложение с отрицательным числом XD
 * @param {number} arg1 Уменьшаемое число
 * @param {number} arg2 Вычитаемое число
 * @returns {number} Возвращает разность 2 переданных чисел
 */
const sub1 = (arg1, arg2) => arg1 - arg2;

/**v.1.1
 * Функция перемножает 2 переданныч числа
 * @param {number} arg1 Множимое число
 * @param {number} arg2 Множитель
 * @returns {number} Возвращает произведение переданных чисел
 */
const mult1 = (arg1, arg2) => arg1 * arg2;

/**v.1.1
 * Функция выполнгяет деление переданных чисел
 * @param {number} arg1 Делимое число
 * @param {number} arg2 Делитель
 * @returns {number} Возвращает отношение переданных чисел
 */
const div1 = (arg1, arg2) => arg1 / arg2;


console.log(sum1(6, 2));
console.log(sub1(6, 2));
console.log(mult1(6, 2));
console.log(div1(6, 2));

// № 5
// используем функции из 4 задания

console.log(mathOperation(6, 2, "+"));
console.log(mathOperation(6, 2, "-"));
console.log(mathOperation(6, 2, "*"));
console.log(mathOperation(6, 2, "/"));

/**
 * Функция выполняет одну из выбранных операций, для 2 переданных чисел.
 * - сложение, вычитание, умножение, деление
 * @param {number} arg1 Первый аргумент для вычеслений
 * @param {number} arg2 Второй аргумент для вычислений
 * @param {string} operation Строка с названиенм операции
 * @returns {number} Возвращает результат выбранной операции
 */
function mathOperation(arg1, arg2, operation) {
    switch (operation) {
        case "+":
            return sum(arg1, arg2);
        case "-":
            return sub(arg1, arg2);
        case "*":
            return mult(arg1, arg2);
        case "/":
            return div(arg1, arg2);
    }
}

// № 6

let cash = parseInt(prompt('Какую сумму вы хотите внести на счет?'));

cash >= 0 ? alert(`Ваша сумма в ${cash} ${getDec(cash)} успешно зачислена.`) : alert(`Не верная сумма!`);

/**
 * Функция выбирает необходимое склонение валюты для переданного числа
 * @param cash {number} Число для определеня склонения
 * @returns {string} Возвращает вариацию валюты, в правильном склонении, для переданного числа
 */
function getDec(cash) {
    if (parseInt(cash / 10 % 10) === 1){
        return 'рублей';
    } else {
        switch (cash % 10) {
            case 1:
                return 'рубль';
            case 2:
            case 3:
            case 4:
                return 'рубля';
            default:
                return 'рублей';
        }
    }
}