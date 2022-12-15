import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  refresh(){
    this.element.reload();
  }
}
