var count = 10;
var delay = Math.floor((Math.random() * 5000) + 2500);
var mode = 1;  	//1 array, 0 txt
var spamText = "Spam!";
var spamTextArr = [	"Spam!", 
					"Hallo", 
					"Welt", 
					"Hallo", 
					"hallo", 
					"nerv", 
					"ich?", 
					"nerv ich?", 
					"spam", 
					"spam",
					"Hier könnte ihre Werbung stehen",
					"Bierjunge!",
					"Cyka blyat",
					"kurwa",
					"Sei R ein kommutativer Ring",
					"Berechnen Sie alle möglichen Untervektorräume der Unendlichkeit. Schreiben Sie alle einzeln auf!",
					"Why do programmers need glasses?",
					"Cause they can't C#",
					"Hey!",
					"hey!",
					"Listen!",
					"^^vv<><>BAStart",
					"Make me a sandwich! - No. - Sudo make me a sandwich! - Ok!",
					"Igni",
					"Aard",
					"Quen",
					"Yrden",
					"Axii",
					"A d'yaebl aép arse",
					"Bloede dh'oine",
					"Va fail Gwynnbleidd",
					"nuqneH",
					"Qapla'!"
					];

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
	if(mode == 0) {
		dispatch(document.querySelector("div.input"), "textInput", spamText);
	}
	else if(mode == 1) { 
		arrLength = spamTextArr.length;
		dispatch(document.querySelector("div.input"), "textInput", spamTextArr[Math.floor(Math.random() * arrLength)]);
	}
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
