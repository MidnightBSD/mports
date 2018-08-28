var loader = new Image(220, 19);
loader.src = '/magus/elements/ajax-loader.gif';

function showPorts(id, status) {
	var td = document.getElementById("ports-display");
	if (status.length == 0) {
		td.style.display = 'none';
		return false;
	}

	td.innerHTML = '<p style="text-align: center"><img src="' + loader.src + '" /></p>';
	td.style.display = 'table-cell';

	var url = '//www.midnightbsd.org/magus/async/run-ports-list?run=' + id + '&status=' + status + '&tm=' + (new Date).getTime();
	sendAsycQuery(url, process_showPorts);
	return false;
}

function process_showPorts() {
    // only if req shows "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            var result = eval( "(" + req.responseText + ")" );
            var td = document.getElementById("ports-display");
	    td.innerHTML = result.html;	    
        } else {
            alert("There was a problem retrieving the data:\n" + req.statusText);
        }
    }
}

function showEvents(machine, run) {
	var td = document.getElementById("events-display");

	if (run.length == 0) {
		td.style.display = 'none';
		return false;
	}

	td.innerHTML = '<p style="text-align: center"><img src="' + loader.src + '" /></p>';
	td.style.display = 'table-cell';

	var url = '//www.midnightbsd.org/magus/async/machine-events?machine=' + machine + '&run=' + run;
	sendAsycQuery(url, process_showEvents);
	return false;
}

function process_showEvents() {
    // only if req shows "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            var result = eval( "(" + req.responseText + ")" );
            var td = document.getElementById("events-display");
	    td.innerHTML = result.html;	    
        } else {
            alert("There was a problem retrieving the data:\n" + req.statusText);
        }
    }
}



function sendAsycQuery(url, callback) {
    // branch for native XMLHttpRequest object	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.open("GET", url, true);
        req.setRequestHeader('Content-type', 'application/x-json');
        //req.setRequestHeader('Connection', 'close');
        req.onreadystatechange = callback
        req.send(null);
    // branch for IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.open("GET", url + query, true);
            req.onreadystatechange = callback;
            req.setRequestHeader('Content-Type', 'application/x-json');
           // req.setRequestHeader('Connection', 'close');
            req.send(null);
        }
    } else {
        return ' ';
    }
}


function confirm_reset() {
	return confirm('Are you sure?')
}

/*
function edit_this(e) {
	var class = e.getAttribute("magusclass");
	var id    = e.getAttribute("uid");
	var value = e.firstChild.nodeValue;

	var pop_up = document.createElement("div");
	pop_up.className = 'edit-popup';
}

*/
