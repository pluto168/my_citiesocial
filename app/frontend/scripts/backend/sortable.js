import Sortable from 'sortablejs';
import Rails from '@rails/ujs';


document.addEventListener("DOMContentLoaded", () => {
  let el = document.querySelector('.sortable-items');

  if (el){
    Sortable.create(el, {
      onEnd: event => {
        let [model, id] = event.item.dataset.item.split('_'); 

        let data = new FormData();
        data.append("id",id);
        data.append("from", event.oldIndex);
        data.append("to", event.newIndex);

        Rails.ajax({
          url: '/astroser/categories/sort',    //開一個路徑url,controller加入sort
          type: 'PUT',  //更新用put
          data:data,    //ES6 data可以只寫一個 
          success: resp => {
            console.log(resp);
          }, 
          error: err => {
            console.log(err);
          }
        })
      }
    })
  }
});
