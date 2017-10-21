using CarsDemo.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CarsDemo
{
    public partial class _Default : Page
    {
        protected static List<Car> carlist = new List<Car>();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {

                Manufactorer.Items.Insert(0, new ListItem("BMW", "BMW"));
                Manufactorer.Items.Insert(1, new ListItem("Mercedes", "Mercedes"));
                Manufactorer.Items.Insert(2, new ListItem("Porsche", "Porsche"));
                Manufactorer.Items.Insert(3, new ListItem("Opel", "Opel"));

                Model.MaxLength = 200;
                Date.MaxLength = 10;
                IsNew.Checked = true;

              


            }
        }

    
        protected void Submit_Click(object sender, EventArgs e)
        {
            string fuel = null;

            if (GasolineFuel.Checked)
            {
                fuel = "Gasoline";
            }

         else if (DieselFuel.Checked)
            {
                fuel = "Diesel";
            }

            else if (GasFuel.Checked)
            {
                fuel = "Gas";
            }

            DateTime date = DateTime.Parse(this.Date.Text);
            
           
            

            int mileage = Convert.ToInt32(this.Mileage.Text);

            Car car = new Car(this.Manufactorer.SelectedValue, this.Model.Text, fuel, date, this.IsNew.Checked, mileage);

            carlist.Add(car);

            GridViewCars.DataSource = carlist;
            GridViewCars.DataBind();

            //reset form after submit

            this.Manufactorer.SelectedIndex = 0;
            this.Model.Text = string.Empty;
            this.Date.Text = string.Empty;
            this.IsNew.Checked = true;
            this.Mileage.Text = string.Empty;

            

            if (GasolineFuel.Checked)
            {
                GasolineFuel.Checked = false;
            }

            else if (DieselFuel.Checked)
            {
                DieselFuel.Checked = false;
            }

            else if (GasFuel.Checked)
            {
                GasFuel.Checked = false;
            }

        }
    }
}