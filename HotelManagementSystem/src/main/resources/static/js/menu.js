function confirm(){
	if($('#room').val()==""){
		$('#order').append("<p class='msg'>Enter the room number to Confirm Order!</p>");
	}
	else{
		var room = $('#room').val();
		$.ajax({
			  type: "POST",
			  url: 'http://localhost:8080/menu/newOrder/'+room+'/',
			  data: JSON.stringify(items),
			  contentType: "application/json; charset=utf-8",
				  success: function(){$('#order').html("<h3>Order Info</h3><p id='msg' class='msg'>Order Confirmed!</p>");}
			});	
	}
}
function order(id, qty, amount) {
    this.i_id = id;
    this.qty = qty;
    this.amount = amount;
}
var items = new Array();
var c_count = 0;
function add(id, name, price){
	/* items.add(name); */
	var qt = $('#'+id).val();
	var ord = "";
	if(items.length==0){
		if(c_count==0){
	ord += "<button onclick='confirm()'>Confirm</button><br><label>Room-Num</label><input type='number' min='101' max='110' id='room'>";	
	c_count += 1;}
	}
	var n = find(id, qt);
	if(n!=0){
		qt = n;}
	var amount = price*qt;
	 ord += "<div id='o"+id+"'><p>"+name+" "+qt+"pcs $"+amount+" |<button onclick='rem("+id+")'>-</button></p></div>";
	items.push(new order(id,qt,amount));
	$('#order').append(ord);
}
function find(id, qt){
	for(var i in items){
		if(items[i].i_id==id){
			var q = Number(items[i].qty)+Number(qt);
			items.splice(i,1);
			$('#o'+id).remove();
			return q;
		}	
	}
	return 0;
}
function rem(id){
	for(var i in items){
		if(items[i].i_id==id)
			items.splice(i,1);
	}
	if(items.length==0){
		
	}
	$('#o'+id).remove();
}
function sel(type){
	var type = type;
	$.getJSON("http://localhost:8080/menu/type/"+type+"/", successfn);
}
function successfn(result){
	var out = "<ul> ";
	for(var r in result){
	out += "<li><div id='add'><button  onclick='add("+result[r].id+",\""+result[r].name+"\","+result[r].price+")'>Add</button><input type='number' min='1' value='1' id='"+result[r].id+"'></div><h4>"+result[r].name+"</h4><p id='price'>$ "+result[r].price+"</p></li>";
	}
	out += "</ul>";
	$('#items').html(out);
 }