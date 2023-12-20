//
//  HomeViewController.swift
//  SchoolMate
//
//  Created by 박도연 on 12/20/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let schoolRankNib = UINib(nibName: "SchoolRankTableViewCell", bundle: nil)
        tableView.register(schoolRankNib, forCellReuseIdentifier: "SchoolRankTableViewCell")
        
        let schoolLogoNib = UINib(nibName: "SchoolLogoTableViewCell", bundle: nil)
        tableView.register(schoolLogoNib, forCellReuseIdentifier: "SchoolLogoTableViewCell")
        
        let postNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(postNib, forCellReuseIdentifier: "PostTableViewCell")
        
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolRankTableViewCell", for: indexPath) as? SchoolRankTableViewCell
            else{
                return UITableViewCell()
            }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolLogoTableViewCell", for: indexPath) as? SchoolLogoTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell
            else{
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 528
        } else if indexPath.row == 1 {
            return 85
        } else {
            return 290
        }
    }
   func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? SchoolLogoTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SchoolLogoCollectionViewCell", for: indexPath) as?
                SchoolLogoCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:90 , height: 83)
    }
}
