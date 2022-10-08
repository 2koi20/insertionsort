import Foundation


func progress(_ asciiList: [Float]) {
    var cache: Float = 1000
    var count: Int = 0
    for i in asciiList {
        if (i<cache) {
            cache = i
            count += 1
        }
    }
    print(count)
}

func toASCII(_ wordList: [String]) -> [Float] {
    var ASCIIList: [Float] = []
    for i in wordList {
        var ASCII: Float = 0
        var count = 0
        for x in i.utf8 {
            
            ASCII += Float(x)/pow(1000.0, Float(count))
            count += 1
        }
        ASCIIList.append(ASCII)
    }
    return(ASCIIList)
}
func insertion(_ wordList: [String]) {
    var outList = wordList
    var array = toASCII(wordList)
    for i in 1..<array.count {
                var currentIndex = i
                while currentIndex > 0 && array[currentIndex - 1] > array[currentIndex] {
                    let temp = array[currentIndex]
                    let tempWord = outList[currentIndex]
                    array[currentIndex] = array[currentIndex - 1]
                    array[currentIndex - 1] = temp
                    outList[currentIndex] = outList[currentIndex - 1]
                    outList[currentIndex - 1] = tempWord
                    
                    currentIndex -= 1
                }
    }
    print(outList)
}




var unsortedString = [""]
while let input = readLine() {
    unsortedString.append(input)
}
unsortedString.removeFirst()
insertion(unsortedString)
