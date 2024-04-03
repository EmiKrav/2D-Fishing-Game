using Godot;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Reflection;
using static decorator;

public partial class decorator : Node
{

	public interface Zuvis
	{

		string MakeZuvis();
	}

	public class PlainZuvis : Zuvis
	{
		

		public string MakeZuvis()
		{
			return "Zuvis ";
		}
	}

	public abstract class ZuvisDecorator : Zuvis
	{
		protected Zuvis zuvis;
		public ZuvisDecorator(Zuvis zuvis)
		{
			this.zuvis = zuvis;
		}
		public virtual string MakeZuvis()
		{
			return zuvis.MakeZuvis();
		}
	}
	public class MazaZuvisDecorator : ZuvisDecorator
	{
		public MazaZuvisDecorator(Zuvis zuvis) : base(zuvis)
		{
		}
		public override string MakeZuvis()
		{

			System.Random random = new System.Random();
			double svoris = (random.NextDouble() * (1 - 0.1) + 0.1);
			return zuvis.MakeZuvis() + AddSMazaivorio(String.Format("{0, 0:F2} ", svoris));
		}
		private string AddSMazaivorio(string svoris)
		{
			return svoris;
		}
	}
	public class DideleZuvisDecorator : ZuvisDecorator
	{
		public DideleZuvisDecorator(Zuvis zuvis) : base(zuvis)
		{
			
		}
		public override string MakeZuvis()
		{
			System.Random random = new System.Random();
			double kaina = (random.NextDouble() * (10 - 1) + 1);
			return zuvis.MakeZuvis() + addDaugSvorio(String.Format("{0, 0:F2} ", kaina));
		}
		private string addDaugSvorio(string kaina)
		{
			return kaina;
		}
	}
	public string Print()
	{
		PlainZuvis plainZuvisObj = new PlainZuvis();
		string plainZuvis = plainZuvisObj.MakeZuvis();
		return(plainZuvis);
	}
	public string PrintSumazusvoriu()
	{
		PlainZuvis plainZuvisObj = new PlainZuvis();
		string plainZuvis = plainZuvisObj.MakeZuvis();
		ZuvisDecorator mazassvorisZuvisDecorator = new MazaZuvisDecorator(plainZuvisObj);
		string svorisZuvis = mazassvorisZuvisDecorator.MakeZuvis();
		return("\n" + svorisZuvis + "kg");
	}
	public string PrintSudideliusvoriu()
	{
		PlainZuvis plainZuvisObj = new PlainZuvis();
		string plainZuvis = plainZuvisObj.MakeZuvis();
		DideleZuvisDecorator dideleZuvisDecorator = new DideleZuvisDecorator(plainZuvisObj);
		string svorisZuvis = dideleZuvisDecorator.MakeZuvis();
		return ("\n" + svorisZuvis + "kg");
	}
}