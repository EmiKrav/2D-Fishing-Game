using Godot;
using System;
using static decorator;

public partial class strategy : Node
{
	public interface FishMovementStrategy
	{
		double CalculateMovement(double speed);
	}
	public class fastStrategy : FishMovementStrategy
	{
		public double CalculateMovement(double movementspeed)
		{
			return 1.5 * movementspeed;
		}
	}
	public class MediumStrategy : FishMovementStrategy
	{
		public double CalculateMovement(double movementspeed)
		{
			return 1.25 * movementspeed;
		}
	}
	public class SlowStrategy : FishMovementStrategy
	{
		public double CalculateMovement(double movementspeed)
		{
			return 0.5 * movementspeed;
		}
	}
	
	public class SettingUP
	{
		private FishMovementStrategy _moveStrategy;
		private double _movementspeed;
		public SettingUP(FishMovementStrategy moveStrategy, double movementspeed)
		{
			_moveStrategy = moveStrategy;
			_movementspeed = movementspeed;
		}
		public double Adjust()
		{
			double speed = _moveStrategy.CalculateMovement(_movementspeed);
			return _movementspeed + speed;
		}
	}


	
	public double movementspeed = 25.00;
	public double PrintGreitis1()
	{
		SettingUP cart1 = new SettingUP(new fastStrategy(), movementspeed);
		return cart1.Adjust();
	}
	public double PrintGreitis2()
	{
		SettingUP cart2 = new SettingUP(new MediumStrategy(), movementspeed);
		return cart2.Adjust();
	}
	public double PrintGreitis3()
	{
		SettingUP cart3 = new SettingUP(new SlowStrategy(), movementspeed);
		return cart3.Adjust();
	}
}
