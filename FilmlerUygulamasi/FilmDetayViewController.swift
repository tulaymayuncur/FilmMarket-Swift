//
//  FilmDetayViewController.swift
//  FilmlerUygulamasi
//
//  Created by Tülay MAYUNCUR on 24.09.2023.
//

import UIKit

class FilmDetayViewController: UIViewController {
    @IBOutlet weak var imageFilmResim: UIImageView!
    
    @IBOutlet weak var labelFilmAd: UILabel!
    
    @IBOutlet weak var labelFilmYıl: UILabel!
    
    @IBOutlet weak var labelFilmYonetmen: UILabel!
    
    var film : Filmler?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            
            imageFilmResim.image = UIImage(named: f.film_resim!)
            labelFilmAd.text = f.film_ad
            labelFilmYıl.text = String(f.film_yil!)
           
            labelFilmYonetmen.text = f.kategori?.kategori_ad
            labelFilmYonetmen.text = f.yonetmen?.yonetmen_ad
            
        }
        

    }
    


}
