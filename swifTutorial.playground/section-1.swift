let tutoriaTeam = 56
let editorialTeam = 23
var totalTeam = tutoriaTeam + editorialTeam

totalTeam += 1
let priceIntInferred = -19
let priceIntExplicit:Int = -19

let priceInferred = -19.99
let priceExplicit:Double = -19.99

let priceFloatInferred = -19.99
let priceFloatExplicit:Float = -19.99

let onsaleInferred = true
let onSaleExplicit:Bool = false

let nameInferred = "Whoopie Cushion"
let nameExplicit:String = "Whoopie Cushion"


//Array
var shoppingListEeplicit = [String]()
shoppingListEeplicit = ["Eggs","Milk"]
//var shoppingListExplicit: [string] = ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains \(shoppingList.count)items.")
shoppingList.append("Flour")
shoppingList += "Baking Powder"
shoppingList += ["Chocolate","Cheese","Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
//shoppingList[0...3] = ["Bananas","Apples"]
shoppingList


shoppingList += ["Baking Powder"]
//shoppingList now contains 4 items
shoppingList += ["Chocolate Spread","Chesse","Buffer"]
//shoppingList now contains 7 items

shoppingList.insert("Maple", atIndex: 0)
//shoppingList now contains 7 items
//"Maple Syrup" is now the first item in the list

shoppingList.append("Flour")
//shoppingList now contains 3 items,and someone is making pancakes

shoppingList += ["Baking Powder"]

var firtItem = shoppingList[0]
//firstItem is equal to "Eggs"

shoppingList[4...6] = ["Banannas","Apples"]
//shoppingList now contains 6 items


//Dictionary
let array: Array<Int> = [1,2,3,4]
let dictionary: Dictionary<String, Int> = ["dog" : 1, "elephant" : 2]

var airports: [String: String] = ["TYO": "Tokyo", "DUB": "Dublin"]

if airports.isEmpty{
    println("The airports dictionary is empty.")
} else {
    println("The airports dictionary is not empty.")
}
//prints "The airports dictionary is not empty".

println("The airports dictionary contains \(airports.count) items.")
//print "The airports dictionary contains 2 items."


airports["LHR"] = "London"
//the airports dictionary now contains 3 items

airports["LHR"] = "London Heathrow"
//the value for "LHR" has been changed to "London Heathrow"

if let oldValue = airports.updateValue("Doblin International", forKey: "DUB"){
    println("the old value for DUB was \(oldValue).")
}
//print "The old value for DUB was Dublin."


airports["APL"] = "Apple International"
//"Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

if let removedValue = airports.removeValueForKey("DUB"){
    println("The removed airport's name is \(removedValue).")
} else{
    println("The airport's dictionary dose not contian a value for DUB.")
}
//println("The removed airport's name isDublin International.")









