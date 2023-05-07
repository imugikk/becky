//
//  ChatManager.swift
//  tempMC
//
//  Created by Tiffany Angela Indryani on 05/05/23.
//

import Foundation

class ChatManager: ObservableObject{
    @Published var questionPack: QuestionPack?
    @Published var answerChoice: AnswersChoice?
    var totalScore: Int = 0
    var notDoneQuest: [QuestionPack] = []
    var arrOfString: [String] = []
    
    private var questionSequence: [[QuestionPack]] = [[]]
    private var needsPack: [QuestionPack] = []
    private var financePack: [QuestionPack] = []
    private var itemPack: [QuestionPack] = []
    private var alternativePack: [QuestionPack] = []
    private var questionFake: QuestionPack?
    var startIndex: Int = 0
    
    func stringToQuestion(questionName: String){
        arrOfString.append(questionName)
    }
    
    private func isAllChildAnswered(childsName: [QuestionPack])-> Bool {
        return childsName.allSatisfy{ $0.isDone }
    }
    
    private func isAllQuestInSeqDone(packName: [QuestionPack])->Bool {
        return packName.allSatisfy{ $0.isDone }
    }
    
    public func initiateQuestionPack(){
        (questionPack, questionSequence, needsPack, financePack,itemPack, alternativePack, questionFake) = QuestionDataSource.shared.generateQuestionPack()
        stringToQuestion(questionName: questionPack!.question)
    }
    
    public func isSubmited(selectedOption: Int){
        // 1. Get score from the selected answer
        let score = questionPack?.choices[selectedOption].score ?? 0
        // 2. Update to total score
        totalScore += score
        // 3. Mark the current question has been done
        questionPack?.isDone = true
        // 4. mark the current answer to be done
        questionPack?.choices[selectedOption].isSelected = true
        // 5. get next question
        let nextQuestion = nextQuestion(selectedOption: selectedOption, packIndex: startIndex)
        // 6. Published to the question pack and answer choice
//        if nextQuestion == nil {
//
//        }
        
        questionPack = nextQuestion
    }
    
    
    
    public func nextQuestion(selectedOption: Int, packIndex: Int) -> QuestionPack{
        //1. Liat chosen answernya (A)
        //2. Liat si A ada child atau engga
        //3. Kalo A punya child, cek semua child dia udah isDone belom
        if let hasChild = questionPack?.choices[selectedOption].childQuestions{
            //4. Kalo ada yang belom, pergi ke random child yang belom isDone
            return hasChild
            //5. Kalo udah semua, lanjut ke random parent question
        }
        //6. Kalo A gapunya child, cek semua parent question di sequence dia
        if(!isAllQuestInSeqDone(packName: questionSequence[packIndex])){
            for questions in questionSequence[packIndex]{
                if !questions.isDone{
                    notDoneQuest = [questions]
                }
            }
            //7. Kalo masih ada yang belom, pilih random parent question yang belom isDone
            let randQuest = notDoneQuest[Int.random(in: 0 ... notDoneQuest.count-1)]
            return randQuest
        }else{
            //8. Kalo udah semua, lanjut ke sequence berikutnya
            startIndex += 1
        }
        //9. Ulang terus sampe di seq terakhir, kalo udah semua, code berenti.
        return questionPack!
    }
}
