//
//  ConfirmacaoPagamentoViewController.swift
//  Viagens
//
//  Created by Raphael Martin on 30/03/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    var pacoteComprado: PacoteViagem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelQuantidadePessoasPacoteViagem.text = "2 adultos"
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            
            self.botaoVoltarPraHome.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoasPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var botaoVoltarPraHome: UIButton!
    
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        if let navigation = navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
}
