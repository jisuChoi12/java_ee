var xhr = null;
function startMethod() {
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = resultProcess;
	xhr.open("GET", "ajaxExam.xml", true);
	xhr.send(null);
}

function resultProcess() {
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			processXML();
		}
	}
}

function processXML() {
	/*
	 * var message = ""; var xmlDoc = xhr.responseXML; var subjects =
	 * xmlDoc.getElementsByTagName("subject"); for(var i=0; i<subjects.length;
	 * i++){ var subject = subjects.item(i); var codeNumber =
	 * subject.getElementsByTagName("codeNumber").item(0).firstChild.nodeValue;
	 * var titleName =
	 * subject.getElementsByTagName("titleName").item(0).firstChild.nodeValue;
	 * var roomNumber =
	 * subject.getElementsByTagName("roomNumber").item(0).firstChild.nodeValue;
	 * 
	 * message += "<tr><td>"+codeNumber+"</td><td>"+titleName+"</td><td>"+roomNumber+"</td></tr>"; }
	 * document.getElementById("resultDisplay").innerHTML = message;
	 */
	
	// 화면 클리어
	var trChild = document.getElementById("resultDisplay").childNodes;
	for(var i=0; i<trChild.length; i++){
		trChild[i].remove();
		i--;
	}
	
	/*if(trChild.length>0) return false;*/
	
	var xmlDoc = xhr.responseXML;
	var trTag;
	var tdTag;
	var subjects = xmlDoc.getElementsByTagName("subject");
	for (var i = 0; i < subjects.length; i++) {
		trTag = document.createElement("tr");

		var childs = subjects[i].childNodes;
		for (var j = 0; j < childs.length; j++) {
			if (childs[j].firstChild != null) { // 공백값이 들어오지 않을때만
				tdTag = document.createElement("td");

				var text = childs[j].firstChild;

				tdTag.appendChild(text);
				trTag.appendChild(tdTag);
			}
		}
		document.getElementById("resultDisplay").appendChild(trTag);
	}

}