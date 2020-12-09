console.log("Revw Module...............");

var revwService=(function(){
	function add(revw, callback, error){
		console.log("add Revw..........");
		
		$.ajax({
			type: 'post',
			url : '/revws/new',
			data : JSON.stringify(revw),
			contentType : "application/json; charset=utf-8",
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
	
	function getList(param, callback, error){
		var liqId = param.liqId;
		var page = param.page || 1;
		$.getJSON("/revws/pages/"+liqId+"/"+page+".json",
				function(data){
					if(callback){
						callback(data.revwCnt,data.list);
					}
		}).fail(function(xhr,status,er){
			if(error){
				error();
			}
		});
	}
	
	function remove(revwId, callback, error){
		$.ajax({
			type:'delete',
			url : '/revws/'+revwId,
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
	
	function update(revw,callback,error){
		console.log("revwId: "+revw.revwId);
		
		$.ajax({
			type : 'put',
			url : '/revws/'+revw.revwId,
			data : JSON.stringify(revw),
			contentType : "application/json; charset=utf-8",
			success :  function(result, status, xhr){
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
	
	function get(revwId, callback, error){
		$.get("/revws/"+revwId+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
			error();
			}
		});
	}
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str="";
		//확인필요 1000*
		if(gap < (60*60*24)){
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9? '':'0')+hh, ':',(mi>9 ? '':'0')+mi,':', (ss>9?'':'0')+ss].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1 //getMonth() 0부터
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm > 9 ? '':'0')+mm,'/', (dd > 9? '':'0')+dd].join('')
		}
	}
	
	function getMyList(param, callback, error){
		var memberId = param.memberId;
		var page = param.page || 1;
		$.getJSON("/revws/my/pages/"+memberId+"/"+page+".json",
				function(data){
					if(callback){
						callback(data.myRevwCnt,data.myList);
					}
		}).fail(function(xhr,status,er){
			if(error){
				error();
			}
		});
	}
	
	
	return {
		add:add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime:displayTime,
		getMyList:getMyList
	};
})();

