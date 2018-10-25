"use strict";

// № 1

let i = 0;
do {
    if (i === 0) {
        console.log(`${i} – это ноль`)
    } else if (i % 2) {
        console.log(`${i} – нечетное число`)
    } else {
        console.log(`${i} – четное число`)
    }
    i++;
} while (i <= 10);

// № 2

for (let i = 0; i < 10; console.log(i++)) {}

// № 3

getPyramid(20);

function getPyramid(max) {
    let pyramid = '';
    for (let i = 0; i < max; i++) {
        console.log(pyramid += 'x');
    }
}

// № 4

for (let i = 2; i <= 1000000; i++) {
    if (checkNum(i)) console.log(i);
}

function checkNum(num) {
    for (let i = 2; i <= num/2; i++) {
        if (!(num % i)) return false;
    }
    return true;
}

// № 5

//const arr = [[2, 4, 6], [1, 5, 10], [7, 4, 1]];
const arr = [[-2, -4, -62], [-1, -5, -10], [-7, -4, -1]];
let maxIndex = 0;
let maxArr = [];

arr.forEach(function (secArr) {
    maxArr.push(arrSum(secArr));
});

let max = maxArr[0];
for (let i = 0; i < maxArr.length; i++) {
    if (maxArr[i] > max) {
        max = maxArr[i];
        maxIndex = i;
    }
}
console.log(`${maxIndex} – индекс массива с максимальной суммой`);
let min = arr[maxIndex][0];
for (let i = 0; i < arr[maxIndex].length; i++) {
    if (arr[maxIndex][i] < min) {
        min = arr[maxIndex][i];
    }
}
console.log(`${min} – наименьшее значение в массиве с максимальной суммой`);

function arrSum(arr) {
    let sum = 0;
    for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
    }
    return sum;
}

// № 6








