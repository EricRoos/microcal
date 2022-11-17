import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    setTimeout(this.close.bind(this), 3000);
  }

  close(){
    let animatedElement = this.element;
    animatedElement.addEventListener('animationend', () => {
      this.element.remove();
    });
    animatedElement.classList.add('animate__backOutUp')
  }
}
