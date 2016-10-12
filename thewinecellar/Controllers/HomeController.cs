using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace theWineCellar.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Time You get to know what The Wine Cellar is all About...";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Hit the right location with just one Click!.";

            return View();
        }
    }
}