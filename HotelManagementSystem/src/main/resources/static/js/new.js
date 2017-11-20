 $(function(){
	$( "#datepicker1" ).datepicker({ dateFormat: 'yy-mm-dd',   
	 minDate: 0,
    maxDate: '+3M',});
	$( "#datepicker2" ).datepicker({ dateFormat: 'yy-mm-dd',   
		 minDate: 0,
	    maxDate: '+3M',});
	$('#create').hide();
	 $('#check').on('submit', function(e) {
	        e.preventDefault();
	        var q = $( '#phone' ).val();
	   	 $.getJSON("http://localhost:8080/customer/available/"+q+"/", checkfn);
	        });
	 });
function sel(room){
	var ht = "<p> Selected Room: "+room+"</p>";
	$('#sel').html(ht);
	$('#num').val(room);
}
function newcus(e){
	 e.preventDefault();
	 $.post("http://localhost:8080/customer/add",$('#newcus').serialize(),function(data){
		 $('#cid').val(data);
		 var q = "<p>Customer Added! Go Ahead and create a new reservation</p>";
		 $('#customer').html(q);
	 });
}
	$('#avl').click(function(){
	var q1 = $( '#datepicker1' ).val();
	var q2 =  $( '#datepicker2' ).val();
	 $.getJSON("http://localhost:8080/room/available/"+q1+"/"+q2+"/", successfn);
	});
	$('#crecus').click(function(){
		var q = "<h3>Create New Customer!</h3>"+
			"<form name='new' id='newcus' onsubmit='newcus(event)'>"+
		"<fieldset>"+
		"<label for='fName'>First Name:</label><input type='text' name='fName' required><br>"+
		"<label for='lName'>Last Name: </label><input type='text' name='lName' required><br>"+
		"<label for='address1'>Address1</label><input type='text' name='address1' required><br>"+
		"<label for='address2'>Address2</label><input type='text' name='address2'><br>"+
		"<label for='phone'>Phone:</label><input type='number' name='phone' required><br>"+
		"<label for='ctry'>Country:</label><input type='text' name='country' required><br>"+
		<!-- <label for="email">Email:</label><input type="email" name="email" required><br> -->
		"<label>DOB</label><input type='date' id='datepicker' name='dob' min='1900-01-01' max='2000-01-01' required><br>"+
		"<input type='submit' value='Done' class='button'></fieldset>";
		$('#customer').html(q);
		});
	function successfn(result){
	var out = " ";
	for(var r in result){
	out += "<a onclick='sel("+result[r].num+")'>"+result[r].num+"</a><br>";
	}
	$('#rooms').html(out);
 }
	function checkfn(data){
		if (data.fName=="yoyo"){
			console.log("data is null");
			$('#create').show();
			$('#cid').val('');
			$('#cus').html(" ");
		}
		else{
			$('#create').hide();
			var q = "<p> Customer Exists: First Name is: "+data.fName+" Id is: "+data.id+"</p>";
			$('#cus').html(q);
			$('#cid').val(data.id);
			
		}
	 }