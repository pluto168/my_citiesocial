import bulmaCarousel from 'bulma-carousel';

document.addEventListener('DOMContentLoaded', ()=> {
  let element = document.querySelector('#carousel');    //檢查#carousel是否存在,有再執行
  if (element) {
    bulmaCarousel.attach('#carousel', {
      slidesToScroll: 1,
      slidesToShow: 3,
      infinite: true,
      autoplay: true
    });
  }
});
