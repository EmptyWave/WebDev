class Review {
  constructor(id,name,text,isApproved = false){
    this.id = id;
    this.author = name;
    this.text = text;
    this.isApproved = isApproved;
  }
  _init(){

    this._render();
  }
  _render(){

  }
  _check(){
    this._setApprove();
    this._render();

    this._remove()
  }
  _remove(){

  }
  _setApprove(){
    this.isApproved = true;
  }
}