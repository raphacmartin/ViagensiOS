//
//  PacotesViewController.swift
//  Viagens
//
//  Created by Raphael Martin on 18/02/21.
//

import UIKit

class PacotesViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    let cellsPerRow: CGFloat = 2.0
    let marginBetweenCells: CGFloat = 15.0
    
    let listaComTodasViagens = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens = [PacoteViagem]()
    
    override func viewDidLoad() {
        listaViagens = listaComTodasViagens
        self.labelContadorPacotes.text = atualizaContadorLabel()
        
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaViagens[indexPath.row]
        celulaPacote.labelTitulo.text = pacoteAtual.viagem.titulo
        celulaPacote.labelQuantidadeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(pacoteAtual.viagem.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        let width: CGFloat = getCellWidth(for: collectionView)
        celulaPacote.larguraImagemConstraint.constant = width
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = getCellWidth(for: collectionView)
        return CGSize(width: width, height: 160)
    }
    
    func getCellWidth(for collectionView: UICollectionView) -> CGFloat {
        return (collectionView.bounds.width / cellsPerRow) - marginBetweenCells
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let pacote = listaViagens[indexPath.item]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.present(controller, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            listaViagens = listaComTodasViagens
        } else {
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada = (listaComTodasViagens as NSArray).filtered(using: filtroListaViagem) as! [PacoteViagem]
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
}
