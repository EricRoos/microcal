import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    let val = this.element.value;
    this.element.defaultValue = "";
    this.element.value = val;
  }
}
