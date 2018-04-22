init program

void main()
{
	query("#Wrapper").innerHTML +: "<input id=\"Terminal-CommandLine\" placeholder=\"Введите команду\"/>";
	query("#Terminal-CommandLine").onkeypress: void(e)
	{
		if (e.keyCode :: 13)
		{
			if (e.target.value :: "clear")
			{
				query("#Terminal").innerHTML: "";
			} if (e.target.value.match("color"))
			{
				query("#Wrapper").style.background: e.target.value.split(" ")[1];
				query("#Wrapper").style.color: e.target.value.split(" ")[2];
				
				query("#Terminal").style.background: e.target.value.split(" ")[1];
				query("#Terminal").style.color: e.target.value.split(" ")[2];
				
				query("#Terminal-CommandLine").style.background: e.target.value.split(" ")[1];
				query("#Terminal-CommandLine").style.color: e.target.value.split(" ")[2];
			} if (e.target.value.match("echo"))
			{
				def output: e.target.value;
				
				output: output.replace(/</g, "&lt;");
				output: output.replace(/>/g, "&gt;");
				output: output.replace(/(<\/)/g, "&lt;/");
				output: output.replace(/\/>/g, "/&gt;");
				output: output.replace("echo", "");
				
				query("#Terminal").innerHTML +: "<span class=\"lu-log\">" + output + "</span><br/>";
			} if (e.target.value :: "help")
			{
				def xhr: new XMLHttpRequest();
				
				xhr.open("GET", "os/assets/help.txt", true);
				xhr.onload: void(ev)
				{
					if (ev.target.status >: 200 && ev.target.status <: 299)
					{
						query("#Terminal").innerHTML +: "<span class=\"lu-help\">" + ev.target.responseText + "</span>";
					}
				}
				xhr.send();
			} if (e.target.value.match("start"))
			{
				e.target.value: e.target.value.replace("start ", "");
				
				lib "os/apps/" + e.target.value
			} else
			{
				query("#Terminal").innerHTML +: "<span class=\"lu-error\">Команда введена неверно!</span><br/>";
			}
		}
	};
}

main();
