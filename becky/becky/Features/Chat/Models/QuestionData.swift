//
//  questionsData.swift
//  tempMC
//
//  Created by Tiffany Angela Indryani on 02/05/23.
//

import Foundation

class QuestionPack: Identifiable {
    var id = UUID()
    var questionNumber: Int
    var question: String
    var isDone: Bool = false
    var choices: [AnswersChoice] = []

    init(questionNumber: Int, question: String, choices: [AnswersChoice] = []) {
        self.questionNumber = questionNumber
        self.question = question
        self.choices = choices
    }
    
    func markAsDone(){
        isDone = true
    }
    
    func add(choices: [AnswersChoice]){
        self.choices = choices
    }
}

//struct QuestionArray: Identifiable{
//    var id = UUID()
//    var questionArr: String
//}

struct QuestionDataSource{
    static var shared = QuestionDataSource()
    private init(){}
    
    func generateQuestionPack() -> (QuestionPack, [[QuestionPack]], [QuestionPack], [QuestionPack], [QuestionPack], [QuestionPack], QuestionPack){
        let questionPack1 = QuestionPack(questionNumber: 1, question: "Is this a need or a want?")
        let questionPack2 = QuestionPack(questionNumber: 2, question: "Are you buying this for the right reasons?")
        let questionPack3 = QuestionPack(questionNumber: 3, question: "Can you get by without it?")
        let questionPack4 = QuestionPack(questionNumber: 4, question: "Do you need it right now?")
        let questionPack5 = QuestionPack(questionNumber: 5, question: "Can you wait to buy it?")
        let questionPack6 = QuestionPack(questionNumber: 6, question: "Why can’t you wait?")
        let questionPack7 = QuestionPack(questionNumber: 7, question: "What will happen if you don’t buy it now?")
        let questionPack8 = QuestionPack(questionNumber: 8, question: "Besides this item, is there any other thing that you need to buy?")
        let questionPack9 = QuestionPack(questionNumber: 9, question: "Do I have any other obligation to fulfill?")
        let questionPack10 = QuestionPack(questionNumber: 10, question: "Could you afford it?")
        let questionPack11 = QuestionPack(questionNumber: 11, question: "Have you budgeted for this item that you want?")
        let questionPack12 = QuestionPack(questionNumber: 12, question: "What can you cut from the budget to make room for this?")
        let questionPack13 = QuestionPack(questionNumber: 13, question: "What else could you do with this money?")
        let questionPack14 = QuestionPack(questionNumber: 14, question: "How much did you have to work to earn this?")
        let questionPack15 = QuestionPack(questionNumber: 15, question: "Would you rather put the money elsewhere?")
        let questionPack16 = QuestionPack(questionNumber: 16, question: "Will you have to sacrifice elsewhere?")
        let questionPack17 = QuestionPack(questionNumber: 17, question: "Is right now the best time to buy?")
        let questionPack18 = QuestionPack(questionNumber: 18, question: "What’s the long-term cost of owning and maintaining this item?")
        let questionPack19 = QuestionPack(questionNumber: 19, question: "Can you handle the maintenance?")
        let questionPack20 = QuestionPack(questionNumber: 20, question: "What are the risks associated with this purchase?")
        let questionPack21 = QuestionPack(questionNumber: 21, question: "Will this improve your life enough to be worth the cost?")
        let questionPack22 = QuestionPack(questionNumber: 22, question: "How often will you use this item?")
        let questionPack23 = QuestionPack(questionNumber: 23, question: "Will a store brand suffice?")
        let questionPack24 = QuestionPack(questionNumber: 24, question: "Will this item bring long-term value to your life, or is it just a temporary fix for a problem?")
        let questionPack25 = QuestionPack(questionNumber: 25, question: "How long will this item last?")
        let questionPack26 = QuestionPack(questionNumber: 26, question: "Do you love the item or the price?")
        let questionPack27 = QuestionPack(questionNumber: 27, question: "Do you already own something similar?")
        let questionPack28 = QuestionPack(questionNumber: 28, question: "Will you still want/need this next week/month/year?")
        let questionPack29 = QuestionPack(questionNumber: 29, question: "Have you done your research on this purchase?")
        let questionPack30 = QuestionPack(questionNumber: 30, question: "What do the reviews say about this product?")
        let questionPack31 = QuestionPack(questionNumber: 31, question: "Is there anything else you should know before you decide?")
        let questionPack32 = QuestionPack(questionNumber: 32, question: "Are you buying from a reputable source?")
        let questionPack33 = QuestionPack(questionNumber: 33, question: "Is there an emotional reason why you want to buy it?")
        let questionPack34 = QuestionPack(questionNumber: 34, question: "Will this go on sale soon?")
        let questionPack35 = QuestionPack(questionNumber: 35, question: "Have you consulted with others who might have an opinion about this purchase?")
        let questionPack36 = QuestionPack(questionNumber: 36, question: "Will you still love/use it 6 months / years from now?")
        let questionPack37 = QuestionPack(questionNumber: 37, question: "Do you need to own it, or could you borrow it from a friend or elsewhere?")
        let questionPack38 = QuestionPack(questionNumber: 38, question: "Are there any alternatives or cheaper options that can fulfill the same purpose?")
        let questionPack39 = QuestionPack(questionNumber: 39, question: "Am I getting the best deal?")
        let questionPack40 = QuestionPack(questionNumber: 40, question: "Is this the best quality I can afford?")

        let questionFake = QuestionPack(questionNumber: 41, question: "Wait for your result...")
        
        let answer1_1 = AnswersChoice(no: 1, text: "Need", score: 7)
        let answer1_2 = AnswersChoice(no: 2, text: "Want", score: 0)
        let answer1_3 = AnswersChoice(no: 3, text: "Both", score: 5)
        
        let answer2_1 = AnswersChoice(no: 1, text: "Yes", score: 5)
        let answer2_2 = AnswersChoice(no: 2, text: "No", score: 0)
        let answer2_3 = AnswersChoice(no: 3, text: "Maybe", score: 1)
        
        let answer3_1 = AnswersChoice(no: 1, text: "Yes", score: 0)
        let answer3_2 = AnswersChoice(no: 2, text: "No", score: 5)
        let answer3_3 = AnswersChoice(no: 3, text: "Not Sure", score: 1)
        
        let answer4_1 = AnswersChoice(no: 1, text: "Yes because it is gonna be used now", score: 7)
        let answer4_2 = AnswersChoice(no: 2, text: "Not now but soon I will need it", score: 5)
        let answer4_3 = AnswersChoice(no: 3, text: "No it can be purchased any time in the future", score: 0)
        
        let answer5_1 = AnswersChoice(no: 1, text: "Yes, I can wait", score: 0)
        let answer5_2 = AnswersChoice(no: 2, text: "No, I want it now", score: 1)
        let answer5_3 = AnswersChoice(no: 3, text: "I can but under some circumstance it is better to purchase now", score: 5)
                
        let answer6_1 = AnswersChoice(no: 1, text: "Fear of Missing Out (FOMO)", score: 0)
        let answer6_2 = AnswersChoice(no: 2, text: "I want it since a long time ago", score: 5)
        let answer6_3 = AnswersChoice(no: 3, text: "I just really want it because I like it", score: 1)
              
        let answer7_1 = AnswersChoice(no: 1, text: "I cannot do certain task", score: 7)
        let answer7_2 = AnswersChoice(no: 2, text: "Price will get higher", score: 5)
        let answer7_3 = AnswersChoice(no: 3, text: "Nothing will happen in particular", score: 0)
        
        let answer8_1 = AnswersChoice(no: 1, text: "Yes but it is not my priority", score: 5)
        let answer8_2 = AnswersChoice(no: 2, text: "Yes and it is a higher priority", score: 0)
        let answer8_3 = AnswersChoice(no: 3, text: "Nope", score: 7)
        
        let answer9_1 = AnswersChoice(no: 1, text: "I have other obligation but it is due later", score: 5)
        let answer9_2 = AnswersChoice(no: 2, text: "I have other obligation and it is due really soon", score: 0)
        let answer9_3 = AnswersChoice(no: 3, text: "I have no other obligation", score: 7)
        
        let answer10_1 = AnswersChoice(no: 1, text: "Yes and I still have some money for other things", score: 7)
        let answer10_2 = AnswersChoice(no: 2, text: "Yes but I will have very little money after that", score: 1)
        let answer10_3 = AnswersChoice(no: 3, text: "Honestly I cannot / shouldn’t afford it now", score: 0)
        
        let answer11_1 = AnswersChoice(no: 1, text: "No i just saw it and i want it", score: 0)
        let answer11_2 = AnswersChoice(no: 2, text: "Yes i have planned to buy this", score: 7)
        let answer11_3 = AnswersChoice(no: 3, text: "No i have not budgeted it but i do have some spare budget for this", score: 5)
        
        let answer12_1 = AnswersChoice(no: 1, text: "Some basic needs or certain obligation", score: 0)
        let answer12_2 = AnswersChoice(no: 2, text: "My saving for future purposes", score: 1)
        let answer12_3 = AnswersChoice(no: 3, text: "Nothing", score: 7)
        
        let answer13_1 = AnswersChoice(no: 1, text: "Pay for my needs", score: 0)
        let answer13_2 = AnswersChoice(no: 2, text: "Savings and investment", score: 0)
        let answer13_3 = AnswersChoice(no: 3, text: "Spend it on other unimportant things", score: 5)
        
        let answer14_1 = AnswersChoice(no: 1, text: "Less than my weekly salary", score: 5)
        let answer14_2 = AnswersChoice(no: 2, text: "Less than my monthly salary", score: 1)
        let answer14_3 = AnswersChoice(no: 3, text: "More than my monthly salary", score: 0)
        
        let answer15_1 = AnswersChoice(no: 1, text: "Yes I can purchase something more important", score: 0)
        let answer15_2 = AnswersChoice(no: 2, text: "Yes I can save or invest the money", score: 0)
        let answer15_3 = AnswersChoice(no: 3, text: "No I do not put the money elsewhere", score: 5)
        
        let answer16_1 = AnswersChoice(no: 1, text: "Yes but it’s okay", score: 0)
        let answer16_2 = AnswersChoice(no: 2, text: "Yes and it is risky", score: 0)
        let answer16_3 = AnswersChoice(no: 3, text: "Not at all", score: 5)
        
        let answer17_1 = AnswersChoice(no: 1, text: "There might be discount later", score: 0)
        let answer17_2 = AnswersChoice(no: 2, text: "I still have other obligation/needs", score: 0)
        let answer17_3 = AnswersChoice(no: 3, text: "Yes it is the perfect timing", score: 5)
        
        let answer18_1 = AnswersChoice(no: 1, text: "I need to do some maintenance later and will spend more money", score: 0)
        let answer18_2 = AnswersChoice(no: 2, text: "It is not durable", score: 0)
        let answer18_3 = AnswersChoice(no: 3, text: "No there is no cost", score: 5)
        
        let answer19_1 = AnswersChoice(no: 1, text: "Yes", score: 5)
        let answer19_2 = AnswersChoice(no: 2, text: "No", score: 0)
        let answer19_3 = AnswersChoice(no: 3, text: "Not sure", score: 0)
        
        let answer20_1 = AnswersChoice(no: 1, text: "Cannot pay for obligation and health risk", score: 0)
        let answer20_2 = AnswersChoice(no: 2, text: "Cannot purchase needs", score: 0)
        let answer20_3 = AnswersChoice(no: 3, text: "None", score: 5)
        
        let answer21_1 = AnswersChoice(no: 1, text: "It will improve and it’s worth it", score: 7)
        let answer21_2 = AnswersChoice(no: 2, text: "It will improve but not worth it", score: 3)
        let answer21_3 = AnswersChoice(no: 3, text: "No it won’t", score: 0)
        
        let answer22_1 = AnswersChoice(no: 1, text: "Very often", score: 7)
        let answer22_2 = AnswersChoice(no: 2, text: "Sometimes", score: 5)
        let answer22_3 = AnswersChoice(no: 3, text: "Rarely", score: 0)
        
        let answer23_1 = AnswersChoice(no: 1, text: "Yes it’s all about the brand", score: 0)
        let answer23_2 = AnswersChoice(no: 2, text: "Other brands with the same quality will be okay", score: 7)
        let answer23_3 = AnswersChoice(no: 3, text: "I can’t find another brand for this item", score: 3)
        
        let answer24_1 = AnswersChoice(no: 1, text: "Long term value", score: 7)
        let answer24_2 = AnswersChoice(no: 2, text: "Temporary fix for a problem", score: 5)
        let answer24_3 = AnswersChoice(no: 3, text: "Not fixing any problem", score: 0)
        
        let answer25_1 = AnswersChoice(no: 1, text: "For a long time", score: 7)
        let answer25_2 = AnswersChoice(no: 2, text: "For a while", score: 5)
        let answer25_3 = AnswersChoice(no: 3, text: "One time usage", score: 1)

        let answer26_1 = AnswersChoice(no: 1, text: "The item", score: 3)
        let answer26_2 = AnswersChoice(no: 2, text: "The price", score: 1)
        let answer26_3 = AnswersChoice(no: 3, text: "Both", score: 5)
    
        let answer27_1 = AnswersChoice(no: 1, text: "Yes and it’s still in good condition", score: 0)
        let answer27_2 = AnswersChoice(no: 2, text: "Yes but it is not in good condition", score: 5)
        let answer27_3 = AnswersChoice(no: 3, text: "Nothing at all", score: 7)

        let answer28_1 = AnswersChoice(no: 1, text: "Yes", score: 5)
        let answer28_2 = AnswersChoice(no: 2, text: "Maybe I’ll bore myself someday", score: 1)
        let answer28_3 = AnswersChoice(no: 3, text: "I think I only want/need this now", score: 0)

        let answer29_1 = AnswersChoice(no: 1, text: "I’ve checked everything", score: 5)
        let answer29_2 = AnswersChoice(no: 2, text: "I did a little research", score: 1)
        let answer29_3 = AnswersChoice(no: 3, text: "No I haven’t", score: 0)

        let answer30_1 = AnswersChoice(no: 1, text: "It has great review", score: 5)
        let answer30_2 = AnswersChoice(no: 2, text: "It is okay", score: 1)
        let answer30_3 = AnswersChoice(no: 3, text: "It has bad review", score: 0)

        let answer31_1 = AnswersChoice(no: 1, text: "I think so", score: 0)
        let answer31_2 = AnswersChoice(no: 2, text: "I don’t think so", score: 3)
        let answer31_3 = AnswersChoice(no: 3, text: "I don’t know", score: 0)

        let answer32_1 = AnswersChoice(no: 1, text: "Yes", score: 5)
        let answer32_2 = AnswersChoice(no: 2, text: "No", score: 0)
        let answer32_3 = AnswersChoice(no: 3, text: "Maybe", score: 0)
 
        let answer33_1 = AnswersChoice(no: 1, text: "Yes", score: 5)
        let answer33_2 = AnswersChoice(no: 2, text: "No", score: 0)
        let answer33_3 = AnswersChoice(no: 3, text: "I can't tell", score: 0)
    
        let answer34_1 = AnswersChoice(no: 1, text: "Yes but I can’t wait", score: 0)
        let answer34_2 = AnswersChoice(no: 2, text: "No I’m sure it won’t", score: 5)
        let answer34_3 = AnswersChoice(no: 3, text: "I don’t have the information", score: 0)
  
        let answer35_1 = AnswersChoice(no: 1, text: "I did and they agree", score: 5)
        let answer35_2 = AnswersChoice(no: 2, text: "I did but they did not agree", score: 0)
        let answer35_3 = AnswersChoice(no: 3, text: "I didn’t ask anyone", score: 0)
   
        let answer36_1 = AnswersChoice(no: 1, text: "I will", score: 3)
        let answer36_2 = AnswersChoice(no: 2, text: "I don't think so", score: 0)
        let answer36_3 = AnswersChoice(no: 3, text: "I could sell it if I don’t like it anymore", score: 1)

        let answer37_1 = AnswersChoice(no: 1, text: "I must own it", score: 5)
        let answer37_2 = AnswersChoice(no: 2, text: "I actually could borrow it", score: 0)
        let answer37_3 = AnswersChoice(no: 3, text: "I would if I know I could borrow this from someone", score: 1)
   
        let answer38_1 = AnswersChoice(no: 1, text: "There is but I doubt the quality", score: 5)
        let answer38_2 = AnswersChoice(no: 2, text: "There is but I believe in this price", score: 5)
        let answer38_3 = AnswersChoice(no: 3, text: "No there isn’t", score: 7)
  
        let answer39_1 = AnswersChoice(no: 1, text: "Yes", score: 7)
        let answer39_2 = AnswersChoice(no: 2, text: "I don't think so", score: 0)
        let answer39_3 = AnswersChoice(no: 3, text: "I know i can get better deal but I can’t wait", score: 3)
    
        let answer40_1 = AnswersChoice(no: 1, text: "Yes this is the best that I can afford", score: 7)
        let answer40_2 = AnswersChoice(no: 2, text: "No the quality is okay/bad but I can afford this", score: 3)
        let answer40_3 = AnswersChoice(no: 3, text: "The quality is great but I actually am not sure I can afford this", score: 0)
        
        questionPack1.add(choices: [answer1_1,answer1_2,answer1_3])
        questionPack2.add(choices: [answer2_1,answer2_2,answer2_3])
        questionPack3.add(choices: [answer3_1,answer3_2,answer3_3])
        questionPack4.add(choices: [answer4_1,answer4_2,answer4_3])
        questionPack5.add(choices: [answer5_1,answer5_2,answer5_3])
        questionPack6.add(choices: [answer6_1,answer6_2,answer6_3])
        questionPack7.add(choices: [answer7_1,answer7_2,answer7_3])
        questionPack8.add(choices: [answer8_1,answer8_2,answer8_3])
        questionPack9.add(choices: [answer9_1,answer9_2,answer9_3])
        questionPack10.add(choices: [answer10_1,answer10_2,answer10_3])
        questionPack11.add(choices: [answer11_1,answer11_2,answer11_3])
        questionPack12.add(choices: [answer12_1,answer12_2,answer12_3])
        questionPack13.add(choices: [answer13_1,answer13_2,answer13_3])
        questionPack14.add(choices: [answer14_1,answer14_2,answer14_3])
        questionPack15.add(choices: [answer15_1,answer15_2,answer15_3])
        questionPack16.add(choices: [answer16_1,answer16_2,answer16_3])
        questionPack17.add(choices: [answer17_1,answer17_2,answer17_3])
        questionPack18.add(choices: [answer18_1,answer18_2,answer18_3])
        questionPack19.add(choices: [answer19_1,answer19_2,answer19_3])
        questionPack20.add(choices: [answer20_1,answer20_2,answer20_3])
        questionPack21.add(choices: [answer21_1,answer21_2,answer21_3])
        questionPack22.add(choices: [answer22_1,answer22_2,answer22_3])
        questionPack23.add(choices: [answer23_1,answer23_2,answer23_3])
        questionPack24.add(choices: [answer24_1,answer24_2,answer24_3])
        questionPack25.add(choices: [answer25_1,answer25_2,answer25_3])
        questionPack26.add(choices: [answer26_1,answer26_2,answer26_3])
        questionPack27.add(choices: [answer27_1,answer27_2,answer27_3])
        questionPack28.add(choices: [answer28_1,answer28_2,answer28_3])
        questionPack29.add(choices: [answer29_1,answer29_2,answer29_3])
        questionPack30.add(choices: [answer30_1,answer30_2,answer30_3])
        questionPack31.add(choices: [answer31_1,answer31_2,answer31_3])
        questionPack32.add(choices: [answer32_1,answer32_2,answer32_3])
        questionPack33.add(choices: [answer33_1,answer33_2,answer33_3])
        questionPack34.add(choices: [answer34_1,answer34_2,answer34_3])
        questionPack35.add(choices: [answer35_1,answer35_2,answer35_3])
        questionPack36.add(choices: [answer36_1,answer36_2,answer36_3])
        questionPack37.add(choices: [answer37_1,answer37_2,answer37_3])
        questionPack38.add(choices: [answer38_1,answer38_2,answer38_3])
        questionPack39.add(choices: [answer39_1,answer39_2,answer39_3])
        questionPack40.add(choices: [answer40_1,answer40_2,answer40_3])

        answer1_1.addChild(question: questionPack4)
        answer1_2.addChild(question: questionPack5)
        answer1_3.addChild(question: questionPack7)
        answer5_2.addChild(question: questionPack6)
        answer11_1.addChild(question: questionPack12)
        answer18_1.addChild(question: questionPack19)
        
        let needsPack = [questionPack1,questionPack2,questionPack3, questionPack8, questionPack9]
        let financePack = [questionPack10, questionPack11, questionPack13,questionPack14,questionPack15, questionPack16, questionPack17, questionPack18, questionPack20]
        let itemPack = [questionPack21,questionPack22,questionPack23, questionPack24, questionPack25, questionPack26, questionPack27, questionPack28, questionPack29, questionPack30, questionPack31, questionPack32, questionPack33, questionPack34, questionPack35, questionPack36]
        let alternativePack = [questionPack37, questionPack38, questionPack39, questionPack40]
        
        
        let questionPackSequence = [needsPack,financePack,itemPack,alternativePack]
        
        return (needsPack[Int.random(in: 0 ... needsPack.count - 1)],questionPackSequence, needsPack, financePack, itemPack, alternativePack, questionFake)
     }
}


class AnswersChoice : Identifiable{
    let id = UUID()
    var no: Int
    var text: String
    var score: Int
    var isSelected: Bool = false
    var destination: QuestionPack?
//    var childQuestions: [QuestionPack]?
    var childQuestions: QuestionPack?

    
    init(no: Int, text: String, score: Int, destination: QuestionPack? = nil, childQuestions: QuestionPack? = nil) {
        self.no = no
        self.text = text
        self.score = score
        self.destination = destination
        self.childQuestions = childQuestions
    }
    
    func markAsSelected(){
        isSelected = true
    }
    
    
    func randomNums(start:Int, end:Int) -> Int{
        return Int.random(in: start...end)
    }
    
    func addDestination(question: QuestionPack){
        self.destination = question
    }
    
    func addChild(question: QuestionPack){
        self.childQuestions = question
    }
}






