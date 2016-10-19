using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer;

namespace theWineCellar.Controllers
{
    public class AbstractController : Controller
    {
        protected string imageFormat = ".jpg";

        //Local database connection instance
        //protected DataConnector connector = new DataConnector("Server=XPS-PC\\SQLEXPRESS;Database=TheWineCellar;User Id=sa;Password=LeonLFC71986;");

        //online database connection via free web hosting
        protected DataConnector connector = new DataConnector("Server=sql5031.mywindowshosting.com;Database=DB_A11AC5_leonmuscat;User Id=DB_A11AC5_leonmuscat_admin;Password=funked11;");
    }
}