using MvcStok.Models.Entity;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MvcStok.Controllers
{
    public class UrunController : Controller
    {
        MvcDbStokEntities db = new MvcDbStokEntities();
        public ActionResult Index()
        {
            var model = db.Tbl_Urunler.ToList();

            return View(model);
        }
        [HttpGet]
        public ActionResult YeniUrun()
        {
            List<SelectListItem> degerler = (from i in db.Tbl_Kategoriler.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.KategoriAd,
                                                 Value = i.KategoriId.ToString()
                                             }
                                           ).ToList();
            ViewBag.dgr = degerler;
            return View();
        }

        [HttpPost]
        public ActionResult YeniUrun(Tbl_Urunler urun)
        {
            var ktg = db.Tbl_Kategoriler.Where(x => x.KategoriId == urun.Tbl_Kategoriler.KategoriId).FirstOrDefault();
            urun.Tbl_Kategoriler = ktg;
            db.Tbl_Urunler.Add(urun);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var urun = db.Tbl_Urunler.Find(id);
            db.Tbl_Urunler.Remove(urun);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult UrunGetir(int id)
        {
            var urun = db.Tbl_Urunler.Find(id);
            List<SelectListItem> degerler = (from i in db.Tbl_Kategoriler.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.KategoriAd,
                                                 Value = i.KategoriId.ToString()
                                             }
                                           ).ToList();
            ViewBag.dgr = degerler;
            return View(urun);
        }
        public ActionResult Guncelle(Tbl_Urunler urun)
        {
            var model = db.Tbl_Urunler.Find(urun.UrunId);
            model.UrunAd = urun.UrunAd;
            model.Marka = urun.Marka;
            model.Stok = urun.Stok;
            model.Fiyat = urun.Fiyat;
            var ktg = db.Tbl_Kategoriler.Where(x => x.KategoriId == urun.Tbl_Kategoriler.KategoriId).FirstOrDefault();
            model.UrunKategori = ktg.KategoriId;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}