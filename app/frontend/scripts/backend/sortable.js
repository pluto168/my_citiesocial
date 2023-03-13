import Sortable from 'sortablejs';


document.addEventListener("DOMContentLoaded", () => {
  let el = document.querySelector('.sortable-items');

  if (el){
      Sortable.create(el, {
        onEnd: event => {
          let [model, id] = event.item.dataset.item.split('_');
  
          console.log(model,id);
        }
      })
  }
});
