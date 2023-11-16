//
//  ViewController.swift
//  calculo
//
//  Created by Hazel Alain on 14/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoDescuento: UILabel!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var cantidadtxt: UITextField!
    @IBOutlet weak var porcentajetxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //para pantallas mas pequenas y que el teclado no interfiera con el diseno agregamos esto
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func tecladoUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        
        if sizeScreen <= 3000 {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -150
            }
        
        }
      
    }
    
    @objc func tecladoDown(){
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
        
    }
    //esta funcion sirve para eliminar teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func calcular(_ sender: UIButton) {
        
        guard let cantidad = cantidadtxt.text else { return }
        guard let porcentaje = porcentajetxt.text else { return }
    
        let cant = (cantidad as NSString).floatValue
        let porciento = (porcentaje as NSString).floatValue
        let desc = cant * porciento/100
        let res = cant - desc
        
        resultado.text = "$\(res)"
        resultadoDescuento.text = "$\(desc)"
        
        self.view.endEditing(true)
    }
    
    @IBAction func limpiar(_ sender: UIButton) {
        
        cantidadtxt.text = ""
        porcentajetxt.text = ""
        resultado.text = "$0.00"
        resultadoDescuento.text = "$0.00"
        
    }
    
}
