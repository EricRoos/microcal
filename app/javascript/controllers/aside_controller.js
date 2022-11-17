import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close(){
    let animatedElement = this.element.querySelector('.animate__animated')
    animatedElement.classList.add('animate__slideOutDown')
  }

  connect(){
    let animatedElement = this.element.querySelector('.animate__animated')
    if(animatedElement){
      animatedElement.addEventListener('animationend', ({animationName}) => {
        if(animationName === 'slideOutDown'){
          this.element.remove();
        }
      });
    }
    this.element.addEventListener('turbo:before-fetch-request', (ev) => {
      if(ev.target == this.element){
        ev.preventDefault();
        let requestMethod = ev.detail.fetchOptions.method;
        if(requestMethod === 'GET'){
          console.log(this.element);
          let temp = document.getElementById("aside-default-content");
          let clon = temp.content.cloneNode(true);
          this.element.appendChild(clon);
          this.element.querySelector('turbo-frame').setAttribute('src', ev.detail.url);
        }else{
          ev.detail.resume();
        }
      }
    });
  }
}
