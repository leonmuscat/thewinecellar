﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.Model;

namespace theWineCellar.Controllers
{
    public class CatalogueController : AbstractController
    {
         

        // GET: Catalogue
        public ActionResult Index()
        {
            var productList = connector.getCatalogue(imageFormat);
            //string test = Convert.ToString(productList.ElementAt(0));
            //productList.ElementAt(0).pic = VirtualPathUtility.ToAbsolute(test);

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
