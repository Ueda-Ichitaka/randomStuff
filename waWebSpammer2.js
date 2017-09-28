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
	}
	else if(mode == 1) { 
		arrLength = spamTextArr.length;
	}
}

function dispatch(input, message) {
	InputEvent = Event || InputEvent;
    var evt = new InputEvent('input', {						
        bubbles: true
    });
    input.innerHTML = message;								
    input.dispatchEvent(evt);								
}


loop();
