using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.Model;

namespace theWineCellar.Controllers
{
    public class CatalogueController : Controller
    {
        // GET: Catalogue
        public ActionResult Index()
        {
            List<product> productList = new List<product>();

            product product1 = new product();
            product1.name = "Inbid";
            product1.price = 70;
            product1.info = "Ahmar";

            product product2 = new product();
            product2.name = "Champagne";
            product2.price = 80;
            product2.info = "Ifexfex";

            productList.Add(product1);
            productList.Add(product2);

            ViewBag.ProductList = productList;
            return View();
        }

        // GET: Catalogue/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Catalogue/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Catalogue/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Catalogue/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Catalogue/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Catalogue/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Catalogue/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
