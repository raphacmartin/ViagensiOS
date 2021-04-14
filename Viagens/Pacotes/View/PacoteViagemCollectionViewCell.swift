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
    
    func configuraCelula(pacoteViagem: PacoteViagem, largura: CGFloat) {
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelQuantidadeDias.text = "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1).cgColor
        layer.cornerRadius = 8
        larguraImagemConstraint.constant = largura
    }
}
