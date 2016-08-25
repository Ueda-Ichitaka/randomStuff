var count = 10;
var delay = Math.floor((Math.random() * 5000) + 2500);
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
					"Was mach ich hier?",
					"Wer kommt alles mit zu Equilibrium am 14.10. ?",
					"Cyka blyat",
					"curva",
					"Sei R ein kommutativer Ring",
					"Berechnen Sie alle möglichen Untervektorräume der Unendlichkeit. Schreiben Sie alle einzeln auf!"
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
	arrLength = spamTextArr.length;
	dispatch(document.querySelector("div.input"), "textInput", spamTextArr[Math.floor(Math.random() * arrLength)]);
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
