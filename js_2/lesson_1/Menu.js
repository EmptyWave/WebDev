class Menu {
    constructor(id, buttonId, className, items){
        this.id = id;
        this.buttonId = buttonId;
        this.className = className;
        this.items = items;
    }
    render(){
        let result = `<ul class="${this.className}" id="${this.id}">`;
        for (let i = 0; i < this.items.length; i++){
            if(this.items[i] instanceof MenuItem) {
                result += this.items[i].render()
            }
            if(this.items[i] instanceof SubMenu) {
                result += this.items[i].render()
            }
        }
        result += `</ul>`;
        return result
    }
    remove(){
        let element = document.getElementById(this.id);
        let button = document.getElementById(this.buttonId);
        button.addEventListener('click',() => element.remove());
    }
}