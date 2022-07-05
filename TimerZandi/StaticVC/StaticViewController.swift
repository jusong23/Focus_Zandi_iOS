//
//  StaticViewController.swift
//  TimerZandi
//
//  Created by 이주송 on 2022/07/04.
//

import UIKit

class StaticViewController: UIViewController {

    @IBOutlet weak var zandiCollectionView: UICollectionView!
   
    @IBAction func reLoadButton(_ sender: UIButton) {
        debugPrint("새로고침합니다.")
        self.zandiCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureColletionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePush VC 뷰가 나타날 것이다.")
//        self.sumArray.append(UserDefaults.standard.integer(forKey: sumTime))
//        debugPrint(self.sumArray)
//        debugPrint(self.sumArray.max())
//        self.configureColletionView()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SeguePush VC 뷰가 나타났다.")
    }
    
//    var ZandiContents = [ZandiContents]()
// 뷰 넘길때마다 합이 저장되어 색을 변경해야 하는데 셀 색깔 바꾸는 메소드가 한번밖에 안일어남. 한번에 저장한 다음에 콜렉션뷰로 리로드 해서 바꾸기
    
    private func configureColletionView() {
            self.zandiCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
            self.zandiCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            // zandiCollectionView 와 ZandiCell 사이의 간격
            self.zandiCollectionView.delegate = self
            self.zandiCollectionView.dataSource = self
        }
}

extension StaticViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
//        return CGSize(width: (UIScreen.main.bounds.width / 10), height: 40) // 행간의 Cell이 2개 표시됨
    } // sizeForItemAt 메소드 : 셀의 사이즈 찍어내는 메소드
}

extension StaticViewController: UICollectionViewDataSource {
    // 아래는 필수 메소드 두개 !
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    } // 콜렉션뷰의 위치에 표시할 셀의 "갯수"[필수 메서드]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZandiCell", for: indexPath) as? ZandiCell else {return UICollectionViewCell() }
        cell.layer.cornerRadius = 6
        
        let testData = UserDefaults.standard.integer(forKey: sumTime)

        debugPrint("콜렉션 뷰다 !!")
        if testData > 3 && testData <= 6 {
            cell.backgroundColor = .yellow
        } else if testData > 6 && testData <= 12 {
            cell.backgroundColor = .orange
        } else if testData > 12 {
            cell.backgroundColor = .red
        }
         
        return cell
    } // 콜렉션뷰의 위치에 표시할 셀을 "요청"하는 메소드[필수 메서드]
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("이 날의 총 집중시간 : \(UserDefaults.standard.integer(forKey: sumTime)) 초")
        debugPrint("이 날의 집중 중단 횟수  : \(UserDefaults.standard.integer(forKey: countTime)) 회")
    }

    
} // 콜렉션 뷰로 보여지는 컨텐츠를 관리하는 객체

