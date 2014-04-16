// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "storage.js" as Storage

Row {

    property int currentBoardSize

    function reset(boardSize)
    {
        storeHighscore()
        currentBoardSize = boardSize
        scoreItem.value = 0
        bestItem.value = Storage.getHighscore(boardSize)
    }

    function addScore(scoreToAdd,boardSize)
    {
        scoreItem.value += scoreToAdd
        if(bestItem.value < scoreItem.value)
            bestItem.value = scoreItem.value
    }

    function storeHighscore() {
        Storage.setHighscore(bestItem.value,currentBoardSize)
    }

    Component.onDestruction: storeHighscore()

    ScoreItem {
        id: scoreItem
        text: "SCORE"
        value: 0

        width: parent.width / 2
        height:parent.height
    }

    ScoreItem {
        id: bestItem
        text: "BEST"
        value: 0

        width: parent.width / 2
        height:parent.height
    }
}