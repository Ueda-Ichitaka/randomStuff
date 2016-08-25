var count = 10;
var delay = Math.floor((Math.random() * 5000) + 2500);
var spamText = "Spam!";
var spamTextArr = ["Spam!", "Hallo", "Welt", "Hallo", "hallo", "nerv", "ich?", "nerv ich?", "spam", "spam"];

var i = 0;

function loop() {
	setTimeout(function () {
		fillMessage();
		triggerClick();
		i++;
		console.log(i);
		if(i < count) {
			loop();
			delay = Math.floor((Math.random() * 5000) + 2500);
		}
	}, delay);
	
}

function fillMessage() {
	dispatch(document.querySelector("div.input"), "textInput", spamTextArr[Math.floor(Math.random() * 10)]);
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
