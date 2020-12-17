console.log("========== BBST LIKES MODULE ==========");

var bbstLikeService = (function() {

	// 좋아요 상태
	function likeStus(param, callback, error) {
		var memberId = param.memberId;
		var bbstId = param.bbstId;
		$.getJSON("/bbstLike/" + memberId + "/" + bbstId,
			function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, er) {
			if(error) {
				error();
			}
		});
	}
	
	// 좋아요
	function likeBbst(param, callback, error) {
		var memberId = param.memberId;
		var bbstId = param.bbstId;
		$.ajax({
			type: "post",
			url: "/bbstLike/new/" + memberId + "/" + bbstId,
			dataType : "text",
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
					
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					callback(er);
				}
			}
		});
	}
	
	// 좋아요 취소
	function cancelLikeBbst(param, callback, error) {
		var memberId = param.memberId;
		var bbstId = param.bbstId;
		$.ajax({
			type: "delete",
			url: "/bbstLike/" + memberId + "/" + bbstId,
			dataType: "text",
			success: function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
	function getMyBbstLike(param, callback, error) {
		var memberId = param.memberId;
		var page = param.page || 1;
		
		$.getJSON("/bbstLike/mypages/" + memberId + "/" + page + ".json",
			function(data) {
			if(callback) {
				callback(data.myLikeCnt, data.myLikeList);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		}); 
	}

	return {
		likeStus : likeStus,
		likeBbst : likeBbst,
		cancelLikeBbst : cancelLikeBbst,
		getMyBbstLike : getMyBbstLike
	}
})();
