"use strict";

const settings = {
    rowsCount: 10,
    colsCount: 10,
    startPositionX: 0,
    startPositionY: 0,
    startDirection: 'right',
    stepsInSecond: 5,
    playerCellColor: '#AA3333',
    emptyCellColor: '#EEEEEE',
    cellSize: 20,
};

const player = {
    x: null,
    y: null,
    direction: null,

    init(startX, startY, startDirection) {
        this.x = startX;
        this.y = startY;
        this.direction = startDirection;
    },

    setDirection(direction) {
        this.direction = direction;
    },

    /**
     * Обновляет положение объекта игрока на карте.
     */
    makeStep() {
        // Получаем координаты следующей точки.
        const nextPoint = this.getNextStepPoint();
        // Ставим координаты следующей точки вместо текущей.
        this.x = nextPoint.x;
        this.y = nextPoint.y;
    },

    /**
     * Возвращает следующую точку, в которой окажется игрок учитывая его направление.
     * @returns {{x: int, y: int}} Следующая точка игрока.
     */
    getNextStepPoint() {
        // Текущая позиция игрока.
        const point = {
            x: this.x,
            y: this.y,
        };

        // Смещаем игрока на один шаг в зависимости от направления.
        switch (this.direction) {
            case 'up':
                point.y--;
                break;
            case 'right':
                point.x++;
                break;
            case 'down':
                point.y++;
                break;
            case 'left':
                point.x--;
                break;
        }

        // Возвращаем позицию игрока после смещения.
        return point;
    },
};

const game = {
    player,
    settings,
    cellElements: null,
    containerElement: null,

    run(){
        this.init();
        this.render();
        setInterval(() => {
            if (this.canPlayerMakeStep()) {
                this.player.makeStep();
                this.render();
            }
        }, 1000/this.settings.stepsInSecond)
    },

    init(){
        this.player.init(this.settings.startPositionX,this.settings.startPositionY,this.settings.startDirection);
        this.containerElement = document.getElementById('game');
        this.initCells();
        this.initEventHandlers();
    },

    /**
     * Инициирует ячейки в игре.
     */
    initCells() {
        // Очищаем контейнер для игры.
        this.containerElement.innerHTML = '';
        this.containerElement.style.width = this.settings.colsCount * this.settings.cellSize +'px';
        this.containerElement.style.height = this.settings.rowsCount * this.settings.cellSize +'px';
        // Массив ячеек пока пуст.
        this.cellElements = [];
        // Пробегаемся в цикле столько раз, какое количество строк в игре.
        for (let row = 0; row < this.settings.rowsCount; row++) {
            // Создаем новую строку.
            const trElem = document.createElement('tr');
            // Добавляем строку в контейнер с игрой.
            this.containerElement.appendChild(trElem);
            // В каждой строке пробегаемся по циклу столько раз, сколько у нас колонок.
            for (let col = 0; col < this.settings.colsCount; col++) {
                // Создаем ячейку.
                const cell = document.createElement('td');
                // Записываем ячейку в массив ячеек.
                this.cellElements.push(cell);
                // Добавляем ячейку в текущую строку.
                trElem.appendChild(cell);
            }
        }
    },

    initEventHandlers() {
        document.addEventListener('keydown', event => this.keyDownHandler(event))
    },

    keyDownHandler(event) {
        switch (event.code){
            case 'KeyW':
            case "ArrowUp":
                return this.player.setDirection('up');
            case 'KeyD':
            case "ArrowRight":
                return this.player.setDirection('right');
            case 'KeyS':
            case "ArrowDown":
                return this.player.setDirection('down');
            case 'KeyA':
            case "ArrowLeft":
                return this.player.setDirection('left');
        }
    },

    render() {
        this.cellElements.forEach(cell => cell.style.backgroundColor = this.settings.emptyCellColor);

        const playerCell = document
            .querySelector(`tr:nth-child(${this.player.y + 1}`)
            .querySelector(`td:nth-child(${this.player.x + 1}`);

        playerCell.style.backgroundColor = this.settings.playerCellColor;
    },

    /**
     * Определяет может ли игрок совершить шаг.
     * @return {boolean} true, если шаг возможен, иначе false.
     */
    canPlayerMakeStep() {
        const nextPoint = this.player.getNextStepPoint();
        return nextPoint.x >= 0 &&
            nextPoint.x < this.settings.colsCount &&
            nextPoint.y >= 0 &&
            nextPoint.y < this.settings.rowsCount;
    },

};

window.addEventListener('load', () => game.run());





