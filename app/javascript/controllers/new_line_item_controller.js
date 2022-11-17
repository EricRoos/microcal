import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['form', 'loader']
  connect(){
    this.element.addEventListener('turbo:before-fetch-request', (ev) => {
      this.loaderTarget.classList.remove('hidden')
      this.formTarget.querySelectorAll("input").forEach( i => i.setAttribute("disabled", ""))
    });
  }

  submitForm(){
    let form = this.formTarget;
    if(form.checkValidity()){
      form.requestSubmit();
    }
  }
}
