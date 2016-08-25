var msgcount = 10;
var delay = Math.floor((Math.random() * 500) + 200);
var emojiTab = Math.floor((Math.random() * 9) + 1);	/* There is no 0, from 1 to 6. */
var emojiNumber = Math.floor((Math.random() * 25) + 1)  ;	/* No 0 either. */
var spamText = "Spam!";
/* The actual code */
function getElementByXpath(path) { return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; }
var winnniey = 0;
function sendMessage() {         
   setTimeout(function () {
	var emojiButton = getElementByXpath('//*[@id="main"]/footer/div/button[1]');
   	emojiButton.click();
   	setTimeout(function () {
	var tab = getElementByXpath('//*[@id="main"]/footer/span/div/div[1]/button[' + emojiTab + ']');
	tab.click();
   	setTimeout(function () {
   		var emoji = getElementByXpath('//*[@id="main"]/footer/span/div/span/div/div/span[' + emojiNumber + ']');
	  	document.getElementsByClassName("input")[1].innerHTML="Spam!";
		emoji.click();
	  	setTimeout(function () {
		  	var sendButton = getElementByXpath('//*[@id="main"]/footer/div/button[2]');
			sendButton.click();  
			setTimeout(function () {
			    winnniey++;        
			    if (winnniey < msgcount) {
					delay = Math.floor((Math.random() * 500) + 500);
					emojiTab = Math.floor((Math.random() * 9) + 1);	/* There is no 0, from 1 to 6. */
					emojiNumber = Math.floor((Math.random() * 25) + 1)  ;	/* No 0 either. */
			    	console.log(delay);
					sendMessage();   
			    }
		    }, delay);
		}, delay);
    }, delay);
   }, delay);
  }, delay);
}
sendMessage();