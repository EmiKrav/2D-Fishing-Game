using Godot;
using System;
using System.Runtime.CompilerServices;
using static Godot.XmlParser;

public partial class Labelo : Label
{
	private Label label;
	// Called when the node enters the scene tree for the first time.

	public override void _Ready()
	{

		label = GetNode<Label>(GetPath());

		Level level  = Level.Instance();
		//GD.Print("levele");

		label.Text = level.LevelSk();
	}




	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	
	}
}
