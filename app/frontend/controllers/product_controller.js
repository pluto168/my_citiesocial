import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    static targets = [ "quantity","sku","addToCartButton" ]

    add_to_cart(evt) {
        evt.preventDefault();

        let product_id = this.data.get("id");
        let quantity = this.quantityTarget.value; 
        let sku = this.skuTarget.value;
                                
        if(quantity > 0 ){
            this.addToCartButtonTarget.classList.add('is-loading');     //數量大於0,就會開始loading
            
            let data = new FormData();
            data.append("id",product_id);
            data.append("quantity",quantity);
            data.append("sku",sku);
            //打api
            Rails.ajax({
                url: "/api/v1/cart",
                data: data,
                type: "POST",
                success: resp => {
                    if (resp.status === 'ok'){
                        let item_count = resp.items || 0 ;      //如果沒抓到就預設給0
                    
                        // console.log(resp);
                        //發一個全域event事件,
                        let evt = new CustomEvent('addToCart',{'detail': {item_count}});    //es5 {item_count:item_count}
                        document.dispatchEvent(evt);
                    }
                },
                error: err => {
                    console.log(err);
                },
                complete: () => {
                    this.addToCartButtonTarget.classList.remove('is-loading');     //移除loading button,不管成功or失敗
                }
            });
        }
    }
    

    quantity_minus(evt){
        evt.preventDefault();
        let q = Number(this.quantityTarget.value);
        if(q > 1){                                    //0時不能減
            this.quantityTarget.value = q - 1;
        }
        // console.log('-');
    }
    quantity_plus(evt){
        evt.preventDefault();
        let q = Number(this.quantityTarget.value);
        this.quantityTarget.value = q + 1;
        // console.log('+');
    }
}