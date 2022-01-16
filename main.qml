import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 500
    height: 300
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "toLeftRect"

        Rectangle {
            id: leftRect
            color: "lightgrey"
            Text {
                id: leftRectName
                anchors.centerIn: parent
                text: "move"
            }

            x: 100
            y: 100
            width: 100
            height: 100
            radius: 5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ball.x += 30
                    if (ball.x >= rightRect.x) {
                        scene.state = "toLeftRect"
                    }
                    else {
                        scene.state = "go"
                    }
                }
            }
        }
        Rectangle {
            id: rightRect
            color: "lightgrey"
            Text {
                id: rightRectName
                anchors.centerIn: parent
                text: "return"
            }

            x: 300
            y: 100
            width: 100
            height: 100
            radius: 5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    scene.state = "toLeftRect"
                }
            }
        }
        Rectangle {
            id: ball
            color: "green"

            x: 100
            y: 100
            width: 100
            height: 100
            radius: width/2

        }

        states: [
            State {
                name: "toLeftRect"
                PropertyChanges {
                    target: ball
                    x: leftRect.x
                }
            },
            State {
                name: "go"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            }
        ]

        transitions: [
            Transition {
                from: "go"
                to: "toLeftRect"

                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
