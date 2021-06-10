namespace Flight_Reservation_system
{
    partial class Booking
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.flight_num = new System.Windows.Forms.TextBox();
            this.nums = new System.Windows.Forms.TextBox();
            this.credit = new System.Windows.Forms.TextBox();
            this.add = new System.Windows.Forms.TextBox();
            this.pass_num = new System.Windows.Forms.TextBox();
            this.finish = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.label7 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pictureBox2.Image = global::Flight_Reservation_system.Properties.Resources.index1;
            this.pictureBox2.Location = new System.Drawing.Point(740, 12);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(48, 52);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pictureBox2.TabIndex = 11;
            this.pictureBox2.TabStop = false;
            this.pictureBox2.Click += new System.EventHandler(this.pictureBox2_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(111, 76);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Flight Number";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(111, 114);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(88, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "number of tickets";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(111, 157);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 13);
            this.label3.TabIndex = 14;
            this.label3.Text = "Credit Card Number";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(111, 198);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(89, 13);
            this.label4.TabIndex = 15;
            this.label4.Text = "Personal Address";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(111, 238);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(88, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Passport Number";
            // 
            // flight_num
            // 
            this.flight_num.Location = new System.Drawing.Point(245, 76);
            this.flight_num.Name = "flight_num";
            this.flight_num.Size = new System.Drawing.Size(168, 20);
            this.flight_num.TabIndex = 17;
            // 
            // nums
            // 
            this.nums.Location = new System.Drawing.Point(245, 111);
            this.nums.Name = "nums";
            this.nums.Size = new System.Drawing.Size(168, 20);
            this.nums.TabIndex = 18;
            // 
            // credit
            // 
            this.credit.Location = new System.Drawing.Point(245, 154);
            this.credit.Name = "credit";
            this.credit.Size = new System.Drawing.Size(168, 20);
            this.credit.TabIndex = 19;
            // 
            // add
            // 
            this.add.Location = new System.Drawing.Point(245, 198);
            this.add.Name = "add";
            this.add.Size = new System.Drawing.Size(168, 20);
            this.add.TabIndex = 20;
            // 
            // pass_num
            // 
            this.pass_num.Location = new System.Drawing.Point(245, 238);
            this.pass_num.Name = "pass_num";
            this.pass_num.Size = new System.Drawing.Size(168, 20);
            this.pass_num.TabIndex = 21;
            // 
            // finish
            // 
            this.finish.Cursor = System.Windows.Forms.Cursors.Hand;
            this.finish.Location = new System.Drawing.Point(279, 314);
            this.finish.Name = "finish";
            this.finish.Size = new System.Drawing.Size(110, 41);
            this.finish.TabIndex = 22;
            this.finish.Text = "Book";
            this.finish.UseVisualStyleBackColor = true;
            this.finish.Click += new System.EventHandler(this.button1_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Cursor = System.Windows.Forms.Cursors.Hand;
            this.label6.Location = new System.Drawing.Point(489, 99);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(116, 13);
            this.label6.TabIndex = 23;
            this.label6.Text = "Go to Search for Flight ";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Cursor = System.Windows.Forms.Cursors.Default;
            this.label7.Location = new System.Drawing.Point(549, 386);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(29, 13);
            this.label7.TabIndex = 24;
            this.label7.Text = "timer";
            // 
            // Booking
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.finish);
            this.Controls.Add(this.pass_num);
            this.Controls.Add(this.add);
            this.Controls.Add(this.credit);
            this.Controls.Add(this.nums);
            this.Controls.Add(this.flight_num);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Booking";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Booking";
            this.Load += new System.EventHandler(this.Booking_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox flight_num;
        private System.Windows.Forms.TextBox nums;
        private System.Windows.Forms.TextBox credit;
        private System.Windows.Forms.TextBox add;
        private System.Windows.Forms.TextBox pass_num;
        private System.Windows.Forms.Button finish;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label7;
    }
}