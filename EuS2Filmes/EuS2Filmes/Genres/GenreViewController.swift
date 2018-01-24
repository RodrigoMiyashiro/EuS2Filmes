//
//  GenreViewController.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class GenreViewController: CustomViewController
{

    // MARK: - Lets and Vars
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var genreTableView: UITableView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        genreTableView.tableFooterView = UIView()
    
        
//        token()
//        sessionGuest()
        getGenre()
    }
    
    private func token()
    {
        TokenManager.getToken { (token, error) in
            if let token = token
            {
                print("-->> Token: \(token.requestToke ?? "")")
            }
            else
            {
                print("-->> Error token: \(error ?? NSError())")
            }
        }
    }
    
    private func sessionGuest()
    {
        SessionManager.getSessionGuest { (sessionGuest, error) in
            if let sessionGuest = sessionGuest
            {
                print("-->> Session: \(sessionGuest.guestSessionID ?? "")")
            }
            else
            {
                print("-->> Error session: \(error ?? NSError())")
            }
        }
    }
    
    private func getGenre()
    {
        GenreManager.getListGenres { (genres, error) in
            if let list = genres
            {
                print("-->> List Genre Count: \(list.genres.count)")
                self.getMovies(genre: list.genres.first!)
            }
            else
            {
                print("-->> Error List Genre: \(error ?? NSError())")
            }
            
        }
    }
    
    
    private func getMovies(genre: Genre)
    {
        MovieManager.getListMovies(byGenre: genre.id, currentPage: 1) { (movies, error) in
            if let list = movies
            {
                print("-->> List Movies Count: \(list.movies.count)")
                self.getMovieDetail(movieID: list.movies.first?.id ?? 0)
            }
            else
            {
                print("-->> Error List Movie: \(error ?? NSError())")
            }
        }
    }

    private func getMovieDetail(movieID: Int)
    {
        MovieManager.getMovieDetail(movieID: movieID) { (movieDetail, error) in
            if let detail = movieDetail
            {
                print("-->> Movie Detail: \(detail.title)")
            }
            else
            {
                print("-->> Error Movie Detail: \(error ?? NSError())")
            }
        }
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Extension TableView DataSource
extension GenreViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "genreCell"
        let cell = genreTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! GenreTableViewCell
        
        return cell
    }
}

// MARK: - Extension TableView Delegate
extension GenreViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Title Genre"
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let row = indexPath.row
        
        guard let genreMovieTbCell = cell as? GenreTableViewCell else { return }
        genreMovieTbCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: row)
    }
}


// MARK: - Extension CollectionView DataSource
extension GenreViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cellIdentifier = "genreMovieCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GenreMovieCollectionViewCell
        
        return cell
    }
}

// MARK: - Extension CollectionView Delegate
extension GenreViewController: UICollectionViewDelegate
{
    
}
