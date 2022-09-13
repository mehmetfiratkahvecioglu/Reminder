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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getItemsFromDefaults()
        tableView.reloadData()
    }
    
    func configure()  {
        title = "To Do List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        addSubViews()
        makeConstraints()
        
    }
    
    @objc func addButtonTapped(){
        let vc = CreateToDoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
// MARK: TableView Protocols
extension ToDoListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoTableViewCell
        let item = viewModel.toDos[indexPath.row]
        cell.delegate = self
        cell.setTodoCell(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
         let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
             self.deleteData(at: indexPath,item: ToDo(title: "432", content: "432", date: "32"))
         }

         let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

         return swipeActions
     }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }

    func deleteData(at indexPath: IndexPath,item: ToDo) {
            
        viewModel.deleteItemFromDefaults(index: indexPath)
        tableView.reloadData()
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
extension ToDoListViewController: ToDoTableViewCellProtocol {
    
    func checkButtonTapped(item: ToDo) {
        viewModel.checkButtonTapped(item: item)
        tableView.reloadData()
    }
    
    func infoButtonTapped(item: ToDo) {
        let vc = DetailToDoViewController()
        vc.ToDoItem = item
        vc.setEditToDoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
