import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    this.element.addEventListener('turbo:before-fetch-request', (ev) => {
    });
  }
}
