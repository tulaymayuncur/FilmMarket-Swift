//
//  FilmHucreCollectionViewCell.swift
//  FilmlerUygulamasi
//
//  Created by Tülay MAYUNCUR on 24.09.2023.
//

import UIKit

protocol FilmHucreCollectionViewCellProtocol {
    func sepeteEkle(indexPath:IndexPath)
    
}

class FilmHucreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewFilmResim: UIImageView!
    
    @IBOutlet weak var labelFilmAd: UILabel!
    
    @IBOutlet weak var labelFilmFiyat: UILabel!
    
    var hucreProtocol : FilmHucreCollectionViewCellProtocol?
    var indexPath:IndexPath?

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
        
    }
    
}
