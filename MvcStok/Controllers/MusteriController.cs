using MvcStok.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcStok.Controllers
{
    public class MusteriController : Controller
    {
        MvcDbStokEntities db = new MvcDbStokEntities();
        public ActionResult Index(string p)
        {
            var degerler = from d in db.Tbl_Musteriler select d;//datatable için de search yapmak için
            if (!string.IsNullOrEmpty(p))
            {
                degerler = degerler.Where(x => x.MusteriAd.Contains(p));
            }
            return View(degerler.ToList());
            //var model = db.Tbl_Musteriler.ToList();
            //return View(model);
        }
        [HttpGet]
        public ActionResult YeniMusteri()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YeniMusteri(Tbl_Musteriler musteri)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            db.Tbl_Musteriler.Add(musteri);
            db.SaveChanges(); 
            return View();
        }
        public ActionResult Sil(int id)
        {
            var musteri = db.Tbl_Musteriler.Find(id);
            db.Tbl_Musteriler.Remove(musteri);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult MusteriGetir(int id)
        {
            var musteri = db.Tbl_Musteriler.Find(id);
            return View(musteri);
        }

        public ActionResult Guncelle(Tbl_Musteriler musteri)
        {
            var model = db.Tbl_Musteriler.Find(musteri.MusteriId);
            model.MusteriAd = musteri.MusteriAd;
            model.MusteriSoyad = musteri.MusteriSoyad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
}
}