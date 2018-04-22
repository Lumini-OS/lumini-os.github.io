init program



def cmd_line: query("#Terminal-CommandLine"),

	terminal: query("#Terminal");



void main()

{

	cmd_line.onkeypress: void(e)

	{

		if (e.keyCode :: 13)

		{

			if (e.target.value.match("div"))

			{

				terminal.innerHTML +: "<span class=\"lu-warn\">" + (parseFloat(e.target.value.split(" ")[1]) / parseFloat(e.target.value.split(" ")[2])) + "</span><br/>";

			} if (e.target.value.match("min"))

			{

				terminal.innerHTML +: "<span class=\"lu-warn\">" + (parseFloat(e.target.value.split(" ")[1]) - parseFloat(e.target.value.split(" ")[2])) + "</span><br/>";

			} if (e.target.value.match("mul"))

			{

				terminal.innerHTML +: "<span class=\"lu-warn\">" + (parseFloat(e.target.value.split(" ")[1]) * parseFloat(e.target.value.split(" ")[2])) + "</span><br/>";

			} if (e.target.value.match("pls"))

			{

				terminal.innerHTML +: "<span class=\"lu-warn\">" + (parseFloat(e.target.value.split(" ")[1]) + parseFloat(e.target.value.split(" ")[2])) + "</span><br/>";

			} if (e.target.value == "stop")

			{

				query("#Wrapper").remove(cmd_line);

				
				query("#Terminal").innerHTML +: "<span class=\"lu-info\">Программа завершена!</span><br/>";
				

				lib "os/modules/command_line.ls"

			}

		}

	};

}



main();
