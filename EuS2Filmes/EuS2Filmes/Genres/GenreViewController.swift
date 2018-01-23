//
//  GenreViewController.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController
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
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension GenreViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "genreCell"
        let cell = genreTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }
}
