/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


// Retornar o valor do botão de rádio que está marcada
// Retorna uma string vazia se nenhum deles está marcada
function getCheckedValue(conceitoRadio) {
	if(!conceitoRadio)
		return "";
	var radioLength = conceitoRadio.length;
	if(radioLength == undefined){
		if(conceitoRadio.checked){
			return conceitoRadio.value;
		}else{
			return "";
		}
	}
      return "";
}