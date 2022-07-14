using MvcStok.Models.Entity;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcStok.Controllers
{
    public class KategoriController : Controller
    {
        MvcDbStokEntities db = new MvcDbStokEntities();
        public ActionResult Index(int sayfa=1)//datatable'ı sayfalara bölme
        {
            //var model = db.Tbl_Kategoriler.ToList();
            var model = db.Tbl_Kategoriler.ToList().ToPagedList(sayfa, 4);
            return View(model);
        }
        [HttpGet]
        public ActionResult YeniKategori()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YeniKategori(Tbl_Kategoriler kategori)
        {
            if(!ModelState.IsValid)
            {
                return View();
            }
            db.Tbl_Kategoriler.Add(kategori);
            db.SaveChanges();
            return View();  
        }
        public ActionResult Sil(int id)
        {
            var kategori = db.Tbl_Kategoriler.Find(id);
            db.Tbl_Kategoriler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult KategoriGetir(int id)
        {
            var kategori = db.Tbl_Kategoriler.Find(id);
            return View(kategori);
        }
        public ActionResult Guncelle(Tbl_Kategoriler kategori)
        {
            var ktg = db.Tbl_Kategoriler.Find(kategori.KategoriId);
            ktg.KategoriAd = kategori.KategoriAd;
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}