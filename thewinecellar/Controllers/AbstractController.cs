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
        protected DataConnector connector = new DataConnector("Server=XPS-PC\\SQLEXPRESS;Database=TheWineCellar;User Id=sa;Password=LeonLFC71986;");
    }
}