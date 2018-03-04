function openTab(evt, tabName) {
    		var i, tabcontent, tablinks;

    		// Get all elements with class="tabcontent" and hide them
    		tabcontent = document.getElementsByClassName("tabcontent");
    		for (i = 0; i < tabcontent.length; i++) {
       			tabcontent[i].style.display = "none";
    		}

    		// Get all elements with class="tablinks" and remove the class "active"
    		tablinks = document.getElementsByClassName("tablinks");
    		for (i = 0; i < tablinks.length; i++) {
    		    tablinks[i].className = tablinks[i].className.replace(" active", "");
    		}

    		// Show the current tab, and add an "active" class to the button that opened the tab
    		document.getElementById(tabName).style.display = "block";
    		evt.currentTarget.className += " active";
		}

		function genBtnClick(tabName){
			//object with checkbox info
			var list = {};
			list['tabName'] = tabName;
			//getting info from checkbox
			tab = document.getElementById(tabName);
			box = tab.getElementsByTagName("input");
			for (var i = 0; i<box.length; i++) {
				var key = box[i].getAttribute("name");
				var val = box[i].checked;
				list[key] = val;
			}
			//execute !!!Java!!! method 
			javaBridge.startStatGenerator(list);
		}