//
//  ViewController.swift
//  iOSTest
//
//  Created by Alan Santoso on 21/07/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartView: UIView!
    
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        viewModel = ViewModel()
        
        viewModel?.bindData = { detailCellViewModels in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        viewModel?.fetchChartData()
        viewModel?.fetchProductDetail()
        
        let lineChartC = LineChartC()
        chartView.addSubview(lineChartC.view)
        lineChartC.view.translatesAutoresizingMaskIntoConstraints = false
        
        lineChartC.view.leadingAnchor.constraint(equalTo: chartView.leadingAnchor).isActive = true
        lineChartC.view.trailingAnchor.constraint(equalTo: chartView.trailingAnchor).isActive = true
        lineChartC.view.topAnchor.constraint(equalTo: chartView.topAnchor).isActive = true
        lineChartC.view.bottomAnchor.constraint(equalTo: chartView.bottomAnchor).isActive = true 
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CellType1", bundle: nil), forCellReuseIdentifier: CellType1.detailCellIdentifier)
        tableView.register(UINib(nibName: "CellType2", bundle: nil), forCellReuseIdentifier: CellType2.detailCellIdentifier)
        tableView.register(UINib(nibName: "CellType3", bundle: nil), forCellReuseIdentifier: CellType3.detailCellIdentifier)
        
        tableView.separatorStyle = .none
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType1.detailCellIdentifier, for: indexPath) as! CellType1
            
            if viewModel?.detailCellViewModels.count != 0 {
                if let model = viewModel?.detailCellViewModels{
                    cell.updateData(detailViewModel: model)
                }
            }
            
            return cell
        }else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType3.detailCellIdentifier, for: indexPath) as! CellType3
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType2.detailCellIdentifier, for: indexPath) as! CellType2
            if viewModel?.detailCellViewModels.count != 0{
                if let model = viewModel?.detailCellViewModels{
                    cell.updateData(row: indexPath.row, viewModel: model)
                }
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

