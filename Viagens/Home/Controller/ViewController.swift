//
//  ViewController.swift
//  Viagens
//
//  Created by Raphael Martin on 11/02/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let listaViagens = ViagemDAO().retornaTodasAsViagens()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewHoteis.layer.cornerRadius = 10
        viewPacotes.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaViagens[indexPath.row]
        celula.labelTitulo?.text = viagemAtual.titulo
        celula.labelQtdDias?.text = "\(viagemAtual.quantidadeDeDias) dias"
        celula.labelPreco?.text = viagemAtual.preco
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

}
