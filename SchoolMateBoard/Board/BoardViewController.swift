//
//  BoardViewController.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/11/27.
//

// 전체 게시판
import UIKit

class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    @IBOutlet weak var boardCollectionView: UICollectionView!
    @IBOutlet weak var writingButton: UIButton!
    
    var postManager = PostManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        writingButton.layer.cornerRadius = 10
    }
    
    // MARK: - Navigation
    
    // 글쓰기 버튼 클릭
    @IBAction func writingButtonPressed(_ sender: UIButton) {
        // WritingViewController로 이동
        self.performSegue(withIdentifier: "goToWriting", sender: self)
    }
    
    // 글쓰기 버튼 클릭시 모달창 띄움
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWriting" {
            let destinationVC = segue.destination as! WritingViewController
        }
    }
    
    // 게시물 클릭시 개별 게시글로 이동
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(withIdentifier: "postVC") as! PostViewController
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
    // MARK: - Helpers(Cell)
    // delegate, datasource 연결 및 cell 등록
    private func setupCollectionView() {
        // delegate 연결
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        // cell 등록(게시물 하나)
        boardCollectionView.register(UINib(nibName: "BoardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: BoardCollectionViewCell.identifier)
    }
    
    // cell(게시물) 개수 지정(한 화면에 기본 개수 15개)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 15
    }
    
    // cell(게시물) 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCollectionViewCell.identifier, for: indexPath) as? BoardCollectionViewCell else {
            fatalError("셀 타입 캐스팅 실패")
        }
        return cell
    }
    
    // 개별 게시물의 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(180))
    }
}
