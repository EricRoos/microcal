import { Controller } from "@hotwired/stimulus"
import Hammer from 'hammerjs'

export default class extends Controller {
  static targets = ['deletePanel']
  connect(){
    let hammer = new Hammer(this.element);
    let actualPanel = this.deletePanelTarget.querySelector('.animate__animated');

    actualPanel.addEventListener('animationend', ({animationName}) => {
      if(animationName === 'slideOutRight'){
        actualPanel.classList.remove('animate__slideOutRight');
        this.deletePanelTarget.classList.add('hidden')
      }
    });
    hammer.on('swipeleft', (ev) => {
      this.deletePanelTarget.classList.remove('hidden')
      actualPanel.classList.add('animate__slideInRight');
      actualPanel.classList.remove('hidden');
    })
    hammer.on('swiperight', (ev) => {
      actualPanel.classList.remove('animate__slideInRight');
      actualPanel.classList.add('animate__slideOutRight');
    })

    this.element.addEventListener('dragstart', (ev) => {
      ev.dataTransfer.setData("id", this.element.getAttribute('data-line-item-id'));
    });
  }
}
