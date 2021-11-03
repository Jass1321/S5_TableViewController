//
//  ViewModelHistoryPosts.swift
//  S5_TableViewController
//
//  Created by MAC06 on 2/11/21.
//

import Foundation

class ViewModelHistoryPost {

    // Sabemos que aca vamos a hacer la peticion al API
    // Declar la ruta del API
    let urlAPI: String = "https://jsonplaceholder.typicode.com/posts"

    // Necisto una funcion la cual sea un lambda que se encargue de refrescar la data que traiga de mi API
    var refeshData = {
        () -> () in
    }

    // Necesito crear el array donde guarde los datos que traje de mi API
    var dataArrayHistoryPosts: [HistoryPosts] = [] {
        didSet {
            refeshData()
        }
    }

    // Necesito una funcion la cual se encargue de hacer una peticion a mi API
    // Debe parsear los datos del API
    // Parsear: Viene a ser la forma transformar la data que recibo a algo regible
    func getDataFromHistoryPosts() {
        // URLSession: Es una clase de swift la cual me permite obtener el contenido de una URL
        
        // Para poder transformar mi urlApi a un dato de tipo URL debo invocar a la clase URL que como parametro recibe un string y devuelve este pero convertido a una url
        
        // Yo debo validar que el resultado de mi url no sea * nil *
        guard let url = URL(string: urlAPI) else { return }

        // Como ya valide que mi url no sea nula debo hacer la peticion, para esto usaremos URLSession que funciona de la siguiente manera
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            // data: Se encuentra toda la iformacion del api que consulte
            // response: Estan los datos del request
            // error: Se encuentra el error en caso lo hubiera
            
            // Ahora yo debo covertir mi data a un JSON para poder parsearlo
            
            // validemo que mi data no sea null
            guard let dataJSON = data else { return }

            do {
                // Aca invoco a la clase JSONDecode para poder converitir mi data a un JSON
                let decoder = JSONDecoder()

                self.dataArrayHistoryPosts = try decoder.decode([HistoryPosts].self, from: dataJSON)

                // Debo guardar la informacion de mi data en un arrgle
            } catch let error as NSError {
                // NSError es un tipo de exception el cual permite capturar el error
                print(error.localizedDescription)
            }
        }.resume()
    }

}
