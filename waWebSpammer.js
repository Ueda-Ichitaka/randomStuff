var msgcount = 25;
var delay = 600;
var emojiTab = 7;	/* There is no 0, from 1 to 6. */
var emojiNumber = 23  ;	/* No 0 either. */
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
	  	document.getElementsByClassName("input")[1].innerHTML="Würflein anrufen!";
		emoji.click();
	  	setTimeout(function () {
		  	var sendButton = getElementByXpath('//*[@id="main"]/footer/div/button[2]');
			sendButton.click();  
			setTimeout(function () {
			    winnniey++;        
			    if (winnniey < msgcount) {
			    	sendMessage();   
			    }
		    }, delay);
		}, delay);
    }, delay);
   }, delay);
  }, delay);
}
sendMessage();