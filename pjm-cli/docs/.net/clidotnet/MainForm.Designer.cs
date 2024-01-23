/*
 * Created by SharpDevelop.
 * User: lefkoe
 * Date: 9/18/2014
 * Time: 2:43 PM
 * 
 * Example of calling Java PJM CLI using .NET.
 */
 using System.Drawing;
 
namespace clidotnet
{
	partial class MainForm
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			this.btnRunCLI = new System.Windows.Forms.Button();
			this.txtOutput = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.txtUsername = new System.Windows.Forms.TextBox();
			this.txtPassword = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// btnRunCLI
			// 
			this.btnRunCLI.Location = new System.Drawing.Point(12, 12);
			this.btnRunCLI.Name = "btnRunCLI";
			this.btnRunCLI.Size = new System.Drawing.Size(106, 31);
			this.btnRunCLI.TabIndex = 0;
			this.btnRunCLI.Text = "Run CLI";
			this.btnRunCLI.UseVisualStyleBackColor = true;
			this.btnRunCLI.Click += new System.EventHandler(this.BtnRunCLIClick);
			// 
			// txtOutput
			// 
			this.txtOutput.Location = new System.Drawing.Point(12, 49);
			this.txtOutput.Multiline = true;
			this.txtOutput.Name = "txtOutput";
			this.txtOutput.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.txtOutput.Size = new System.Drawing.Size(655, 515);
			this.txtOutput.TabIndex = 1;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(139, 12);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(100, 23);
			this.label1.TabIndex = 2;
			this.label1.Text = "Username:";
			// 
			// txtUsername
			// 
			this.txtUsername.Location = new System.Drawing.Point(219, 12);
			this.txtUsername.Name = "txtUsername";
			this.txtUsername.Size = new System.Drawing.Size(150, 22);
			this.txtUsername.TabIndex = 3;
			// 
			// txtPassword
			// 
			this.txtPassword.Location = new System.Drawing.Point(460, 12);
			this.txtPassword.Name = "txtPassword";
			this.txtPassword.PasswordChar = '*';
			this.txtPassword.Size = new System.Drawing.Size(150, 22);
			this.txtPassword.TabIndex = 5;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(380, 12);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(100, 23);
			this.label2.TabIndex = 4;
			this.label2.Text = "Password:";
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(679, 576);
			this.Controls.Add(this.txtPassword);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.txtUsername);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.txtOutput);
			this.Controls.Add(this.btnRunCLI);
			this.Name = "MainForm";
			this.Text = "PJM CLI .NET";
			this.ResumeLayout(false);
			this.PerformLayout();
		}
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox txtPassword;
		private System.Windows.Forms.TextBox txtUsername;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox txtOutput;
		private System.Windows.Forms.Button btnRunCLI;

		
		void BtnRunCLIClick(object sender, System.EventArgs e)
		{
			txtOutput.Clear();
			
			//Create process
			System.Diagnostics.Process pProcess = new System.Diagnostics.Process();
			
			//strCommand is path and file name of command to run
			pProcess.StartInfo.FileName = "java";
			
			//Optional
			pProcess.StartInfo.WorkingDirectory = "C:/Personal/tools/pjm-cli/";
			
			//strCommandParameters are parameters to pass to program
			pProcess.StartInfo.Arguments = "-Xms64m -Xmx256m -jar pjm-cli.jar -u "+txtUsername.Text+" -p "+txtPassword.Text+" -d ./download/  -z 180000  -s https://exschedule.test.pjm.com/exschedule/ -a /rest/secure/download/xml/schedules -q start=09-18-2014 -q stop=09-19-2014";
			
			// hide window
			pProcess.StartInfo.CreateNoWindow = true;
			pProcess.StartInfo.UseShellExecute = false;
			
			//Set output of program to be written to process output stream
			pProcess.StartInfo.RedirectStandardOutput = true;
			
			//Start the process
			pProcess.Start();
			
			//Get program output
			string strOutput = pProcess.StandardOutput.ReadToEnd();
			
			//Wait for process to finish
			pProcess.WaitForExit();
			
			// look for SUCCESS or FAILURE
			if (strOutput.Contains("SUCCESS"))	{
				txtOutput.ForeColor =  Color.Green;
			} else {
				txtOutput.ForeColor =  Color.Red;
			}
			txtOutput.Text = strOutput;
		}
	}
}
