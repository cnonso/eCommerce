
                       //This script is for removing lanlord from database
                       function RemoveFromDB(id_value) {
                           var landlordID = document.getElementById("landlord_ID");
                           var removeBtn = document.getElementById("btnRemoveLandlord");

                           landlordID.value = id_value;
                           removeBtn.click();
                       };

//This script will update count on a particular item in cart
function UpdateLandlord(id_value) {
    var landlordID = document.getElementById("landlord_ID");
    var updateBtn = document.getElementById('btnUpdateLandlord.ClientID');

    landlordID.value = id_value;;
    updateBtn.click();
};