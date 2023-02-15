// iframe에 로딩되는 화면에 삽입될 js

window.addEventListener('DOMContentLoaded', function () {
    if (window.location !== window.parent.location) {
        var lastTitle = document.title;
        function checkTitle() {
            var currTitle = document.title;
            if (currTitle != lastTitle) {
    // ucube에 대한 title 변경 전달임을 target/type 값으로 표현
                window.parent.postMessage({target:'ucube',type:'titleChange',title:currTitle}, '*');
                lastTitle = currTitle;
            }
            setTimeout(checkTitle, 500);
        }
        checkTitle();
       
        var lastStatus = document.status;
        function checkStatus() {
            var currStatus = document.status;
            if (currStatus != lastStatus) {
                window.parent.postMessage({target:'UCube',type:'StatusTextChange',status:currStatus}, '*');
                lastStatus = currStatus;
            }
            setTimeout(checkStatus, 500);
        }
        checkStatus();
		
    }
});
window.onload = function () {
	
	var currUrl = document.url;
	
	window.parent.postMessage({target:'UCube',type:'windowon-load',status:currUrl}, '*');
	
};