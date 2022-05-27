function play() {
    document.addEventListener("keypress", logKey);
    console.log("loaded");
    var temp;
    function logKey(e) {

        e.code = temp;
        // console.log(e.code);
        playSound(e.code);
    }
}
function mousePressKey(letter) {
    var str = "Key";
    temp = str.concat(letter);
    // console.log(temp);
    playSound(temp);
}

function playSound(keyvalue) {
    console.log(keyvalue);
    if (keyvalue == 'KeyW') {
        // document.getElementById("w").focus();
        $(".w").addClass("pressedKey");
        setTimeout(function () {
            $(".w").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/tom-1.mp3');
        audio.play();
    } else if (keyvalue == 'KeyA') {
        // document.getElementsByClassName("a").click();
        $(".a").addClass("pressedKey");
        setTimeout(function () {
            $(".a").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/tom-2.mp3');
        audio.play();

    } else if (keyvalue == 'KeyS') {
        // document.getElementsByClassName("w").click();
        $(".s").addClass("pressedKey");
        setTimeout(function () {
            $(".s").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/tom-3.mp3');
        audio.play();

    } else if (keyvalue == 'KeyD') {
        // document.getElementsByClassName("w").click();
        $(".d").addClass("pressedKey");
        setTimeout(function () {
            $(".d").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/tom-4.mp3');
        audio.play();
    } else if (keyvalue == 'KeyJ') {
        // document.getElementsByClassName("w").click();
        $(".j").addClass("pressedKey");
        setTimeout(function () {
            $(".j").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/snare.mp3');
        audio.play();
    } else if (keyvalue == 'KeyK') {
        // document.getElementsByClassName("w").click();
        $(".k").addClass("pressedKey");
        setTimeout(function () {
            $(".k").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/crash.mp3');
        audio.play();
    } else if (keyvalue == 'KeyL') {
        // document.getElementsByClassName("w").click();
        $(".l").addClass("pressedKey");
        setTimeout(function () {
            $(".l").removeClass("pressedKey");
        }, 200)
        var audio = new Audio('./sounds/kick-bass.mp3');
        audio.play();
    }
}