//
//  DetailToDoViewController.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 13.09.2022.
//

import UIKit

class DetailToDoViewController: UIViewController {

    private let viewModel = DetailToDoViewModel()
    
    var ToDoItem: ToDo?
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Content"
         label.font = UIFont.systemFont(ofSize: 12)
         label.textColor = .lightGray
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
         label.font = UIFont.systemFont(ofSize: 12)
         label.textColor = .lightGray
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Title"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    private let contentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Content"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    private let datepicker: UIDatePicker = {
       let date = UIDatePicker()
        date.datePickerMode = .dateAndTime
        date.preferredDatePickerStyle = .compact
        date.locale = .current
        return date
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        title = "Edit"
        addSubViews()
        makeAllConstraints()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
    }

    @objc func editButtonTapped(){
        let title = self.titleTextField.text ?? ""
        let content = self.contentTextField.text ?? ""
        let dateAndTime = self.datepicker.date.getDateAndTimeAsString()
        let newTodo = ToDoItem?.updateToDo(title: title, content: content, date: dateAndTime) ?? ToDo(title: "null", content: "null", date: "null")
        
        viewModel.editTodo(item: newTodo)
        
        navigationController?.popToRootViewController(animated: true)
        
    }

    func setEditToDoViewController()  {
        self.titleTextField.text = ToDoItem?.title
        self.contentTextField.text = ToDoItem?.content
        self.datepicker.date = ToDoItem?.date.getDateAndTimeAsDate() ?? Date()
    }
    
}


// MARK: Make all constraints and addsubviews
extension DetailToDoViewController {
    func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(contentLabel)
        view.addSubview(dateLabel)
        view.addSubview(titleTextField)
        view.addSubview(contentTextField)
        view.addSubview(datepicker)
        
        
    }
    
    func makeAllConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(10)
            make.leading.equalTo(titleTextField.snp.leading)
            make.trailing.equalTo(titleTextField.snp.trailing)
        }
        
        contentTextField.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom)
            make.leading.equalTo(contentLabel.snp.leading)
            make.trailing.equalTo(contentLabel.snp.trailing)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentTextField.snp.bottom).offset(10)
            make.leading.equalTo(contentTextField.snp.leading)
            make.trailing.equalTo(contentTextField.snp.trailing)
        }
        
        datepicker.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.leading.equalTo(dateLabel.snp.leading)
            
        }
        
        
    }
}
