//
//  GenreTableViewCell.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

let reloadCollectionViewNotification = NSNotification.Name(rawValue:"reloadCollectionViewNotification")

class GenreTableViewCell: UITableViewCell
{
    // MARK: - IBOutlets
    @IBOutlet weak var genreMovieCollectionView: UICollectionView!
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension GenreTableViewCell
{
    func setCollectionViewDataSourceDelegate<deleg: UICollectionViewDataSource & UICollectionViewDelegate> (dataSourceDelegate: deleg, forRow row: Int)
    {
        genreMovieCollectionView.dataSource = dataSourceDelegate
        genreMovieCollectionView.delegate = dataSourceDelegate
        genreMovieCollectionView.tag = row
        genreMovieCollectionView.setContentOffset(genreMovieCollectionView.contentOffset, animated: false)
        genreMovieCollectionView.reloadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: reloadCollectionViewNotification, object: nil)
    }
    
    var collectionViewOffSet: CGFloat
    {
        set
        {
            genreMovieCollectionView.contentOffset.x = newValue
        }
        get
        {
            return genreMovieCollectionView.contentOffset.x
        }
    }
    
    @objc func reloadCollectionView(notification: NSNotification)
    {
        self.genreMovieCollectionView.reloadData()
    }
}
