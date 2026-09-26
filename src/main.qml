import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window
import QtQuick.Controls.Material 2.15
import QtMultimedia
import QtQuick.Effects


Window {
    visible: true
    width: 1000
    height: 800
    minimumHeight: 850
    maximumHeight: 850

    minimumWidth: 1000
    maximumWidth: 1000
    title: "Number Memory Trainer"


    
    /*
    Video {
        visible: true
        anchors.fill: parent
        //source: "file:///B:/VSProjects/numbers_memorisation/background.mp4"
        autoPlay: true
        height: 700
        width: 700
        loops: MediaPlayer.Infinite
        muted: true
        onErrorOccurred: function(error, errorString) {
            console.log("VIDEO ERROR:", errorString)
        }

        onPlaybackStateChanged: {
            console.log("Playback state:", playbackState)
        }
    } */
    Image {
        source: "background1.png"
        width:1100
        height:850
        anchors.centerIn: parent
    }
    FontLoader {
        id: montserrat_ExtraBold
        source: "qrc:/qt/qml/numbers_memorisation/Montserrat-ExtraBold.ttf"
    }
    FontLoader {
        id: raleway
        source: "qrc:/qt/qml/numbers_memorisation/Raleway-VariableFont_wght.ttf"
    }
    SoundEffect {
        source: "menu_select_sound.wav"
        id: menu_select
    }

    



    Image {
        id: brain_icon
        source: "brain_icon.png"
        width: 65
        height: 65
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -370
    }

    
    MultiEffect {
        source: brain_icon
        anchors.fill: brain_icon

        blurEnabled: true
        blur: 0.5

        shadowEnabled: true
        shadowColor: "#00eaff"
        shadowBlur: 0.5  
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0
    }
    MultiEffect {
        source: brain_icon
        anchors.fill: brain_icon

        blurEnabled: true
        blur: 0.5

        shadowEnabled: true
        shadowColor: "#00eaff"
        shadowBlur: 0.5  
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0
    }
    MultiEffect {
        source: best_digits_rectangle
        anchors.fill: best_digits_rectangle

        blurEnabled: true
        blur: 1

        shadowEnabled: true
        shadowColor: "black"
        shadowBlur:1
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0
    }
    Rectangle {
        id: best_digits_rectangle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -350
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -380
        width: 280
        height: 65
        radius: 15
        border.width: 1
        border.color: "#395091"
        color: "#0E1F52"
        Column {
            anchors.centerIn: parent
            Row {
                
                Text {
                    text: "Best: "
                    font.family: raleway.font.family
                    font.bold: true
                    font.pixelSize: 16
                    color: "#C7CFFF"
                }
                Text {
                    id: best_digits_text
                    objectName: "best_digits_text"
                    font.family: raleway.font.family
                    font.bold: true
                    font.pixelSize: 16
                    color: "#C7CFFF"
                }
            }
            Row {
                Text {
                    text: "Avg. accuracy last session: "
                    font.family: raleway.font.family
                    font.bold: true
                    font.pixelSize: 16
                    color: "#C7CFFF"
                }
                Text {
                    id: avg_accuracy_last_session
                    objectName: "avg_accuracy_last_session_text"
                    font.family: raleway.font.family
                    font.bold: true
                    font.pixelSize: 16
                    color: "#C7CFFF"
                }
            }
        }
    }
        


    Text {
        text: "Number Memory Trainer"
        font.family: raleway.font.family
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -300
        font.bold: true
        font.pixelSize: 50
        color: "white"
    }
    Text {
        text: "Train your memory. Get better every day."
        font.family: raleway.font.family
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -250
        font.pixelSize: 20
        color: "#8092FF"
    }
    MultiEffect {
        id: glow_start_button2
        source: start_button
        anchors.fill: start_button

        blurEnabled: true
        blur: 0.5

        shadowEnabled: true
        shadowColor: "black"
        shadowBlur: 0.5   
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0

        Behavior on shadowColor {
            NumberAnimation { duration: 200; }
        }
    }

    MultiEffect {
        id: glow_start_button
        source: start_button
        anchors.fill: start_button

        blurEnabled: true
        blur: 2

        shadowEnabled: true
        shadowColor: "#0059FF"
        shadowBlur: 2    
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0

        Behavior on shadowColor {
            NumberAnimation { duration: 200; }
        }
    }
    
    
    
    
    Rectangle {
        id: settings_background
        radius: 20
        border.width: 1
        border.color: "#1f3253"
        width: 680
        height: 450
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 160


        color: "#30152235"
        

        layer.enabled: true
        layer.effect: MultiEffect {
            blurEnabled: true
            blur: 0
        }
    }
    MultiEffect {
        source: settings_background
        anchors.fill: settings_background

        blurEnabled: true
        blur: 2

        shadowEnabled: true
        shadowColor: "black"
        shadowBlur: 2  
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0
    }
    MultiEffect {
        source: settings_background
        anchors.fill: settings_background

        blurEnabled: true
        blur: 2

        shadowEnabled: true
        shadowColor: "black"
        shadowBlur: 2
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0
    }

    Button {
        id: start_button
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -150
        
        leftPadding: 20
        rightPadding: 10
        height: 120
        width: 350
        //visible: examples.visible ? false : true
        
        

        Image {
            id: play_icon
            source: "play_icon"
            width: 100
            height: 100
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -90
            anchors.verticalCenterOffset: 2

            Behavior on anchors.horizontalCenterOffset {
                NumberAnimation {duration: 300; easing: Easing.Bezier  ;}
            }
        }
        
        contentItem: Text {
            id: start_button_text
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 120
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 18
            font.family: montserrat_ExtraBold.font.family
            text: "Start"
            font.bold: true
            color: "white"
            font.pixelSize: 50
            
        }
        
        background: Rectangle {
            objectName: "start_button_background"
            id: start_button_background
            radius: 20
            gradient: Gradient {
                orientation: Gradient.Vertical

                GradientStop {
                    position: 0.0
                    id: first_gradient
                    color: "#00A8FF"    // яркий голубой верх
                    Behavior on color {
                        NumberAnimation { duration: 200}
                    }
                }

                GradientStop {
                    position: 1.0
                    id: second_gradient
                    color: "#0078FF"    // насыщенный синий низ
                    Behavior on color {
                        NumberAnimation { duration: 200}
                    }
                }
            }
            border.width: 1;
            border.color: "#36E2FF"
            
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onEntered: {
                play_icon.anchors.horizontalCenterOffset = -80
                menu_select.play()
            }   
            onExited: {
                play_icon.anchors.horizontalCenterOffset = -90
            }
            property bool error: false
            onClicked: {
                error = false
                if (button_text_number_of_sequences.text == "Select") {
                    button_background_number_of_sequences.border.color = "red"
                    error = true
                }
                if (button_text_number_of_digits.text == "Select") {
                    button_background_number_of_digits.border.color = "red"
                    error = true
                }
                if (button_text_time_to_remember.text == "Select") {
                    button_background_time_to_remember.border.color = "red"
                    error = true
                }
                if (button_text_time_to_answer.text == "Select") {
                    button_background_time_to_answer.border.color = "red"
                    error = true
                }
                if (button_text_time_to_check_the_answer.text == "Select") {
                    button_background_time_to_check_the_answer.border.color = "red"
                    error = true
                }
            

                if (error == false) {
                    examples.visible = true
                    backend.start_beginning_timer()
                }

            }
        }
    }

        Column {
           anchors.verticalCenter: parent.verticalCenter
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.verticalCenterOffset: 170
           Row {
                spacing: 20
                Image {
                    source: "list_icon"
                    width: 50
                    height: 50
                    y: -5
                }
                Column {
                    Text {
                        text: "Number of sequences: "
                        color: "white"
                        font.pointSize: 15
                        width: 400
                        font.family: raleway.font.family
                        font.bold: true
                    }
                    Text {
                        text: "How many sequences will be shown."
                        font.pointSize: 12
                        width: 400
                        font.family: raleway.font.family
                        color: "grey"
                    }
                }
                
                
                Button {
                    
                    /////////////////   FIRST SELECT
                    MultiEffect {
                        source: button_number_of_sequences
                        anchors.fill: button_number_of_sequences

                        blurEnabled: true
                        blur: 1

                        shadowEnabled: true
                        shadowColor: "black"
                        shadowBlur: 1    
                        shadowHorizontalOffset: 0
                        shadowVerticalOffset: 0
                        z:-3
                    } 
                    y: -7
                    id: button_number_of_sequences
                    leftPadding: 35
                    rightPadding: 35
                    topPadding: 18
                    bottomPadding: 18
                    padding: 40
                    
                   // width: 135
                   // height: 65
                   
                    contentItem: Text {
                        id: button_text_number_of_sequences
                        objectName: "button_text_number_of_sequences"
                        font.family: raleway.font.family
                        anchors.centerIn: parent
                        text: "Select"
                        font.bold: true
                        font.pixelSize: 22
                        color: "white"
                    }
                    background: Rectangle {
                        
                        id: button_background_number_of_sequences
                        radius: 10
                        border.width: 2;
                        border.color: "#3B507A"

                        color: "#283454"
                    }
                    Behavior on scale {
                        NumberAnimation { easing.type: Easing.InCubic; duration: 100 }

                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked:  { 
                            menu_number_of_sequences.popup(button_number_of_sequences, 190, 0)
                            
                        }
                        onEntered: {
                            menu_select.play()
                            button_number_of_sequences.scale = 0.95
                        }
                        onExited: {
                            button_number_of_sequences.scale = 1.0
                        }
                        
                    }
                    transform: Translate {
                        
                        x: button_text_number_of_sequences.text == "Select" ? 0 : 45
                    }
                }
               
                
                Menu {
                    id: menu_number_of_sequences
                    width: 50

                    background: Rectangle {
                        id: menu_number_of_sequences_background
                        color: "#30152235"
                        radius: 12
                        border.width: 1
                        border.color: "#1f3253"
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "5"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "5"
                            backend.set_number_of_sequences(5)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "10"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "10"
                            backend.set_number_of_sequences(10)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "15"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "15"
                            backend.set_number_of_sequences(15)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "20"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "20"
                            backend.set_number_of_sequences(20)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "25"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "25"
                            backend.set_number_of_sequences(25)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "30"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "30"
                            backend.set_number_of_sequences(30)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "35"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "35"
                            backend.set_number_of_sequences(35)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "40"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "40"
                            backend.set_number_of_sequences(40)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "45"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "45"
                            backend.set_number_of_sequences(45)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "50"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }

                        onTriggered: {
                            button_text_number_of_sequences.text = "50"
                            backend.set_number_of_sequences(50)
                        }
                    }
                }
            }

            Item {
                width: parent.width
                height: 5
            }
            Rectangle {
                
                width:parent.width
                height: 1
                color: "#1f3253"
            }
            Item {
                width: parent.width
                height: 20
            }

            Row {
                spacing: 20
                Image {
                    source: "numbers_icon"
                    width: 50
                    height: 50
                    y: -5
                }
                Column {
                    Text {
                        text: "Number of digits: "
                        color: "white"
                        font.pointSize: 15
                        width: 400
                        font.family: raleway.font.family
                        font.bold: true
                    }
                    Text {
                        text: "How many digits in each sequence."
                        font.pointSize: 12
                        width: 400
                        font.family: raleway.font.family
                        color: "grey"
                    }
                }
                Button {
                     
                    MultiEffect {
                            source: button_number_of_digits
                            anchors.fill: button_number_of_digits

                            blurEnabled: true
                            blur: 1

                            shadowEnabled: true
                            shadowColor: "black"
                            shadowBlur: 1    
                            shadowHorizontalOffset: 0
                            shadowVerticalOffset: 0
                            z:-3
                    } 
                    y: -7
                    id: button_number_of_digits
                    leftPadding: 35
                    rightPadding: 35
                    topPadding: 18
                    bottomPadding: 18
                    padding: 40
                    contentItem: Text {
                        id: button_text_number_of_digits
                        objectName: "button_text_number_of_digits"
                        font.family: raleway.font.family
                        anchors.centerIn: parent
                        text: "Select"
                        font.bold: true
                        font.pixelSize: 22
                        color: "white"
                    }
                    background: Rectangle {
                        
                        id: button_background_number_of_digits
                        radius: 10
                        border.width: 2;
                        border.color: "#3B507A"

                        color: "#283454"
                    }
                    Behavior on scale {
                        NumberAnimation { easing.type: Easing.InCubic; duration: 100 }

                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: menu_number_of_digits.popup(button_text_number_of_digits, 160, 0)
                        onEntered: {
                            menu_select.play()
                            button_number_of_digits.scale = 0.95
                        }
                        onExited: {
                            button_number_of_digits.scale = 1.0
                        }
                        
                    }
                    transform: Translate {
                        
                        x: button_text_number_of_digits.text == "Select" ? 0 : 45
                    }
                    
                }
            
                Menu {
                    id: menu_number_of_digits
                    width: 50
                    background: Rectangle {
                        id: menu_number_of_digits_background
                        color: "#30152235"
                        radius: 12
                        border.width: 1
                        border.color: "#1f3253"
                    }
                    MenuItem {
                        contentItem: Text {
                            text: "1"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "1"
                            backend.set_number_of_digits(1)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "2"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "2"
                            backend.set_number_of_digits(2)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "3"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "3"
                            backend.set_number_of_digits(3)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "4"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "4"
                            backend.set_number_of_digits(4)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "5"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "5"
                            backend.set_number_of_digits(5)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "6"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "6"
                            backend.set_number_of_digits(6)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "7"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "7"
                            backend.set_number_of_digits(7)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "8"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "8"
                            backend.set_number_of_digits(8)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "9"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "9"
                            backend.set_number_of_digits(9)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "10"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "10"
                            backend.set_number_of_digits(10)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "11"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "11"
                            backend.set_number_of_digits(11)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "12"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "12"
                            backend.set_number_of_digits(12)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "13"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "13"
                            backend.set_number_of_digits(13)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "14"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "14"
                            backend.set_number_of_digits(14)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "15"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "15"
                            backend.set_number_of_digits(15)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "16"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "16"
                            backend.set_number_of_digits(16)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "17"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "17"
                            backend.set_number_of_digits(17)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "18"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "18"
                            backend.set_number_of_digits(18)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "19"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "19"
                            backend.set_number_of_digits(19)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "20"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "20"
                            backend.set_number_of_digits(20)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "21"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "21"
                            backend.set_number_of_digits(21)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "22"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "22"
                            backend.set_number_of_digits(22)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "23"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "23"
                            backend.set_number_of_digits(23)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "24"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "24"
                            backend.set_number_of_digits(24)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "25"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "25"
                            backend.set_number_of_digits(25)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "26"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "26"
                            backend.set_number_of_digits(26)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "27"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "27"
                            backend.set_number_of_digits(27)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "28"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "28"
                            backend.set_number_of_digits(28)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "29"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "29"
                            backend.set_number_of_digits(29)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "30"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_number_of_digits.text = "30"
                            backend.set_number_of_digits(30)
                        }
                    }
                }
            }








            Item {
                width: parent.width
                height: 5
            }
            Rectangle {
                
                width:parent.width
                height: 1
                color: "#1f3253"
            }
            Item {
                width: parent.width
                height: 20
            }








            Row {
                spacing: 20
                Image {
                    source: "clock_icon.png"
                    width: 50
                    height: 50
                    y: -5
                }
                Column {
                    Text {
                        text: "Time to remember: "
                        color: "white"
                        font.pointSize: 15
                        width: 400
                        font.family: raleway.font.family
                        font.bold: true
                    }
                    Text {
                        text: "Time to study the sequence."
                        font.pointSize: 12
                        width: 400
                        font.family: raleway.font.family
                        color: "grey"
                    }
                }
                Button {
                     
                    MultiEffect {
                        source: button_time_to_remember
                        anchors.fill: button_time_to_remember

                        blurEnabled: true
                        blur: 1

                        shadowEnabled: true
                        shadowColor: "black"
                        shadowBlur: 1    
                        shadowHorizontalOffset: 0
                        shadowVerticalOffset: 0
                        z:-3
                    } 
                    y: -7
                    id: button_time_to_remember
                    leftPadding: 35
                    rightPadding: 35
                    topPadding: 18
                    bottomPadding: 18
                    padding: 40
                    contentItem: Text {
                        objectName: "button_text_time_to_remember"
                        id: button_text_time_to_remember
                        font.family: raleway.font.family
                        anchors.centerIn: parent
                        text: "Select"
                        font.bold: true
                        font.pixelSize: 22
                        color: "white"
                    }
                    background: Rectangle {
                        id: button_background_time_to_remember
                        radius: 10
                        border.width: 2;
                        border.color: "#3B507A"

                        color: "#283454"
                    }
                    Behavior on scale {
                        NumberAnimation { easing.type: Easing.InCubic; duration: 100 }

                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: menu_time_to_remember.popup(
                            button_text_time_to_remember,
                            160,
                            0
                        )
                        onEntered: {
                            menu_select.play()
                            button_time_to_remember.scale = 0.95
                        }
                        onExited: {
                            button_time_to_remember.scale = 1.0
                        }
                        
                    }
                    transform: Translate {
                        
                        x: button_text_time_to_remember.text == "Select" ? 0 : 45
                    }
                    
                }
            
                Menu {
                    id: menu_time_to_remember
                    width: 50
                    background: Rectangle {
                        id: menu_time_to_remember_background

                        color: "#30152235"
                        radius: 12
                        border.width: 1
                        border.color: "#1f3253"
                    }
                    MenuItem {
                        contentItem: Text {
                            text: "1"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "1"
                            backend.set_time_to_remember(1)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "2"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "2"
                            backend.set_time_to_remember(2)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "3"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "3"
                            backend.set_time_to_remember(3)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "4"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "4"
                            backend.set_time_to_remember(4)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "5"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "5"
                            backend.set_time_to_remember(5)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "6"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "6"
                            backend.set_time_to_remember(6)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "7"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "7"
                            backend.set_time_to_remember(7)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "8"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "8"
                            backend.set_time_to_remember(8)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "9"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "9"
                            backend.set_time_to_remember(9)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "10"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "10"
                            backend.set_time_to_remember(10)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "11"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "11"
                            backend.set_time_to_remember(11)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "12"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "12"
                            backend.set_time_to_remember(12)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "13"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "13"
                            backend.set_time_to_remember(13)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "14"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "14"
                            backend.set_time_to_remember(14)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "15"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "15"
                            backend.set_time_to_remember(15)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "16"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "16"
                            backend.set_time_to_remember(16)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "17"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "17"
                            backend.set_time_to_remember(17)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "18"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "18"
                            backend.set_time_to_remember(18)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "19"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "19"
                            backend.set_time_to_remember(19)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "20"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "20"
                            backend.set_time_to_remember(20)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "25"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "25"
                            backend.set_time_to_remember(25)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "30"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "30"
                            backend.set_time_to_remember(30)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "35"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "35"
                            backend.set_time_to_remember(35)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "40"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "40"
                            backend.set_time_to_remember(40)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "45"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "45"
                            backend.set_time_to_remember(45)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "50"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "50"
                            backend.set_time_to_remember(50)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "55"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "55"
                            backend.set_time_to_remember(55)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "60"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "60"
                            backend.set_time_to_remember(60)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "65"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "65"
                            backend.set_time_to_remember(65)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "70"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_remember.text = "70"
                            backend.set_time_to_remember(70)
                        }
                    }
                }
            }


            Item {
                width: parent.width
                height: 5
            }
            Rectangle {
                
                width:parent.width
                height: 1
                color: "#1f3253"
            }
            Item {
                width: parent.width
                height: 20
            }


           Row {
                spacing: 20
                Image {
                    source: "question_mark_icon.png"
                    width: 50
                    height: 50
                    y: -5
                }
                Column {
                    Text {
                        text: "Time to answer: "
                        color: "white"
                        font.pointSize: 15
                        width: 400
                        font.family: raleway.font.family
                        font.bold: true
                    }
                    Text {
                        text: "Time to enter the sequence."
                        font.pointSize: 12
                        width: 400
                        font.family: raleway.font.family
                        color: "grey"
                    }
                }
                Button {
                 
                    MultiEffect {
                        source: button_time_to_answer
                        anchors.fill: button_time_to_answer

                        blurEnabled: true
                        blur: 1

                        shadowEnabled: true
                        shadowColor: "black"
                        shadowBlur: 1    
                        shadowHorizontalOffset: 0
                        shadowVerticalOffset: 0
                        z:-3
                    } 
                    y: -7
                    id: button_time_to_answer
                    leftPadding: 35
                    rightPadding: 35
                    topPadding: 18
                    bottomPadding: 18
                    padding: 40
                    contentItem: Text {
                        objectName: "button_text_time_to_answer"
                        id: button_text_time_to_answer
                        font.family: raleway.font.family
                        anchors.centerIn: parent
                        text: "Select"
                        font.bold: true
                        font.pixelSize: 22
                        color: "white"
                    }
                    background: Rectangle {
                        id: button_background_time_to_answer
                        radius: 10
                        border.width: 2;
                        border.color: "#3B507A"

                        color: "#283454"
                    }
                    Behavior on scale {
                        NumberAnimation { easing.type: Easing.InCubic; duration: 100 }

                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: menu_time_to_answer.popup(button_time_to_answer, 190, button_time_to_answer.height)
                        onEntered: {
                            menu_select.play()
                            button_time_to_answer.scale = 0.95
                        }
                        onExited: {
                            button_time_to_answer.scale = 1.0
                        }
                        
                    }
                    transform: Translate {
                        
                        x: button_text_time_to_answer.text == "Select" ? 0 : 45
                    }
                    
                }
            
                Menu {
                    id: menu_time_to_answer
                    width: 50
                    background: Rectangle {
                        id: menu_time_to_answer_background
                        color: "#30152235"
                        radius: 12
                        border.width: 1
                        border.color: "#1f3253"
                    }
                    MenuItem {
                        contentItem: Text {
                            text: "5"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "5"
                            backend.set_time_to_answer(5)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "10"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "10"
                            backend.set_time_to_answer(10)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "15"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "15"
                            backend.set_time_to_answer(15)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "20"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "20"
                            backend.set_time_to_answer(20)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "25"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "25"
                            backend.set_time_to_answer(25)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "30"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "30"
                            backend.set_time_to_answer(30)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "35"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "35"
                            backend.set_time_to_answer(35)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "40"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "40"
                            backend.set_time_to_answer(40)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "45"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "45"
                            backend.set_time_to_answer(45)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "50"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "50"
                            backend.set_time_to_answer(50)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "55"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "55"
                            backend.set_time_to_answer(55)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "60"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_answer.text = "60"
                            backend.set_time_to_answer(60)
                        }
                    }
                }
            }
            Item {
                width: parent.width
                height: 5
            }
            Rectangle {
                
                width:parent.width
                height: 1
                color: "#1f3253"
            }
            Item {
                width: parent.width
                height: 20
            }

            Row {
                spacing: 20
                Image {
                    source: "purple_tick_icon.png"
                    width: 50
                    height: 50
                    y: -5
                }
                Column {
                    Text {
                        text: "Time to check: "
                        color: "white"
                        font.pointSize: 15
                        width: 400
                        font.family: raleway.font.family
                        font.bold: true
                    }
                    Text {
                        text: "Time to see the result."
                        font.pointSize: 12
                        width: 400
                        font.family: raleway.font.family
                        color: "grey"
                    }
                }
                Button {
                    
                    MultiEffect {
                        source: button_time_to_check_the_answer
                        anchors.fill: button_time_to_check_the_answer

                        blurEnabled: true
                        blur: 1

                        shadowEnabled: true
                        shadowColor: "black"
                        shadowBlur: 1    
                        shadowHorizontalOffset: 0
                        shadowVerticalOffset: 0
                        z:-3
                    } 
                    y: -7
                    objectName: "button_time_to_check_the_answer"
                    id: button_time_to_check_the_answer
                    leftPadding: 35
                    rightPadding: 35
                    topPadding: 18
                    bottomPadding: 18
                    padding: 40
                    contentItem: Text {
                        id: button_text_time_to_check_the_answer
                        objectName: "button_text_time_to_check_the_answer"
                        font.family: raleway.font.family
                        anchors.centerIn: parent
                        text: "Select"
                        font.bold: true
                        font.pixelSize: 22
                        color: "white"
                    }
                    background: Rectangle {
                        id: button_background_time_to_check_the_answer
                        radius: 10
                        border.width: 2;
                        border.color: "#3B507A"

                        color: "#283454"
                    }
                    Behavior on scale {
                        NumberAnimation { easing.type: Easing.InCubic; duration: 100 }

                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: menu_time_to_check_the_answer.popup(button_time_to_check_the_answer, 190, button_time_to_check_the_answer.height)
                        onEntered: {
                            menu_select.play()
                            button_time_to_check_the_answer.scale = 0.95
                        }
                        onExited: {
                            button_time_to_check_the_answer.scale = 1.0
                        }
                        
                    }
                    transform: Translate {
                        
                        x: button_text_time_to_check_the_answer.text == "Select" ? 0 : 45
                    }
                    
                }
            
                Menu {
                    id: menu_time_to_check_the_answer
                    width: 50
                    background: Rectangle {
                        id: menu_time_to_check_the_answer_background
                        color: "#30152235"
                        radius: 12
                        border.width: 1
                        border.color: "#1f3253"
                    }
                   MenuItem {
                        contentItem: Text {
                            text: "5"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "5"
                            backend.set_time_to_check_answer(5)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "10"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "10"
                            backend.set_time_to_check_answer(10)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "15"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "15"
                            backend.set_time_to_check_answer(15)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "20"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "20"
                            backend.set_time_to_check_answer(20)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "25"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "25"
                            backend.set_time_to_check_answer(25)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "30"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "30"
                            backend.set_time_to_check_answer(30)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "35"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "35"
                            backend.set_time_to_check_answer(35)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "40"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "40"
                            backend.set_time_to_check_answer(40)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "45"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "45"
                            backend.set_time_to_check_answer(45)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "50"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "50"
                            backend.set_time_to_check_answer(50)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "55"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "55"
                            backend.set_time_to_check_answer(55)
                        }
                    }

                    MenuItem {
                        contentItem: Text {
                            text: "60"
                            color: "white"
                            font.bold: true
                            font.family: raleway.font.family
                        }
                        onTriggered: {
                            button_text_time_to_check_the_answer.text = "60"
                            backend.set_time_to_check_answer(60)
                        }
                    }
                }
            }
        }
    






    function show_sequence_background(value) {
        sequence_background.visible = value
    }






    Rectangle {
        id: examples
        visible: false
        anchors.fill: parent
        objectName: "examples_text"
        Image {
            source: "background1.png"
            width:1100
            height:850
            anchors.centerIn: parent
        }
        Image {
            id: brain_icon2
            source: "brain_icon.png"
            width: 65
            height: 65
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -370
        }

    
        MultiEffect {
            source: brain_icon2
            anchors.fill: brain_icon2

            blurEnabled: true
            blur: 0.5

            shadowEnabled: true
            shadowColor: "#00eaff"
            shadowBlur: 0.5  
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
        }
        MultiEffect {
            source: brain_icon2
            anchors.fill: brain_icon2

            blurEnabled: true
            blur: 0.5

            shadowEnabled: true
            shadowColor: "#00eaff"
            shadowBlur: 0.5  
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
        }

        Text {
            text: "Number Memory Trainer"
            font.family: raleway.font.family
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: -300
            font.bold: true
            font.pixelSize: 50
            color: "white"
        }

        Text {
            id: beginning_timer
            objectName: "beginning_timer"
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 50
            font.bold: true
        }

       MultiEffect {
            source: sequence_background
            anchors.fill: sequence_background

            blurEnabled: true
            blur: 1.5
            visible: false
            shadowEnabled: true
            shadowColor: "blue"
            shadowBlur: 1.5
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
        }
        MultiEffect {
            source: sequence_text
            anchors.fill: sequence_text
            visible: sequence_text.visible ? true : false
            blurEnabled: true
            blur: 1

            shadowEnabled: true
            shadowColor: "blue"
            shadowBlur: 1
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
            z: -1
        }
        Text {
                
            id: sequence_text
            visible: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            objectName: "sequence_text"
            textFormat: Text.RichText
            text: "3403920498"
            color: "#E0E3FF"
            font.bold: true
            font.pointSize: 50
            z: 2
            
        }
        Rectangle {
            id: sequence_background
            objectName: "sequence_background"
            visible: false
            width: 500
            height: 150
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 15
            border.width: 1
            border.color: "#36E2FF"
            gradient: Gradient {
                GradientStop { position: 0.0;  color: "#159BFA" }
                GradientStop { position: 0.08; color: "#168FF5" }
                GradientStop { position: 0.35; color: "#0D79EF" }
                GradientStop { position: 0.60; color: "#0864E2" }
                GradientStop { position: 0.78; color: "#085BD7" }
                GradientStop { position: 1.0;  color: "#0B78EF" }
            }
        }
        
        
         MultiEffect {
                source: userinput
                anchors.fill: userinput
                visible: userinput.visible ? true : false
                blurEnabled: true
                blur: 1.5

                shadowEnabled: true
                shadowColor: "blue"
                shadowBlur: 1.5
                shadowHorizontalOffset: 0
                shadowVerticalOffset: 0
            }
        TextField {
           
            visible: false
            id: userinput
            objectName: "userinput"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 100
            padding: 20
            font.pointSize: 40
            font.family: "Consolas"
            color: "#E0E3FF"
            focus: true
            background: Rectangle {
                id: userinput_background
                objectName: "userinput_background"
                implicitWidth: 500
                implicitHeight: 40
                border.color: "#36E2FF"
                color: "#152D75"
                border.width: 1
                radius: 20
            }
        }
        MultiEffect {
            source: accuracy_background
            anchors.fill: accuracy_background

            blurEnabled: true
            blur: 1.5
            visible: accuracy_background.visible ? true : false
            shadowEnabled: true
            shadowColor: "black"
            shadowBlur: 1.5
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
        }
        Rectangle {
            
            id: accuracy_background
            objectName: "accuracy_background"
            width: 350

            visible: false

            height: 70
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: -200
            radius: 15
            border.width: 1
            border.color: "#395091"
            color: "#0E1F52"
            Row {
                y: -15
                anchors.centerIn: parent
                objectName: "accuracy_text"
                Text {
                    text: "Accuracy: "
                    color: "#C7CFFF"
                    font.bold: true
                    font.pointSize: 30
                }
                Text {
                    objectName: "accuracy_percent"
                    y: 2
                    font.bold: true
                    color: "#C7CFFF"
                    font.pointSize: 30
                }
            }
         }
         MultiEffect {
            source: progress_bar_background
            anchors.fill: progress_bar_background

            blurEnabled: true
            blur: 1
            visible: progress_bar_background.visible ? true : false
            shadowEnabled: true
            shadowColor: "#36DFFF"
            shadowBlur: 1
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0

        }
        MultiEffect {
            source: progress_bar_background
            anchors.fill: progress_bar_background

            blurEnabled: true
            blur: 1
            visible: progress_bar_background.visible ? true : false
            shadowEnabled: true
            shadowColor: "#36DFFF"
            shadowBlur: 1
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0

        }
        Rectangle {
            id: progress_bar_background
            objectName: "progress_bar_rectangle"
            width: 100
            height: 10
            color: "transparent"
            smooth: true
            border.color: "#36E2FF"
            border.width: 1 
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: -100
            Rectangle {
                id: progress_bar
                objectName: "progress_bar"
                width: 100
                height: 10
                radius: 10
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: "#0758D6"
                    }

                    GradientStop {
                        position: 0.25
                        color: "#0875E8"
                    }

                    GradientStop {
                        position: 0.5
                        color: "#0B8EF5"
                    }

                    GradientStop {
                        position: 0.75
                        color: "#18A8FA"
                    }

                    GradientStop {
                        position: 1.0
                        color: "#3686FF"
                    }
                }
                smooth: true
                z: -1
                
            }
        }
       
        NumberAnimation {
            id: progress_bar_animation
            objectName: "progress_bar_animation"
            property: "width"
            target: progress_bar
            to: 0
            duration: 2000
            easing.type: Easing.Linear
        }
    }   
}
