let questions = [];
let currentQuestionIndex = 0;
let resolveDelay = 10; // Standardzeit in Sekunden bis zur Auflösung
let timerInterval;

// Funktion zum Aktualisieren des Timers
function startTimer() {
    const timerElement = document.getElementById("timer");
    let remainingTime = resolveDelay;

    // Timer herunterzählen
    timerInterval = setInterval(() => {
        remainingTime--;
        timerElement.textContent = remainingTime;

        if (remainingTime <= 0) {
            clearInterval(timerInterval);
        }
    }, 1000);
}

// Funktion zum Aktualisieren der Frage-Anzeige
function updateQuestionStatus() {
    const questionStatus = document.getElementById("current-question");
    questionStatus.textContent = `Frage ${
        currentQuestionIndex + 1
    } von ${questions.length}`;
}

// Funktion zum Abrufen der Fragen
async function fetchQuestions() {
    try {
        const response = await fetch("getquestion.php");
        if (!response.ok) {
            throw new Error(`Server error: ${response.status}`);
        }
        const data = await response.json();
        questions = data;
        startQuiz();
    } catch (error) {
        console.error("Error fetching questions:", error);
        alert("Unable to load questions. Please try again later.");
    }
}

// Funktion zum Starten des Quiz
function startQuiz() {
    if (questions.length === 0) {
        alert("Keine Fragen verfügbar.");
        return;
    }
    document.getElementById("start-button").style.display = "none";
    showQuestion();
}

// Funktion zum Anzeigen der aktuellen Frage
function showQuestion() {
    if (currentQuestionIndex >= questions.length) {
        alert("Quiz abgeschlossen!");
        resetQuiz();
        return;
    }

    updateQuestionStatus();
    startTimer();

    const currentQuestion = questions[currentQuestionIndex];
    document.getElementById("question").textContent = currentQuestion.question;

    const optionsContainer = document.getElementById("options");
    optionsContainer.innerHTML = "";

    currentQuestion.options.forEach((option, index) => {
        const button = document.createElement("button");
        button.textContent = option;
        button.className = "option";
        optionsContainer.appendChild(button);
    });

    playAudioWithDelay();
}

// Funktion zum Abspielen des Audio und Warten bis zur Auflösung
function playAudioWithDelay() {
    const audio = new Audio("1,2_oder3.mp3");
    audio.play();

    // Wartezeit nach dem Audio bis zur Auflösung
    audio.onended = () => {
        setTimeout(showCorrectAnswer, resolveDelay * 1000);
    };
}

// Funktion zum Anzeigen der richtigen Antwort
function showCorrectAnswer() {
    const currentQuestion = questions[currentQuestionIndex];
    const options = document.querySelectorAll(".option");

    options.forEach((option, index) => {
        if (index === currentQuestion.correctAnswer) {
            option.classList.add("correct");
        }
    });

    // Nach der Auflösung zur nächsten Frage wechseln
    setTimeout(() => {
        options.forEach((option) => option.classList.remove("correct"));
        currentQuestionIndex++;
        clearInterval(timerInterval);
        showQuestion();
    }, resolveDelay * 1000);
}

// Funktion zum Zurücksetzen des Quiz
function resetQuiz() {
    currentQuestionIndex = 0;
    document.getElementById("start-button").style.display = "block";
    document.getElementById("current-question").textContent = "Frage 1";
    clearInterval(timerInterval);
}

// Eventlistener für den Start-Button
document.getElementById("start-button").addEventListener("click", fetchQuestions);
