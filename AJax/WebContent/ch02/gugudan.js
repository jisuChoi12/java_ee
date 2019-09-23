var xhr = null;
function getgugudan(){
	var dan = document.getElementById("dan").value;
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = gotgugudan;
	xhr.open("POST","getGugudan.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("dan="+dan);
}

function gotgugudan(){
	if(xhr.readyState == 4){
		if(xhr.status == 200){
			document.getElementById("displayArea").innerHTML = xhr.responseText;
			document.getElementById("displayArea").style.visibility = "visible";
		}
	}
}