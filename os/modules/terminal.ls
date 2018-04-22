init program

void main()
{
	print("<div id=\"Wrapper\"></div>");

	def wrapper: query("#Wrapper");
	wrapper.onmousedown: void(e)
	{
		e.target.onmousemove: void(e)
		{
			e.target.style.left: e.pageX + "px";
			e.target.style.top: e.pageY + "px";
		};
		
		e.target.onmouseup: void(e)
		{
			e.target.mousemove: null;
		};
	};
	
	def terminal: create("div");
	terminal.id: "Terminal";
	terminal.innerHTML: "Lumini OS. Разработано \"Neubauten Software\", 2018 &copy;<br/>v1.3;<br/>Введите команду \"help\"<br/>";
	
	wrapper.append(terminal);
	query("body").append(wrapper);
}

main();
