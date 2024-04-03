using Godot;
using System;
using System.Diagnostics.Metrics;

public class Level 
{
	private static int Counter = 1;

	private static Level _instance;

	public static Level Instance()
	{
			if (_instance == null)
			{
				_instance = new Level();
			}
			return _instance;
		
	}
	public string LevelSk()
	{
		return "Levelis: " + Counter.ToString();
	}
	public void LevelUP() { Counter++; }
}
