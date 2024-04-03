using Godot;
using System;

public partial class bed : StaticBody2D
{

	private Label label, label2;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
	}

	public override void _UnhandledInput(InputEvent @event)
	{
		StaticBody2D sprite = GetNode("../Bed") as StaticBody2D;
		GDScript MyGDScript = GD.Load<GDScript>("res://scripts/global.gd");
		GodotObject myGDScriptNode = (GodotObject)MyGDScript.New();
		label = GetNode("../CanvasLayer/Levelis") as Label;
		Level level = Level.Instance();
		label2 = GetNode("../CanvasLayer/Exp") as Label;
		if (@event is InputEventMouseButton mouseButton)
		{
			//GD.Print(label2.Text.Substring(9));
			if (mouseButton.Pressed && mouseButton.ButtonIndex == MouseButton.Left &&
				(GetGlobalMousePosition() - sprite.GlobalPosition).Length() < 16 && label2.Text.Substring(9).ToInt() > 30)
			{
				level.LevelUP();
				label.Text = level.LevelSk();
				myGDScriptNode.Call("update");
			}
		}
	}
}
