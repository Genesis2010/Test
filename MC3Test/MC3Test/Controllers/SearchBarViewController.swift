//
//  SearchBarViewController.swift
//  MC3Test
//
//  Created by ParkJunHyuk on 2022/07/18.
//

import UIKit

struct Word {
    let hangleName : String
    let englishName : String
    let favorites : Bool
}

let words: [Word] = [Word(hangleName: "존잼", englishName: "very fun", favorites: false),
                     Word(hangleName: "오빠", englishName: "brother", favorites: false),
                     Word(hangleName: "킹받네", englishName: "very angry", favorites: false),
                     Word(hangleName: "존맛탱(JMT)", englishName: "effing awesome", favorites: false),
                     Word(hangleName: "존잼", englishName: "very fun", favorites: false),
                     Word(hangleName: "오빠", englishName: "brother", favorites: false),
                     Word(hangleName: "킹받네", englishName: "very angry", favorites: false)]



class SearchBarViewController : UIViewController, UISearchBarDelegate{
    
//    var searchController: UISearchController!
    private var search = UISearchController(searchResultsController: nil)
    
    let searchBar = UISearchBar()
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
//    @objc func handleShowSearchBar() {
//        navigationItem.titleView = searchBar
//    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        maketableView()
        makeSearchBar()
        
    }
    
    func maketableView() {
        tableView = UITableView()
        
        view.addSubview(tableView)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCell.self , forCellReuseIdentifier: CustomCell.cellId)
        tableView.dataSource = self
        tableView.dataSource = self
        
        // list line 없애기
        tableView.separatorStyle = .none
        
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView!,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute : .top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView!,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute : .bottom, multiplier: 1.0, constant: 0.0))

        self.view.addConstraint(NSLayoutConstraint(item: self.tableView!,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view, attribute : .leading, multiplier: 1.0, constant: 0.0))

        self.view.addConstraint(NSLayoutConstraint(item: self.tableView!,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute : .trailing, multiplier: 1.0, constant: 0.0))

    }
    
    func makeSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search here"
        searchController.obscuresBackgroundDuringPresentation = false
        
        // searchController 에 UISearchResultsUpdating 프로토콜을 사용하기 위해서
        searchController.searchResultsUpdater = self
        
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "K-POP Slang"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
  
}


// 검색 기능
extension SearchBarViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
//        print(text)
//        self.words. = self.words.items.filter{ $0.localizedCaseInsensitiveCompare(text)}
//        self.tableView.reloadData()
    }
}


extension SearchBarViewController : UITableViewDelegate, UITableViewDataSource {
    
    // 행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    // 셀을 만드는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell

        cell.HangleName.text = words[indexPath.row].hangleName
        cell.EnglishName.text = words[indexPath.row].englishName

        return cell
    }
    
    // DetailView로 들어가기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let word = words[indexPath.row]
        let vc = WordDetailViewController()
        vc.wordName = word.hangleName
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
}



import SwiftUI

struct SearchBarViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = SearchBarViewController

    func makeUIViewController(context: Context) -> SearchBarViewController {
        return SearchBarViewController()
    }

    func updateUIViewController(_ uiViewController: SearchBarViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview2: PreviewProvider {
    static var previews: some View {
        SearchBarViewControllerRepresentable()
    }
}
