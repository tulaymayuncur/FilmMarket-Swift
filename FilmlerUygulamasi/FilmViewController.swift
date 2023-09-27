//
//  FilmViewController.swift
//  FilmlerUygulamasi
//
//  Created by Tülay MAYUNCUR on 24.09.2023.
//

import UIKit

class FilmViewController: UIViewController {
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    var kategori : Kategoriler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kategori {
            navigationItem.title = k.kategori_ad
            
            filmlerListesi = FilmlerDao().filmlerAl(kategori_id: k.kategori_id!)
            
        }
        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
        
        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.85)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        filmCollectionView.collectionViewLayout = tasarim
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! FilmDetayViewController
        gidilecekVC.film = filmlerListesi[indeks!]
    }
}

extension FilmViewController: UICollectionViewDelegate,UICollectionViewDataSource, FilmHucreCollectionViewCellProtocol{
    
    func sepeteEkle(indexPath: IndexPath) {
        print("Sepete Eklenen Film : \(filmlerListesi[indexPath.row].film_ad!)")
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucreCollectionViewCell
        
        cell.labelFilmAd.text = film.film_ad
        cell.labelFilmFiyat.text = "14.99 TL"
        cell.imageViewFilmResim.image = UIImage(named: film.film_resim!)
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
 
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    
    
}
