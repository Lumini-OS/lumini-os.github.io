function LoadLASMProgram(url) {
	var xhr = new XMLHttpRequest();
	
	xhr.open("GET", url, true);
	xhr.onload = function() {
		if (this.status >= 200 && this.status <= 299) {
			var code = this.responseText;
			
			code = code.replace(/add/g, ">");
			code = code.replace(/beg/g, "<html>");
			code = code.replace(/cls (.*)/g, "</$1>");
			code = code.replace(/elm (.*)/g, "<$1");
			code = code.replace(/end/g, "</html>");
			code = code.replace(/lib (.*)/g, "<script>LoadLASMProgram($1);</script>");
			code = code.replace(/org lum/g, "<!DOCTYPE html>");
			code = code.replace(/out "(.*)"/g, "$1");
			code = code.replace(/prp (.*) (.*)/g, "$1=$2");
			code = code.replace(/snb/g, "<script>");
			code = code.replace(/sne/g, "</script>");
			code = code.replace(/trm init/g, "<textarea id=\"Terminal\"></textarea>");
			
			// Javascript translators
			
			code = code.replace(/clr (.*)/g, "document.querySelector($1).innerHTML = \"\"");
			code = code.replace(/els/g, "else");
			code = code.replace(/evt (.*) (.*) (.*)/g, "document.querySelector($1).addEventListener($2, $3);");
			code = code.replace(/ifs \((.*)\)/g, "if ($1)");
			code = code.replace(/kbd (.*) (.*) (.*)/g, "document.querySelector($1).onkeypress = function(e) {\n\tif (e.keyCode == $2) {\n\t\t$3\n\t}\n};");
			code = code.replace(/mod (.*)/g, "alert($1);");
			code = code.replace(/msg (.*)/g, "document.querySelector(\"#Terminal\").value += $1;");
			code = code.replace(/var (.*): (.*)/g, "var $1 = $2;");
			code = code.replace(/vod (.*)\((.*)\)/g, "function $1($2)");
			
			document.writeln(code);
		}
	};
	xhr.send();
}
