init program

void main()
{
	query("html").oncontextmenu: void(e)
	{
		return false;
	};
}

main();
