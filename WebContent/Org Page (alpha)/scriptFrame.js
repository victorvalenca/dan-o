"use strict";

document.getElementById("clicker").onclick = function ()
{
	var clickElement = document.getElementById("case");

	if (clickElement.classList.hasAttribute("clicked")) ? clickElement.classList.remove("clicked") : clickElement.classList.add("clicked");
	
	window.reload;
};