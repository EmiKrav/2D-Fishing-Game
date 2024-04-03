using Godot;
using System;

public class SubsystemA
{
	public void OperationA()
	{
		//parduoti zuvis
	}
}

public class SubsystemB
{
	public void OperationB()
	{
		// gauti pinigu
	}
}
public class SubsystemC
{
	public void OperationC()
	{
		// pasalinti zuvis is inventoriaus
	}
}

public class Facade
{
	private readonly SubsystemA _subsystemA;
	private readonly SubsystemB _subsystemB;
	private readonly SubsystemC _subsystemC;

	public Facade(SubsystemA subsystemA, SubsystemB subsystemB, SubsystemC subsystemC)
	{
		_subsystemA = subsystemA;
		_subsystemB = subsystemB;
		_subsystemC = subsystemC;
	}

	public void UnifiedOperation()
	{
		_subsystemA.OperationA();
		_subsystemB.OperationB();
		_subsystemC.OperationC();
	}
}
