console.log("like Module...............");

var likeService=(function(){
	function checkLike(param, callback, error){
		var memberId = param.memberId;
		var liqId = param.liqId;
		$.getJSON('/like/'+memberId+'/'+liqId,
				function(data){
					if(callback){
						callback(data);
					}
		}).fail(function(xhr,status,er){
			if(error){
				error();
			}
		});
	}
	function like(param, callback, error){
		var memberId = param.memberId;
		var liqId = param.liqId;
		$.ajax({
			type: 'post',
			url : '/like/new/'+memberId+'/'+liqId,
			dataType: "text",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function cancelLike(param, callback, error){
		var memberId = param.memberId||0;
		var liqId = param.liqId;
		$.ajax({
			type:'delete',
			url : '/like/'+memberId+'/'+liqId,
			dataType: "text",
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getMyList(param, callback, error){
		var memberId = param.memberId;
		var page = param.page || 1;
		$.getJSON("/like/my/pages/"+memberId+"/"+page+".json",
				function(data){
					if(callback){
						callback(data.myLikeCnt,data.myList);
					}
		}).fail(function(xhr,status,er){
			if(error){
				error();
			}
		});
	}
	return {
		checkLike:checkLike,
		like:like,
		cancelLike:cancelLike,
		getMyList:getMyList
		
	};
})();

