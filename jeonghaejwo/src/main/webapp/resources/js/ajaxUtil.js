function ajax(url, callback , data){
	if(data){
		$.ajax({
			url : url,
			data : data,
			success : callback
		});
	}else{
		$.ajax({
			url : url,
			success : callback
		});
	}
}