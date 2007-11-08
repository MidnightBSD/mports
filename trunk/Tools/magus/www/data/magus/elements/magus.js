var loader = new Image(220, 19);
loader.src = '/magus/elements/ajax-loader.gif';

function details_link(id) {
	var row = document.getElementById("result_" + id + "_row");
	var div = document.getElementById("result_" + id + "_details");

	if (!row.style.display || row.style.display == 'none') {
		row.style.display = 'table-row';
		if (!div.innerHTML) {
			var td = document.getElementById("result_" + id + "_details");
			td.innerHTML = '<p style="text-align: center"><img src="' + loader.src + '" /></p>';
			sendAsycQuery(id);
		} else {
			twiddle_link(id, 'hide');
		}
	} else {
		row.style.display = 'none';
		twiddle_link(id, 'show');
	}

	return false;
}

var url = 'http://cs.emich.edu/magus/index.cgi/results/async/';

function sendAsycQuery(query) {
    // branch for native XMLHttpRequest object	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.open("GET", url + query, true);
        req.setRequestHeader('Content-type', 'application/x-json');
        req.setRequestHeader('Connection', 'close');
        req.onreadystatechange = processDetailResults;
        req.send(null);
    // branch for IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.open("GET", url + query, true);
            req.onreadystatechange = processDetailResults;
            req.setRequestHeader('Content-Type', 'application/x-json');
            req.setRequestHeader('Connection', 'close');
            req.send(null);
        }
    } else {
        return ' ';
    }
}

function processDetailResults() {
    // only if req shows "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            var result = eval( "(" + req.responseText + ")" );

            var td = document.getElementById("result_" + result.id + "_details");

	    var html = '';
	    
	    if (result.subresults) {
	    	html = '<ul class="subresults">';
	    	for (i=0; i<result.subresults.length; i++) {
	    		html = html + '<li class="' + result.subresults[i].type + '">' + result.subresults[i].phase + ': ' + result.subresults[i].msg + '</li>';
	    	}
	    	html = html + '</ul>';
	    }
	    
	    if (result.log) {
	    	html = html + '<pre class="log">' + result.log + '</pre>';
	    }
	    
            td.innerHTML = html;
	    twiddle_link(result.id, 'hide');
            row.style.display   = 'table-row';
        } else {
            alert("There was a problem retrieving the data:\n" + req.statusText);
        }
    }
}


function twiddle_link(id, mode) {
	var link = document.getElementById("result_" + id + "_link");

	if (mode == 'show') {
		link.innerHTML = 'Show Details';
	} else {
		link.innerHTML = 'Hide Details';
	}
}


function confirm_delete() {
	return confirm('Delete this result?')
}
