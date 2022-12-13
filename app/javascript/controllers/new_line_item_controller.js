import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['form', 'loader', 'input', 'dropform']

  inputTargetConnected(element){
    element.addEventListener('dragover',(ev) => ev.preventDefault());
    element.addEventListener('drop',(ev) => {
      ev.preventDefault();
      const updateUrl = '/line_items/' + ev.dataTransfer.getData('id')+'?aside=false';
      this.dropformTarget.setAttribute('action', updateUrl);
      this.dropformTarget.requestSubmit();
    })
  }

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
