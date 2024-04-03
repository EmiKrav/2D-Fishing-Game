using Godot;
using System;

public class Meskere
{
	public string valas { get; set; }
	public string rite { get; set; }
	public string Masalas { get; set; }
}

public interface IMeskereBuilder
{
	void Buildvalas();
	void Buildrite();
	void BuildMasalas();
	Meskere GetMeskere();
}

public class PradineMeskereBuilder : IMeskereBuilder
{
	private Meskere _Meskere = new Meskere();

	public void Buildvalas()
	{
		_Meskere.valas = "5kg";
	}

	public void Buildrite()
	{
		_Meskere.rite = "5kg";
	}

	public void BuildMasalas()
	{
		_Meskere.Masalas = "Duona";
	}

	public Meskere GetMeskere()
	{
		return _Meskere;
	}
}
public class UpgradintaMeskereBuilder : IMeskereBuilder
{
	private Meskere _Meskere = new Meskere();

	public void Buildvalas()
	{
		_Meskere.valas = "10kg";
	}

	public void Buildrite()
	{
		_Meskere.rite = "10kg";
	}

	public void BuildMasalas()
	{
		_Meskere.Masalas = "Sliekas";
	}

	public Meskere GetMeskere()
	{
		return _Meskere;
	}
}
public class MeskereDirector
{
	public void ConstructMeskere(IMeskereBuilder MeskereBuilder)
	{
		MeskereBuilder.Buildvalas();
		MeskereBuilder.Buildrite();
		MeskereBuilder.BuildMasalas();
	}
}


