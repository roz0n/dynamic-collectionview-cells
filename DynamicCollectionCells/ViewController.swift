//
//  ViewController.swift
//  DynamicCollectionCells
//
//  Created by Arnaldo Rozon on 12/24/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cv: UICollectionView?
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        
        // 1. Provide the layout with an estimated item size (refer to cell file for next steps)
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cv = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        cv!.delegate = self
        cv!.dataSource = self
        cv!.backgroundColor = Data.colors["background"]
        cv!.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
        view.addSubview(cv!)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv?.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        cell.text = Data.text[indexPath.row]
        
        return cell
    }
    
}

