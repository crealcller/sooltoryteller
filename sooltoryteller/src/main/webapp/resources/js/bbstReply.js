console.log("========== BBST REPLY MODULE ==========");

var bbstReplyService = (function() {
	
	// 댓글 등록
	function add(reply, callback, error) {
		console.log("========== ADD BBST REPLY ==========");
	
		$.ajax({
			type : "post",
			url : "/cheers/get/replies/new",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	// 댓글 조회
	function get(bbstReplyId, callback, error) {
		$.get("/cheers/get/replies/" + bbstReplyId + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	// 댓글 수정
	function update(reply, callback, error) {
		console.log("BBST REPLY ID: " + reply.bbstReplyId);
		
		$.ajax({
			type : "put",
			url : "/cheers/get/replies/" + reply.bbstReplyId,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, er) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	// 댓글 삭제
	function remove(bbstReplyId, callback, error) {
		$.ajax({
			type : "delete",
			url : "/cheers/get/replies/" + bbstReplyId,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	// 게시글의 모든 댓글 조회
	function getList(param, callback, error) {
		var bbstId = param.bbstId;
		var page = param.page || 1;
		
		$.getJSON("/cheers/get/replies/pages/" + bbstId + "/" + page + ".json",
			function(data) {
			if(callback) {
				callback(data.replyCnt, data.list);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	// 시간 처리
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		// 댓글 등록 후 하루가 지나지 않았다면
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh,
				':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
			
		// 댓글 등록 후 하루가 지났다면
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // 0부터 시작
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	
	return {
		add : add,
		get : get,
		update : update,
		remove : remove,
		getList : getList,
		displayTime : displayTime
	};
})();
