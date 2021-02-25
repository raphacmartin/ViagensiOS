//
//  PacoteViagemCollectionViewCell.swift
//  Viagens
//
//  Created by Raphael Martin on 18/02/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!    
    @IBOutlet weak var larguraImagemConstraint: NSLayoutConstraint!
}
