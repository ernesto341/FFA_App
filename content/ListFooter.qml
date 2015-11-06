/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtPositioning 5.3

Rectangle {
    color: "#d6d6d6"
    width: parent.width
    height: childrenRect.height
    z: 2

    PositionSource
    {
        id: loc
        updateInterval: 60000
        active: true

        onPositionChanged:
        {
            if (loc.sourceError == PositionSource.NoError)
            {
                tweetsModel.longitude = loc.position.coordinate.longitude;
                tweetsModel.latitude = loc.position.coordinate.latitude;
                if (loc.position.speedValid)
                {
                    tweetsModel.speed = loc.position.coordinate.speed;
                    // updateInterval = distToFarm / tweetsModel.speed;
                }
            }
        }
    }

    Connections {
        target: mainListView
        onAutoSearch: {
            if (type == 'tag') {
                tagSearch.open()
                tagSearch.searchText = str
            } else if (type == 'user'){
                userSearch.open()
                userSearch.searchText = str
            } else if (type == 'animal'){
                animalSearch.open()
                animalSearch.searchText = str
            } else if (type == 'feed'){
                feed.open()
                feed.feedQuantity = qty
            } else {
                wordSearch.open()
                wordSearch.searchText = str
            }
        }
    }

    Column {
        width: parent.width

        SearchDelegate {
            id: wordSearch
            label: "Search word..."
            placeHolder: "Enter word"
            sliderType: false
            onHasOpened: {
                tagSearch.close()
                userSearch.close()
                animalSearch.close()
                feed.close()
            }
            onOk: {
                mainListView.positionViewAtBeginning()
                mainListView.clear()
                tweetsModel.from = ""
                tweetsModel.phrase = searchText
                tweetsModel.quantity = 0.0
            }
        }

        SearchDelegate {
            id: userSearch
            label: "From user..."
            placeHolder: "@username"
            prefix: "@"
            sliderType: false
            onHasOpened:{
                tagSearch.close()
                wordSearch.close()
                animalSearch.close()
                feed.close()
            }
            onOk: {
                mainListView.positionViewAtBeginning()
                mainListView.clear()
                tweetsModel.phrase = ""
                tweetsModel.from = searchText
                tweetsModel.quantity = 0.0
            }
        }

        SearchDelegate {
            id: tagSearch
            label: "Search hashtag..."
            placeHolder: "#hashtag"
            prefix: "#"
            sliderType: false
            onHasOpened:{
                userSearch.close()
                wordSearch.close()
                animalSearch.close()
                feed.close()
            }
            onOk: {
                mainListView.positionViewAtBeginning()
                mainListView.clear()
                tweetsModel.from = ""
                tweetsModel.phrase = "#" + searchText
                tweetsModel.quantity = 0.0
            }
        }

        SearchDelegate {
            id: animalSearch
            label: "Search Animal name..."
            placeHolder: "Enter Animal Name"
            sliderType: false
            onHasOpened:{
                userSearch.close()
                wordSearch.close()
                tagSearch.close()
                feed.close()
            }
            onOk: {
                mainListView.positionViewAtBeginning()
                mainListView.clear()
                tweetsModel.from = ""
                tweetsModel.phrase = searchText
                tweetsModel.quantity = 0.0
            }
        }

        SearchDelegate {
            id: feed
            label: "Feed your animal"
            sliderType: true
            onHasOpened:{
                userSearch.close()
                wordSearch.close()
                tagSearch.close()
                animalSearch.close()
            }
            onOk: {
                mainListView.positionViewAtBeginning()
                mainListView.clear()
                tweetsModel.from = ""
                tweetsModel.phrase = ""
                tweetsModel.quantity = feedQuantity
            }
        }


        SpriteSequence {
            id: sprite
            anchors.horizontalCenter: parent.horizontalCenter
            width: 320
            height: 300
            running: true
            interpolate: false
            Sprite
            {
                name: "pig"
                source: "resources/pig-anim-sprites.png"
                frameCount: 1
                frameRate: 1
                frameWidth: 320
                frameHeight: 300
                to: { "pig":5, "blink":1 }
            }
            Sprite {
                name: "blink"
                source: "resources/pig-anim-sprites.png"
                frameCount: 3
                frameRate: 3
                frameWidth: 320
                frameHeight: 300
                frameX: 320
                to: {"pig":1}
            }

            /*
            Sprite {
                name: "bird"
                source: "resources/bird-anim-sprites.png"
                frameCount: 1
                frameRate: 1
                frameWidth: 320
                frameHeight: 300
                to: { "bird":10, "trill":1, "blink":1 }
            }
            Sprite {
                name: "trill"
                source: "resources/bird-anim-sprites.png"
                frameCount: 5
                frameRate: 3
                frameWidth: 320
                frameHeight: 300
                to: {"bird":1}
            }
            Sprite {
                name: "blink"
                source: "resources/bird-anim-sprites.png"
                frameCount: 1
                frameRate: 3
                frameWidth: 320
                frameHeight: 300
                frameX: 1600
                to: {"bird":1}
            }
            */
        }
    }
}
