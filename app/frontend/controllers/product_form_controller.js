import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template","link" ]   //form裡面的product-form.template

  add_sku(event){
    event.preventDefault();       //預設行為先擋下來

    let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
                  this.linkTarget.insertAdjacentHTML('beforebegin', content);

  }
  connect() {
  }

}