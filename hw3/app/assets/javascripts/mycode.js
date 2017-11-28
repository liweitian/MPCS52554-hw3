var sendorder = function(sku, quantity, seller,account){
	console.log(sku)
	console.log(quantity)
	console.log(seller)
	console.log(account)
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      alert(xhttp.responseText)
    }
  };
  xhttp.open("POST", "http://localhost:3000/api/orders", true);
  xhttp.setRequestHeader( "Content-Type","application/x-www-form-urlencoded");
  xhttp.send('sku='+sku+'&quantity='+quantity+'&seller='+seller+'&account='+account);
}

var getAllItem = function(){
	var xhttp = new XMLHttpRequest();
  	xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
      	alert(xhttp.responseText)
    	}
  	};
  xhttp.open("GET", "http://localhost:3000/api/inventory/", true);
  xhttp.send();
}

var getItemDetail = function(sku){
	var xhttp = new XMLHttpRequest();
  	xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
      	alert(xhttp.responseText)
    	}
  	};
  xhttp.open("GET", "http://localhost:3000/api/inventory/"+sku, true);
  xhttp.send();
}

var login = function(account, password){
	var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      alert(xhttp.responseText)
    }
  };
  xhttp.open("POST", "http://localhost:3000/login", true);
  xhttp.setRequestHeader( "Content-Type","application/x-www-form-urlencoded");
  var token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  xhttp.setRequestHeader('X-CSRF-Token', token);
  xhttp.send('account='+account+'&password='+password);
}

