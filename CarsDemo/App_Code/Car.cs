using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace CarsDemo.App_Code
{
    public class Car
    {

        static int nrOfInstances = 1;

        public int CarID { get; set; }
        public string Manufacturer { get; set; }
        public string Model { get; set; }
        public string Fuel { get; set; }

        public DateTime Date { get; set; }
        public bool IsNew { get; set; }
        public int Mileage { get; set; }
        public Car(string Manufacturer, string Model, string Fuel, DateTime Date, bool IsNew, int Mileage)
        {
            this.CarID = nrOfInstances;
            nrOfInstances++;
            this.Manufacturer = Manufacturer;
            this.Model = Model;
            this.Fuel = Fuel;
            this.Date = Date;
            this.IsNew = IsNew;
            this.Mileage = Mileage;

            
        }

       

    }
}