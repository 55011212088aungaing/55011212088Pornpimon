class Zoo{
    let name : String
    let food : String
    
    var Newname:[String] = ["Birds","Elephant","Tiger"]
    var Newfood:[String] = ["Worm","Cane","Beef"]
    
    
    init(name:String, food:String){
        self.name = name
        self.food = food
    }
    
    func  Zooname (){
        Newname += name
        Newfood += food
    }
    
    
}

let test = Zoo(name:"monky",food:"Banana")
test.Zooname()

