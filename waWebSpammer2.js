var count = 10;
var delay = Math.floor((Math.random() * 3000) + 200);
var spamText = "Spam!";

var i = 1;

function loop() {
	setTimeout(function () {
		fillMessage();
		triggerClick();
		i++;
		console.log(i);
		if(i < count) {
			loop();
			delay = Math.floor((Math.random() * 2000) + 200);
		}
	}, delay);
	
}

function fillMessage() {
	dispatch(document.querySelector("div.input"), "textInput", spamText);
}

function dispatch(target, eventType, char) {
    var evt = document.createEvent("TextEvent");    
    evt.initTextEvent (eventType, true, true, window, char, 0, "en-US");
    target.focus();
    target.dispatchEvent(evt);
}

function triggerClick() {
var event = new MouseEvent('click', {
  'view': window,
  'bubbles': true,
  'cancelable': true
 });
document.querySelector(".icon.btn-icon.icon-send").dispatchEvent(event);
}

loop();
