//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 11.09.2022.
//

import UIKit

class ToDoListViewController: UIViewController {
   
    
    
    private let viewModel = ToDoListViewModel()
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table .delegate = self
        table.dataSource = self
        table.register(ToDoTableViewCell.self, forCellReuseIdentifier: "toDoCell")
        table.rowHeight = 120
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configure()
        
    }
    
    func configure()  {
        addSubViews()
        makeConstraints()
        
    }

}
// MARK: TableView Protocols
extension ToDoListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoTableViewCell
        let item = ToDo(title: "Coding", content: "Make a todolist app.", date: "01/09/1999")
        cell.delegate = self
        cell.setTodoCell(item: item)
        
        return cell
    }
}

// MARK: Constrains and add subviews
extension ToDoListViewController {
    func addSubViews() {
        view.addSubview(tableView)
    }
    
    func makeConstraints() {
        tableView.frame = view.frame
    }
}

//MARK: TodoCell Conform Protocol
extension ToDoListViewController: ToDoTableViewCellProtocol{
    
    func checkButtonTapped(item: ToDo) {
            
    }
    
    func infoButtonTapped(item: ToDo) {
        
    }
}
