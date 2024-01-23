/*
 * Created by SharpDevelop.
 * User: lefkoe
 * Date: 9/18/2014
 * Time: 2:43 PM
 * 
 * Example of calling Java PJM CLI using .NET.
 */
using System;
using System.Windows.Forms;

namespace clidotnet
{
	/// <summary>
	/// Class with program entry point.
	/// </summary>
	internal sealed class Program
	{
		/// <summary>
		/// Program entry point.
		/// </summary>
		[STAThread]
		private static void Main(string[] args)
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			Application.Run(new MainForm());
		}
		
	}
}
