function route_checkbox(checkbox){

    if(checkbox.checked==true)
        select_all_checkbox();
    else
        deselect_all_checkbox();


function select_all_checkbox(){
	for (i=0;i<document.form.elements.length;i++)
		if(document.form.elements[i].type == "checkbox")
			document.form.elements[i].checked=true
}
function deselect_all_checkbox(){
	for (i=0;i<document.form.elements.length;i++)
		if(document.form.elements[i].type == "checkbox")
			document.form.elements[i].checked=false
}
}
