/* Add here all your JS customizations */
$("#phone_number").mask("(999) 999-9999");
$(document).ready(function(){
	$('#search_property, #search_pin').click(function(){

		if(document.getElementById('search_property').checked) {

		  document.getElementById('address_pin').disabled = true;
		  document.getElementById('address_property').disabled = false;

		}
		else if(document.getElementById('search_pin').checked) {

		  document.getElementById('address_pin').disabled = false;
		  document.getElementById('address_property').disabled = true;
		}

	});

	$('#edit_data').click(function(){
		document.getElementById('edit_data').style.display = "none";
		document.getElementById('correct_data').style.display = "none";
		document.getElementById('save_data').style.display = "inline-block";
		document.getElementById('revert').style.display = "inline-block";
		var elements_actions = document.getElementsByClassName('actions');
		for(i = 0; i < elements_actions.length; i++){
			elements_actions[i].style.display = "block";
		}
		var elements_data = document.getElementsByClassName('confirm_data');
		for(i = 0; i < elements_data.length; i++){
			elements_data[i].style.display = "none";
		}
	});

	$('#revert').click(function(){
		document.getElementById('edit_data').style.display = "inline-block";
		document.getElementById('correct_data').style.display = "inline-block";
		document.getElementById('save_data').style.display = "none";
		document.getElementById('revert').style.display = "none";
		var elements_actions = document.getElementsByClassName('actions');
		for(i = 0; i < elements_actions.length; i++){
			elements_actions[i].style.display = "none";
		}
		var elements_data = document.getElementsByClassName('confirm_data');
		for(i = 0; i < elements_data.length; i++){
			elements_data[i].style.display = "block";
		}
	});

	$('#correct_data, #save_data').click(function(){
		
		sessionStorage.setItem("user_property", true);
		document.getElementById('edit_data').style.display = "none";
		document.getElementById('correct_data').style.display = "none";
		document.getElementById('revert').style.display = "none";
		var elements_actions = document.getElementsByClassName('actions');
		for(i = 0; i < elements_actions.length; i++){
			elements_actions[i].style.display = "block";
		}
		var elements_data = document.getElementsByClassName('confirm_data');
		for(i = 0; i < elements_data.length; i++){
			elements_data[i].style.display = "none";
		}
	});

	if (radio = document.getElementById('condominium_correct')) {
		if(radio.checked){
			condo_association = document.getElementById('condo_association');
			condo_association.style.display = "block";
		}
		$('#condominium_correct, #condominium_incorrect').click(function(){
			var radio = document.getElementById('condominium_correct');
			if(radio.checked){
				condo_association = document.getElementById('condo_association');
				condo_association.style.display = "block";
			}
			else{
				condo_association = document.getElementById('condo_association');
				condo_association.style.display = "none";
				document.getElementById('condoAssociation_No').checked = true;
				document.getElementById('condoAssociation_No').click();
			}
		});
	}		

	if (radio = document.getElementById('condoAssociation_Yes')) {
		if(radio.checked){
			association_data = document.getElementById('association_data');
			association_data.style.display = "block";
			console.log(document.getElementById('phone').value);
		}
		$('#condoAssociation_Yes, #condoAssociation_No').click(function(){
			var radio = document.getElementById('condoAssociation_Yes');
			if(radio.checked){
				association_data = document.getElementById('association_data');
				association_data.style.display = "block";
			}
			else{
				association_data = document.getElementById('association_data');
				association_data.style.display = "none";
				document.getElementById('associationName').value ='';
				document.getElementById('contact').value ='';
				document.getElementById('phone').value ='';
			}
		});
	}		

	if (radio = document.getElementById('hadAdditionalPins_Yes')) {
		if(radio.checked){
			pin_number = document.getElementById('pin_number');
			pin_number.style.display = "block";
		}
		$('#hadAdditionalPins_Yes, #hadAdditionalPins_No').click(function(){
			var radio = document.getElementById('hadAdditionalPins_Yes');
			if(radio.checked){
				pin_number = document.getElementById('pin_number');
				pin_number.style.display = "block";
			}
			else{
				pin_number = document.getElementById('pin_number');
				pin_number.style.display = "none";
				document.getElementById('pin1').value ='';
				document.getElementById('pin2').value ='';
				document.getElementById('pin3').value ='';
			}
		});
	}		

	if (radio = document.getElementById('purchasedFiveYears_Yes')) {
		if(radio.checked){
			purchase_info = document.getElementById('purchase_info');
			purchase_info.style.display = "block";
		}
		$('#purchasedFiveYears_Yes, #purchasedFiveYears_No').click(function(){
			var radio = document.getElementById('purchasedFiveYears_Yes');
			if(radio.checked){
				purchase_info = document.getElementById('purchase_info');
				purchase_info.style.display = "block";
			}
			else{
				purchase_info = document.getElementById('purchase_info');
				purchase_info.style.display = "none";
				document.getElementById('purchasePrice').value ='';
				document.getElementById('purchaseDate').value ='';
				document.getElementById('distressedSale_correct').checked = false;
				document.getElementById('distressedSale_incorrect').checked = false;
				document.getElementById('distressedSale_I_do_not_know').checked = false;
			}
		});
	}		

	if (radio = document.getElementById('refinancedFive_Yes')) {
		if(radio.checked){
			refinance_data = document.getElementById('refinance_data');
			refinance_data.style.display = "block";
		}
		$('#refinancedFive_Yes, #refinancedFive_No').click(function(){
			var radio = document.getElementById('refinancedFive_Yes');
			if(radio.checked){
				refinance_data = document.getElementById('refinance_data');
				refinance_data.style.display = "block";
			}
			else{
				refinance_data = document.getElementById('refinance_data');
				refinance_data.style.display = "none";
				document.getElementById('mostRecentRefinance').value ='';
				document.getElementById('appraisedValueRefinance').value ='';
				document.getElementById('interestRate').value ='';
				document.getElementById('interestTerm').value ='';
			}
		});
	}		

	if (radio = document.getElementById('vacancy_Yes')) {
		if(radio.checked){
			refinance_data = document.getElementById('vacancy_list');
			refinance_data.style.display = "block";
		}
		$('#vacancy_Yes, #vacancy_No').click(function(){
			var radio = document.getElementById('vacancy_Yes');
			if(radio.checked){
				refinance_data = document.getElementById('vacancy_list');
				refinance_data.style.display = "block";
			}
			else{
				refinance_data = document.getElementById('vacancy_list');
				refinance_data.style.display = "none";
				document.getElementById('vacancy3months').value ='';
			}
		});
	}		

	if (radio = document.getElementById('tornDown_correct')) {
		if(radio.checked){
			refinance_data = document.getElementById('torn_down_info');
			refinance_data.style.display = "block";
		}
		$('#tornDown_correct, #tornDown_incorrect').click(function(){
			var radio = document.getElementById('tornDown_correct');
			if(radio.checked){
				refinance_data = document.getElementById('torn_down_info');
				refinance_data.style.display = "block";
			}
			else{
				refinance_data = document.getElementById('torn_down_info');
				refinance_data.style.display = "none";
				document.getElementById('torn_down').value ='';
				document.getElementById('property_rebuilt_incorrect').checked = true;
				document.getElementById('property_rebuilt_incorrect').click();
				document.getElementById('vacancy3months').value ='';
			}
		});
	}		

	if (radio = document.getElementById('property_rebuilt_correct')) {
		if(radio.checked){
			refinance_data = document.getElementById('rebuilt_info');
			refinance_data.style.display = "block";
		}
		$('#property_rebuilt_correct, #property_rebuilt_incorrect').click(function(){
			var radio = document.getElementById('property_rebuilt_correct');
			if(radio.checked){
				refinance_data = document.getElementById('rebuilt_info');
				refinance_data.style.display = "block";
			}
			else{
				refinance_data = document.getElementById('rebuilt_info');
				refinance_data.style.display = "none";
				document.getElementById('rebuiltDate').value ='';
			}
		});
	}		

	if (radio = document.getElementById('primaryResidence_correct')) {
		if(radio.checked){
			refinance_data = document.getElementById('exemptionOnAnotherProperty');
			refinance_data.style.display = "block";
		}
		$('#primaryResidence_correct, #primaryResidence_incorrect').click(function(){
			var radio = document.getElementById('primaryResidence_correct');
			if(radio.checked){
				refinance_data = document.getElementById('exemptionOnAnotherProperty');
				refinance_data.style.display = "block";
			}
			else{
				refinance_data = document.getElementById('exemptionOnAnotherProperty');
				refinance_data.style.display = "none";
			}
		});
	}

	if (radio = document.getElementById('over65_correct')) {
		if(radio.checked){
			refinance_data = document.getElementById('born_date');
			refinance_data.style.display = "block";
		}
		$('#over65_correct, #over65_incorrect').click(function(){
			var radio = document.getElementById('over65_correct');
			if(radio.checked){
				refinance_data = document.getElementById('born_date');
				refinance_data.style.display = "block";
			}
			else{
				refinance_data = document.getElementById('born_date');
				refinance_data.style.display = "none";
				document.getElementById('yearBorn').value = '';
			}
		});
	}		

});

var exist_user_property = sessionStorage.getItem("user_property");
console.log(exist_user_property);
if(!exist_user_property){
	var elements_actions = document.getElementsByClassName('actions');

	for(i = 0; i < elements_actions.length; i++){
		elements_actions[i].style.display = "none";
	}
	document.getElementById('confirm_header').style.display = "none";
}
else{
	var elements_confirm_data = document.getElementsByClassName('confirm_data');

	for(i = 0; i < elements_confirm_data.length; i++){
		elements_confirm_data[i].style.display = "none";
	}
	
	if (el = document.getElementById('edit_data')) {
		el.style.display = "none";
	}

	if (el = document.getElementById('confirm_header')) {
		el.style.display = "block";
	}
};
