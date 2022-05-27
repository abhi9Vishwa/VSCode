var buttonColour = ["red", "blue", "green", "yellow"];
var gamePattern = [];
var userChosenColour = [];
var level = 0;
var started = false;

$(document).keypress(function(){
        if (!started) {
            $("h1").text('Level ' + level);
            nextSequence();
            started = true;
        }
    });

function checkAnswer(currentLevel) {
    if (gamePattern[currentLevel] === userChosenColour[currentLevel]) {
        console.log("success");
        if (userChosenColour.length === gamePattern.length) {
            setTimeout(function () {
                nextSequence();
            }, 1000);
        }
    } else {
        console.log("wrong");
        var audio = new Audio('./sounds/wrong.mp3');
        audio.play();
        $("body").addClass("game-over");
        setTimeout(function () {
            $("body").removeClass("game-over");
        }, 250);
        $("h1").text('Game Over, Press any key to Restart');
        // document.addEventListener("keypress", logKey);

        startOver();

    }
}
function startOver() {
    userChosenColour = [];
    level = 0;
    gamePattern = [];
    // nextSequence();
    started = false;
}
function nextSequence() {
    userChosenColour = [];
    var randomVariable = Math.ceil((Math.random() * 4)) - 1;
    var randomChosenColour = buttonColour[randomVariable];
    gamePattern.push(randomChosenColour);
    // console.log(gamePattern);
    playSound(randomChosenColour);
    systemFlash(randomChosenColour);
    level++;
    $("h1").text('Level ' + level);
}

$(".btn").click(function (event) {
    var id = event.target.id;
    userChosenColour.push(id);
    playSound(id);
    animatePress(id);
    checkAnswer(userChosenColour.length - 1);
}

)


function playSound(name) {
    var audio = new Audio('./sounds/' + name + '.mp3');
    audio.play();
}

function systemFlash(name) {
    $('.' + name).addClass("flash");
    setTimeout(function () {
        $('.' + name).removeClass("flash");
    }, 150);
}

function animatePress(name) {
    $('.' + name).addClass("pressed");
    setTimeout(function () {
        $('.' + name).removeClass("pressed");
    }, 150);
}

