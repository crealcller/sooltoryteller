console.log("========== MY BBST MODULE ==========");

var myBbstService = (function() {
	
	// 내가 쓴 게시글 리스트
	function getMyList(param, callback, error) {
		var memberId = param.memberId;
		var page = param.page || 1;
		
		$.getJSON("/mybbst/pages/" + memberId + "/" + page + ".json",
			function(data) {
			if(callback) {
				callback(data.myBbstCnt, data.myBbstList);
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
		getMyList : getMyList,
		displayTime : displayTime
	}
})();
