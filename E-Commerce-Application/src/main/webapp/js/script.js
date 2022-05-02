function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        //no item in cart
        let products = [];
        let prod = {prodId: pid, prodName: pname, prodQuantity: 1, prodPrice: price};
        products.push(prod);
        localStorage.setItem("cart", JSON.stringify(products));
        $(".checkout-btn").removeClass("disable");
        console.log("Product added");
    } else {
        //items in cart already present
        let pcart = JSON.parse(cart);

        let oldProd = pcart.find((item) => item.prodId == pid);
        if (oldProd) {
            //we have to increase quantity
            //oldProd.prodQuantity = oldProd.prodQuantity + 1;
            pcart.map((item) => {
                if (item.prodId == oldProd.prodId) {
                    item.prodQuantity = oldProd.prodQuantity + 1;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased");
        } else {
            //we have to add product
            let prod = {prodId: pid, prodName: pname, prodQuantity: 1, prodPrice: price};
            pcart.push(prod);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product added");
        }
    }
    updateCart();
}


//update cart...
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        //empty cart
        console.log("Cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Please add Items, your cart is empty.</h3>");
        $(".checkout-btn").addClass("disable");
    } else {
        //cart contains items
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        $(".checkout-btn").removeClass("disable");
        let table = `
            <table class='table table-hover'>
                <thead class='thead-light'>
                    <tr>
                        <th scope="col">Item Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total Price</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>            
            `;

        let totalPrice = 0;

        cart.map((item) => {
            table += `
                <tr>
                    <td>${item.prodName}</td>
                    <td>${item.prodPrice}</td>
                    <td>${item.prodQuantity}</td>
                    <td>${item.prodQuantity * item.prodPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.prodId})' class='btn btn-outline-warning btn-sm'>Remove</button></td>
                </tr>
            `;
            totalPrice += item.prodPrice * item.prodQuantity;
        });

        table = table + `
                <tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice}</td></tr>
            </table>`;
        $(".cart-body").html(table);

    }
}

//delete item from cart
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let newCart = cart.filter((item) => item.prodId != pid);
    localStorage.setItem("cart", JSON.stringify(newCart));
    updateCart();
}

$(document).ready(function () {
    updateCart();
})