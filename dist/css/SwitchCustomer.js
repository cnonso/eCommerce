
function showHide() {
    var btnConfirmPayment = document.getElementById("btnConfirmPayment");
    var btnConfirmPayment2 = document.getElementById("btnConfirmPayment2");
    var oldCustomerDiv = document.getElementById("oldCustomerDiv");
    var newCustomerDiv = document.getElementById("newCustomerDiv");
    var customerType = document.getElementById("customerType");
    var newCustomer = document.getElementById("newCustomer");
    var existingCustomer = document.getElementById("existingCustomer");
    var phoneAndAddr = document.getElementById("phoneAndAddr");


    if (customerType.checked) {
        btnConfirmPayment2.style.display = "inline-block";
        btnConfirmPayment.style.display = "none";
        oldCustomerDiv.style.display = "none";
        newCustomerDiv.style.display = "block";
        existingCustomer.style.display = "inline-block";
        newCustomer.style.display = "none";
        phoneAndAddr.style.display = "block";
    }
    else {
        btnConfirmPayment2.style.display = "none";
        btnConfirmPayment.style.display = "inline-block";
        oldCustomerDiv.style.display = "block";
        newCustomerDiv.style.display = "none";
        existingCustomer.style.display = "none";
        newCustomer.style.display = "inline-block";
        phoneAndAddr.style.display = "none";
    }
};
