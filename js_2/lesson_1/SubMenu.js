class SubMenu extends Menu{
  constructor(id, className, subHref, subName, items){
    super(id, className, items);
    this.subHref = subHref;
    this.subName = subName;
  }

  render(){
    let result = `<li class="${this.className}" id="${this.id}"><a href="${this.subHref}">${this.subName}</a>`;
    result +=  super.render();
    result += `</li>`;
    return result
  }

  remove(){
    super.remove()
  }
}