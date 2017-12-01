function WareHouse(apiKey){
  var xhttp = new XMLHttpRequest();
  var warehouse = this;
  xhttp.onreadystatechange = function() {
      if (xhttp.readyState == 4){
          if(xhttp.status == 200){
              //alert("success")
              warehouse.apiKey = apiKey;
              warehouse.sendRequest = sendorderWrapper;
              warehouse.getAllItemsOfSeller = getAllItemWrapper;
              warehouse.getAnItemDetail = getItemDetailWrapper;
              warehouse.addNewItem = addItemWrapper
              warehouse.response = true
          }
          else if(xhttp.status == 401){
             warehouse.response = false
            //alert('There was a problem with the request.')
          }
      } 
  };
  xhttp.open("GET", "http://localhost:3000/api/checkAPIkey/"+apiKey, true);
  xhttp.setRequestHeader( "Content-Type","application/x-www-form-urlencoded");
  xhttp.send();
}

var addItemWrapper= function(sku, quantity){
    var apiKey = this.apiKey
    var warehouse = this
    var xhttp = new XMLHttpRequest();
    xhttp.responseType = "json"
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       warehouse.response = xhttp.response
    }
  };
  xhttp.open("POST", "http://localhost:3000/api/inventory", true);
  xhttp.setRequestHeader( "Content-Type","application/x-www-form-urlencoded");
  xhttp.send('sku='+sku+'&quantity='+quantity+'&apiKey='+apiKey);
}

var sendorderWrapper = function(sku, quantity){
  var apiKey = this.apiKey
  var warehouse = this
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       warehouse.response = xhttp.responseText
    }
  };
  xhttp.open("POST", "http://localhost:3000/api/orders", true);
  xhttp.setRequestHeader( "Content-Type","application/x-www-form-urlencoded");
  xhttp.send('sku='+sku+'&quantity='+quantity+'&apiKey='+apiKey);
}

//done

var getAllItemWrapper = function(){
  var apiKey = this.apiKey
  var warehouse = this
  var xhttp = new XMLHttpRequest();
  xhttp.responseType = "json"
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        //alert(xhttp.responseText)
        //console.log(JSON.stringify(xhttp.responseText))
        warehouse.data =  xhttp.response
      }
      else{
        return ""
      }
    };
  //console.log(apiKey)
  url = "http://localhost:3000/api/inventory?apiKey=" + apiKey
  //console.log(url)
  xhttp.open("GET", url, true);
  xhttp.send();
}


//done

var getItemDetailWrapper = function(sku){
  var apiKey = this.apiKey
  var warehouse = this
  var xhttp = new XMLHttpRequest();
  xhttp.responseType = "json"
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        warehouse.data = xhttp.response;
      }
    };
  xhttp.open("GET", "http://localhost:3000/api/inventory/"+sku + "?apiKey="+apiKey, true);
  xhttp.send();
}

