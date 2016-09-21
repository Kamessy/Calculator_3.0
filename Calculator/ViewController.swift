//
//  ViewController.swift
//  Calculator
//
//  Created by Life_is_Tech on 2016/09/17.
//  Copyright © 2016年 Life_is_Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var Switch : UISwitch!
    @IBOutlet var Edgeimage : UIImageView!
    @IBOutlet var Button0 : UIButton!
    @IBOutlet var Button1 : UIButton!
    @IBOutlet var Button2 : UIButton!
    @IBOutlet var Button3 : UIButton!
    @IBOutlet var Button4 : UIButton!
    @IBOutlet var Button5 : UIButton!
    @IBOutlet var Button6 : UIButton!
    @IBOutlet var Button7 : UIButton!
    @IBOutlet var Button8 : UIButton!
    @IBOutlet var Button9 : UIButton!
    @IBOutlet var Button_plus : UIButton!
    @IBOutlet var Button_minus : UIButton!
    @IBOutlet var Button_multiple : UIButton!
    @IBOutlet var Button_divide : UIButton!
    @IBOutlet var Button_equal : UIButton!
    @IBOutlet var Button_clear : UIButton!
    
    var direction:[Int8] = [0,1,3,2,0,2,1,3,2,0,2,3,1,0,3,1]
    //タイマー.
    var timer : NSTimer!
    var timer2 : NSTimer!
    var timer3 : NSTimer!
    var timer4 : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Switch.addTarget(self, action: #selector(ViewController.onClickMySwicth(_:)), forControlEvents: UIControlEvents.ValueChanged)
        //タイマーを作る.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(ViewController.onUpdate(_:)), userInfo: nil, repeats: true)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.03, target: self, selector:
            #selector(ViewController.onUpdate2(_:)), userInfo: nil, repeats: true)
        timer3 = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector:
            #selector(ViewController.onUpdate3(_:)), userInfo: nil, repeats: true)
        timer4 = NSTimer.scheduledTimerWithTimeInterval(0.015, target: self, selector:
            #selector(ViewController.onUpdate4(_:)), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    internal func onClickMySwicth(sender: UISwitch){
        
        if sender.on {
            Edgeimage.hidden = false
        }
        else {
            Edgeimage.hidden = true
        }
    }
    func Upd( ButtonNum : Int , Mybutton : UIButton){
        if(Mybutton.frame.origin.x == 0){
            switch(direction[ButtonNum])
            {
            case 0:
                if(Mybutton.frame.origin.y == 0){
                    direction[ButtonNum] = 3
                }
                else{
                    direction[ButtonNum] = 1
                }
                break
            case 2:
                if(Mybutton.frame.origin.y == 266){
                    direction[ButtonNum] = 1
                }
                else{
                    direction[ButtonNum] = 3
                }
                break
                
            default:
                break
            }
        }else if(Mybutton.frame.origin.x == 232){
            switch(direction[ButtonNum])
            {
            case 1:
                if(Mybutton.frame.origin.y == 0){
                    direction[ButtonNum] = 2
                }
                else{
                    direction[ButtonNum] = 0
                }
                break
            case 3:
                if(Mybutton.frame.origin.y == 266){
                    direction[ButtonNum] = 0
                }
                else{
                    direction[ButtonNum] = 2
                }
                break
                
            default:
                break
            }
        }else if(Mybutton.frame.origin.y == 0){
            switch(direction[ButtonNum])
            {
            case 0:
                direction[ButtonNum] = 2
                break
            case 1:
                direction[ButtonNum] = 3
                break
                
            default:
                break
            }
        }else if(Mybutton.frame.origin.y == 266){
            switch(direction[ButtonNum])
            {
            case 2:
                direction[ButtonNum] = 0
                break
            case 3:
                direction[ButtonNum] = 1
                break
                
            default:
                break
            }
        }
        switch (direction[ButtonNum]){
        case 0:
            Mybutton.frame.origin.x -= 1
            Mybutton.frame.origin.y -= 1
            break
        case 1:
            Mybutton.frame.origin.x += 1
            Mybutton.frame.origin.y -= 1
            break
        case 2:
            Mybutton.frame.origin.x -= 1
            Mybutton.frame.origin.y += 1
            break
        case 3:
            Mybutton.frame.origin.x += 1
            Mybutton.frame.origin.y += 1
            break
        default:
            break
        }

    }
    func onUpdate(timer : NSTimer){
        Upd(2, Mybutton: Button2)
        Upd(4, Mybutton: Button4)
        Upd(12, Mybutton: Button_multiple)
        Upd(13, Mybutton: Button_divide)
        Upd(15, Mybutton: Button_clear)
    }
    func onUpdate2(timer : NSTimer){
        Upd(1, Mybutton: Button1)
        Upd(5, Mybutton: Button5)
        Upd(7, Mybutton: Button7)
        Upd(8, Mybutton: Button8)
        
    }
    func onUpdate3(timer : NSTimer){
        Upd(3, Mybutton: Button3)
        Upd(6, Mybutton: Button6)
        Upd(9, Mybutton: Button9)
        Upd(10, Mybutton: Button_plus)
        Upd(11, Mybutton: Button_minus)
        
    }
    func onUpdate4(timer : NSTimer){
        Upd(0, Mybutton: Button0)
        Upd(14, Mybutton: Button_equal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var label : UILabel!
    var num_now : Int64 = 0
    var num_show : Int64 = 0
    var num_symbol : Int8 = 0
    var num_symbol_old : Int8 = 0
        
    func ShowMyText(num_input : Int64) -> Bool{//9223372036854775808
        //if (num_symbol_old == 5){return false}
        if (num_show < 922337203685477580){
            if (num_show > -922337203685477580){
                num_show = num_show * 10
                    if (num_show < 0){
                        num_show -= num_input
                    }else{
                        num_show += num_input
                }
            }
        }
        label.text = String(num_show)
        return true
    }
    func SetSymbol() -> Bool{
        if(num_now == 0){
            if(num_show == 0){
                if(num_symbol != 2 ){
                num_symbol = 0
                return false
                }
            }
        }
        if (num_symbol == 6){
            num_now = 0
            num_symbol = 0
        }
        switch(num_symbol_old){
        case 0:
            num_now = num_show
            break
        case 1:
            if(num_show > 9223372036854775807 - num_now){break}
            num_now = num_now + num_show
            break
        case 2:
            if(num_now < -9223372036854775808 + num_show){break}
            num_now = num_now - num_show
            break
        case 3:
            if (num_show != 0){
            if(num_now > 9223372036854775807 / num_show){break}
            if(num_now < -9223372036854775808 / num_show){break}
            }
            num_now = num_now * num_show
            break
        case 4:
            if(num_show == 0){break}
            num_now = num_now / num_show
            break
        case 5:
            //num_now = num_show
            break;
        case 6:
            num_now = 0
            break
        default:
            break
        }
        label.text = String(num_now)
        num_show = 0
        
        num_symbol_old = num_symbol
        
        num_symbol = 0
        return true;
    }
    @IBAction func num0(){
        ShowMyText(0)
    }
    @IBAction func num1(){
        ShowMyText(1)
    }
    @IBAction func num2(){
        ShowMyText(2)
    }
    @IBAction func num3(){
        ShowMyText(3)
    }
    @IBAction func num4(){
        ShowMyText(4)
    }
    @IBAction func num5(){
        ShowMyText(5)
    }
    @IBAction func num6(){
        ShowMyText(6)
    }
    @IBAction func num7(){
        ShowMyText(7)
    }
    @IBAction func num8(){
        ShowMyText(8)
    }
    @IBAction func num9(){
        ShowMyText(9)
    }
    @IBAction func num_plus(){
        num_symbol = 1
        SetSymbol()
    }
    @IBAction func num_minus(){
        num_symbol = 2
        SetSymbol()
    }
    @IBAction func num_multiple(){
        num_symbol = 3
        SetSymbol()
    }
    @IBAction func num_divide(){
        num_symbol = 4
        SetSymbol()
    }
    @IBAction func num_equal(){
        num_symbol = 5
        SetSymbol()
    }
    @IBAction func num_clear(){
        num_symbol = 6
        SetSymbol()
    }
}

