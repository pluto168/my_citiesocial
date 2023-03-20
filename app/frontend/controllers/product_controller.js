import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "quantity" ]

    connect(){
        
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