//
//  RootViewController.swift
//  MC3Test
//
//  Created by ParkJunHyuk on 2022/07/17.
//

import UIKit

//struct Word {
//    let hangleName : String
//    let englishName : String
//    let favorites : Bool
//}
//
//let words: [Word] = [Word(hangleName: "존잼", englishName: "very fun", favorites: false),
//                     Word(hangleName: "오빠", englishName: "brother", favorites: false),
//                     Word(hangleName: "킹받네", englishName: "very angry", favorites: false),
//                     Word(hangleName: "존맛탱(JMT)", englishName: "effing awesome", favorites: false)]


class RootViewController : UIViewController {
    
    var dictionaryTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
    }
    
    func attribute() {
        dictionaryTable.register(CustomCell.self , forCellReuseIdentifier: CustomCell.cellId)
        dictionaryTable.delegate = self
        dictionaryTable.dataSource = self
    }
    
    func layout() {
        
//        NSLayoutConstraint.activate([
//                    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    imageView.widthAnchor.constraint(equalToConstant: 200),
//                    imageView.heightAnchor.constraint(equalToConstant: 230),
//                ])
        
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(dictionaryTable)
        
        dictionaryTable.translatesAutoresizingMaskIntoConstraints = false
        
        dictionaryTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dictionaryTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        dictionaryTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        dictionaryTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            
        // list line 없애기
        dictionaryTable.separatorStyle = .none
    }
}

extension RootViewController : UITableViewDelegate, UITableViewDataSource {
    
    // 행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    // 셀을 만드는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dictionaryTable.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell

        cell.HangleName.text = words[indexPath.row].hangleName
        cell.EnglishName.text = words[indexPath.row].englishName

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let word = words[indexPath.row]
        let vc = WordDetailViewController()
        vc.wordName = word.hangleName
        navigationController?.pushViewController(vc, animated: true)
    }

}


import SwiftUI

struct RootViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = RootViewController

    func makeUIViewController(context: Context) -> RootViewController {
        return RootViewController()
    }

    func updateUIViewController(_ uiViewController: RootViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        RootViewControllerRepresentable()
    }
}
