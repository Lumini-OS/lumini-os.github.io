function LoadLScript(url) {
	var xhr = new XMLHttpRequest();
	
	xhr.open("GET", url, true);
	xhr.onload = function() {
		if (this.status >= 200 && this.status <= 299) {
			var code = this.responseText;
			
			code = code.replace(/(\/\/(.*)|\/\*(.*)\*\/|function(.*)|alert(.*)|document(.*)|window(.*)|navigator(.*)|console(.*))/g, "");
			code = code.replace(/\~/g, ":");
			code = code.replace(/\:/g, "=");
			code = code.replace(/#\*(.*)\*#/g, "/*$1*/");
			
			code = code.replace(/lumini.args/g, "arguments");
			code = code.replace(/lumini.event/g, "window.event");
			
			code = code.replace(/lumini.layout\((.*)\)/g, "LoadLASMProgram($1)");
			
			code = code.replace(/append\((.*)\)/g, "appendChild($1)");
			code = code.replace(/create\((.*)\)/g, "document.createElement($1)");
			code = code.replace(/def/g, "var");
			code = code.replace(/lib (.*)/g, "LoadLScript($1)");
			code = code.replace(/init program/g, "\"use strict\"");
			code = code.replace(/print\((.*)\)/g, "document.write($1);");
			code = code.replace(/query\((.*)\)/g, "document.querySelector($1)");
			code = code.replace(/remove\((.*)\)/g, "removeChild($1)");
			code = code.replace(/self/g, "this");
			code = code.replace(/set\((.*)\)/g, "setAttribute($1)");
			code = code.replace(/void/g, "function");
			
			eval(code);
		}
	};
	xhr.send();
}

function LoadLASMProgram(url) {
	var xhr = new XMLHttpRequest();
	
	xhr.open("GET", url, true);
	xhr.onload = function() {
		if (this.status >= 200 && this.status <= 299) {
			var code = this.responseText;
			
			code = code.replace(/;(.*);/g, "");
			
			code = code.replace(/add/g, ">");
			code = code.replace(/beg/g, "<html>");
			code = code.replace(/cls (.*)/g, "</$1>");
			code = code.replace(/elm (.*)/g, "<$1");
			code = code.replace(/end/g, "</html>");
			code = code.replace(/lib (.*)/g, "<script>LoadLScript($1)</script>");
			code = code.replace(/org lum/g, "<!DOCTYPE html>");
			code = code.replace(/out "(.*)"/g, "$1");
			code = code.replace(/prp (.*) (.*)/g, "$1=$2");
			
			document.write(code);
		}
	};
	xhr.send();
}
