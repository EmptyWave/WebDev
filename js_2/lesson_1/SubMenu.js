class SubMenu extends Menu{
  constructor(id, buttonId, className, subHref, subName, items){
    super(id, buttonId, className, items);
    this.subHref = subHref;
    this.subName = subName;
  }

  render(){
    let result = `<li class="${this.className}" id="${this.id}"><a href="${this.subHref}">${this.subName}</a>`;
    result +=  super.render();
    result += `</li>`;
    return result
  }
}