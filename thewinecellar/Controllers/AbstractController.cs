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
        protected string imageFormat = ".jpeg";
        protected DataConnector connector = new DataConnector("Server=XPS-PC\\SQLEXPRESS;Database=NovaCosmetics;User Id=sa;Password=LeonLFC71986;");
    }
}