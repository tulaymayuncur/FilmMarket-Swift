//
//  KategorilerDao.swift
//  FilmlerUygulamasi
//
//  Created by Tülay MAYUNCUR on 27.09.2023.
//

import Foundation

class KategorilerDao {
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appending(path: "filmler.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumKategorileriAl() -> [Kategoriler] {
        var liste = [Kategoriler]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            
            while rs.next() {
                let kategori = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id"))!
                                           , kategori_ad: rs.string(forColumn: "kategori_ad")!)
                
                liste.append(kategori)
            }
            
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
        
    }
    
    
}
