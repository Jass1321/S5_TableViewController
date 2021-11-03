//
//  ViewController.swift
//  S5_TableViewController
//
//  Created by MAC06 on 2/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Ahora yo debo instanciar a mi clase ViewModel
    var viewModelHistoryPost = ViewModelHistoryPost()
    
    let names: [String] = ["kiara", "sandra", "venus", "jass"]
    let lastNames: [String] = ["pinedo", "alcantara", "lorza", "espinoza"]
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // para seguir buenas practicas voy a crear funciones que se llamen en el viwDidLoad
        configureView()
        // lamar a bin
        bind()
        //llamando al setUpTable
        setUpTable()
    }

    func configureView() {
        // se va a encargar de ejecutar a la funcion que hace la peticion
        viewModelHistoryPost.getDataFromHistoryPosts()
    }


    func printData() {
        for post in viewModelHistoryPost.dataArrayHistoryPosts {
            print("userId: \(post.userId)")
            print("id: \(post.id)")
            print("title: \(post.title)")
            print("body: \(post.body)")
        }
    }
    
    func setUpTable() {
        //aca se delega que mi tabla sea la propia vista
        TableView.delegate = self
        TableView.dataSource = self
        
    }

    func bind() {
        // Se encargue de refrescar data
        viewModelHistoryPost.refeshData = { [weak self] in
            DispatchQueue.main.async {
                // aca voy a invoar a la funcion que se encargue de imprimir la informacion
                self?.printData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // cantidad de datos
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = names[indexPath.row]
        cell.detailTextLabel?.text = lastNames[indexPath.row]

        return cell
        
    }
}


