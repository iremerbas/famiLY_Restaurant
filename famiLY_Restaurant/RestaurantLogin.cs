using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace famiLY_Restaurant
{
    public partial class RestaurantLogin : Form
    {



        public RestaurantLogin()
        {
            InitializeComponent();
        }



        private void button1_Click_1(object sender, EventArgs e)
        {
            Tables table = new Tables();

            GroupBox Table = new GroupBox()
            {
                Location = new System.Drawing.Point(29, 26),
                Name = "groupBox1",
                Size = new System.Drawing.Size(586, 555),
                TabIndex = 0,
                TabStop = false,
                Text = "Table"

            };
            table.Controls.Add(Table);

            Button Menu = new Button()
            {
                Location = new System.Drawing.Point(28, 49),
                Name = "button13",
                Size = new System.Drawing.Size(151, 44),
                TabIndex = 1,
                Text = "Menu",
                UseVisualStyleBackColor = true

            };
            Menu.Click += Menu_Click;
            Table.Controls.Add(Menu);

            Button Kitchen = new Button()
            {
                Location = new System.Drawing.Point(208, 49),
                Name = "btn_kitchen",
                Size = new System.Drawing.Size(151, 44),
                TabIndex = 1,
                Text = "Kitchen",
                UseVisualStyleBackColor = true
            };
            Kitchen.Click += Kitchen_Click;
            Table.Controls.Add(Kitchen);

            Button b1 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(97, 109),
                Name = "button1",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "B1",
                UseVisualStyleBackColor = false,
            };
            b1.Click += b1_Click;
            Table.Controls.Add(b1);

            Button b2 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(97, 221),
                Name = "button4",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "B2",
                UseVisualStyleBackColor = false
            };
            b2.Click += b2_Click;
            Table.Controls.Add(b2);

            Button b3 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(97, 328),
                Name = "button7",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "B3",
                UseVisualStyleBackColor = false

            };
            b3.Click += b3_Click;
            Table.Controls.Add(b3);

            Button b4 = new Button()
            {

                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(97, 440),
                Name = "button8",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "B4",
                UseVisualStyleBackColor = false,


            };
            b4.Click += b4_Click;
            Table.Controls.Add(b4);


            Button b5 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(249, 109),
                Name = "button2",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "S1",
                UseVisualStyleBackColor = false

            };
            b5.Click += b5_Click;
            Table.Controls.Add(b5);

            Button b6 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(249, 221),
                Name = "button5",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "S2",
                UseVisualStyleBackColor = false,

            };
            b6.Click += b6_Click;
            Table.Controls.Add(b6);

            Button b7 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(249, 328),
                Name = "button9",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "S3",
                UseVisualStyleBackColor = false
            };

            b7.Click += b7_Click;
            Table.Controls.Add(b7);

            Button b8 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(249, 440),
                Name = "button10",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "S4",
                UseVisualStyleBackColor = false
            };

            b8.Click += b8_Click;
            Table.Controls.Add(b8);

            Button b9 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(397, 109),
                Name = "button3",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "T1",
                UseVisualStyleBackColor = false
            };

            b9.Click += b9_Click;
            Table.Controls.Add(b9);

            Button b10 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(397, 221),
                Name = "button6",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "T2",
                UseVisualStyleBackColor = false
            };

            b10.Click += b10_Click;
            Table.Controls.Add(b10);

            Button b11 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(397, 328),
                Name = "button11",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "T3",
                UseVisualStyleBackColor = false
            };

            b11.Click += b11_Click;
            Table.Controls.Add(b11);

            Button b12 = new Button()
            {
                BackColor = System.Drawing.Color.ForestGreen,
                Location = new System.Drawing.Point(397, 440),
                Name = "button12",
                Size = new System.Drawing.Size(71, 73),
                TabIndex = 0,
                Text = "T4",
                UseVisualStyleBackColor = false
            };
            b12.Click += b12_Click;
            Table.Controls.Add(b12);

            Button menuKitchen = new Button()
            {
                Location = new System.Drawing.Point(387, 49),
                Name = "button15",
                Size = new System.Drawing.Size(171, 44),
                TabIndex = 1,
                Text = "Menu - Kitchen",
                UseVisualStyleBackColor = true
            };
            menuKitchen.Click += menuKitchen_Click;
            Table.Controls.Add(menuKitchen);

            table.Show();
            this.Hide();
        }


        private void b1_Click(object sender, EventArgs e)
        {
            BillForm billForm= new BillForm();
            billForm.txtTableName.Text = "B1";
            billForm.Show();
            this.Hide();
        }
        private void b2_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "B2";
            billForm.Show();
            this.Hide();
        }
        private void b3_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "B3";
            billForm.Show();
            this.Hide();
        }
        private void b4_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "B4";
            billForm.Show();
            this.Hide();
        }
        private void b5_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "B4";
            billForm.Show();
            this.Hide();
        }
        private void b6_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "S2";
            billForm.Show();
            this.Hide();
        }
        private void b7_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "S3";
            billForm.Show();
            this.Hide();
        }
        private void b8_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "S4";
            billForm.Show();
            this.Hide();
        }
        private void b9_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "T1";
            billForm.Show();
            this.Hide();
        }
        private void b10_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "T2";
            billForm.Show();
            this.Hide();
        }
        private void b11_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "T3";
            billForm.Show();
            this.Hide();
        }
        private void b12_Click(object sender, EventArgs e)
        {
            BillForm billForm = new BillForm();
            billForm.txtTableName.Text = "T4";
            billForm.Show();
            this.Hide();
        }
        private void Menu_Click(object sender, EventArgs e)
        {
            MenuAddDeleteEdit menu = new MenuAddDeleteEdit();
            menu.ShowDialog();
        }
        private void Kitchen_Click(object sender, EventArgs e)
        {
            StockAddDeleteEdit stock = new StockAddDeleteEdit();
            stock.ShowDialog();
        }
         private void menuKitchen_Click(object sender, EventArgs e)
        {
            Menu_Kitchen menu = new Menu_Kitchen();
            menu.ShowDialog();
        }

        private void RestaurantLogin_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
