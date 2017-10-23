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
               
                Manufacturer.Items.Insert(0, new ListItem("BMW", "BMW"));
                Manufacturer.Items.Insert(1, new ListItem("Mercedes", "Mercedes"));
                Manufacturer.Items.Insert(2, new ListItem("Porsche", "Porsche"));
                Manufacturer.Items.Insert(3, new ListItem("Opel", "Opel"));

                Model.MaxLength = 200;
                Date.MaxLength = 10;
                IsNew.Checked = true;

                GridViewCars.DataSource = carlist;
                GridViewCars.DataBind();

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

            Car car = new Car(this.Manufacturer.SelectedValue, this.Model.Text, fuel, date, this.IsNew.Checked, mileage);

            carlist.Add(car);

            GridViewCars.DataSource = carlist;
            GridViewCars.DataBind();

            //reset form after submit

            this.Manufacturer.SelectedIndex = 0;
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

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridViewCars.EditIndex)
            {
                (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCars.EditIndex = e.NewEditIndex;
            GridViewCars.DataSource = carlist;
            GridViewCars.DataBind();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewCars.Rows[e.RowIndex];
            int CarID = Convert.ToInt32(GridViewCars.DataKeys[e.RowIndex].Values[0]);
            string manufacturer = (row.FindControl("Manufacturer") as TextBox).Text;
            string model = (row.FindControl("Model") as TextBox).Text;

            carlist.Find(c => c.CarID == CarID).Manufacturer = manufacturer;
            carlist.Find(c => c.CarID == CarID).Model = model;

            GridViewCars.EditIndex = -1;
            GridViewCars.DataSource = carlist;
            GridViewCars.DataBind();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int CarID = Convert.ToInt32(GridViewCars.DataKeys[e.RowIndex].Values[0]);
            carlist.Remove(carlist.Where(c => c.CarID == CarID).First());
            GridViewCars.DataSource = carlist;
            GridViewCars.DataBind();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {

            GridViewCars.EditIndex = -1;
            GridViewCars.DataSource = carlist;
            GridViewCars.DataBind();
        }
    }
}