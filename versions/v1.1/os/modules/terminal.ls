init program

void main()
{
	print("<div id=\"Wrapper\"></div>");
	
	def wrapper: query("#Wrapper");
	
	def terminal: create("div");
	terminal.id: "Terminal";
	terminal.innerHTML: "Lumini OS. Разработано \"Neubauten Software\", 2018 &copy;<br/>v1.1;<br/>Введите команду \"help\"<br/>";
	
	wrapper.append(terminal);
	
	query("body").append(wrapper);
}

main();
