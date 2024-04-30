//
//  ProductListViewController.swift
//  MVVMDemo
//
//  Created by Rishi Jha on 01/05/24.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!{
        didSet{
            self.productTableView.dataSource = self
        }
    }
    let viewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.register(UINib(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        
        configuration()
    }
}

extension ProductListViewController{
    func configuration(){
        initViewModel()
        ovservEvent()
    }
    func initViewModel(){
        viewModel.productFetch()
    }
    func ovservEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event{
            case .loading:
                print("Loding...")
            case .stopLoding:
                print("StopLoading")
            case .dataLodaded:
                print("Data Loaded")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}

extension ProductListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell") as? ProductListCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    
}
