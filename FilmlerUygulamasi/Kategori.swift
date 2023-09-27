//
//  Kategori.swift
//  FilmlerUygulamasi
//
//  Created by Tülay MAYUNCUR on 24.09.2023.
//

import Foundation

class Kategori {
    
    var kategori_id : Int?
    var kategori_ad : String?
    
    init(kategori_id: Int? = nil, kategori_ad: String? = nil) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}
