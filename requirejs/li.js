define("li",[],function(){
	var cssTransform=function(fontName){
		//css中文转unicode
		var arr=[];
		for (var i = 0; i < fontName.length; i++) {
			arr.push("\\"+fontName.charCodeAt(i).toString(16));
		};
		console.log(arr.join(''));
	}

	return {
		cssTransform:cssTransform
	}
})