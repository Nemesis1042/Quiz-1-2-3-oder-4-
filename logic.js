let questions = [];
let currentQuestionIndex = 0;

// Function to fetch questions from the server
async function fetchQuestions() {
    try {
        const response = await fetch("getquestion.php");
        if (!response.ok) {
            throw new Error(`Server error: ${response.status}`);
        }

        const textData = await response.text();
        if (textData === "No questions found") {
            alert("No questions available.");
            return;
        }

        parseQuestions(textData);
        startQuiz();
    } catch (error) {
        console.error("Error fetching questions:", error);
        alert("Unable to load questions. Please try again later.");
    }
}

// Function to parse plain-text questions into a structured array
function parseQuestions(data) {
    questions = data.split("\n").map((line) => {
        const parts = line.split("|");
        return {
            question: parts[0],
            options: [parts[1], parts[2], parts[3], parts[4]],
            correctAnswer: parseInt(parts[5]) - 1, // Convert to 0-based index
        };
    });
}

// Function to start the quiz
function startQuiz() {
    if (questions.length === 0) {
        alert("No questions available.");
        return;
    }
    document.getElementsByClassName("start-button")[0].style.display = "none";
    showQuestion();
}

// Function to display the current question
function showQuestion() {
    if (currentQuestionIndex >= questions.length) {
        alert("Quiz abgeschlossen!");
        resetQuiz();
        return;
    }

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

// Function to play audio and wait before showing the correct answer
function playAudioWithDelay() {
    const audio = new Audio("1,2_oder3.mp3");
    audio.play();

    // Wait for the audio to finish before showing the correct answer
    audio.onended = () => {
        setTimeout(showCorrectAnswer, 2000); // 2 seconds after audio ends
    };
}

// Function to show the correct answer
function showCorrectAnswer() {
    const currentQuestion = questions[currentQuestionIndex];
    const options = document.querySelectorAll(".option");

    options.forEach((option, index) => {
        if (index === currentQuestion.correctAnswer) {
            option.classList.add("correct");
        }
    });

    // Wait for 8 seconds before showing the next question
    setTimeout(() => {
        options.forEach((option) => option.classList.remove("correct"));
        currentQuestionIndex++;
        showQuestion();
    }, 8000);
}

// Function to reset the quiz
function resetQuiz() {
    currentQuestionIndex = 0;
    document.getElementsByClassName("start-button")[0].style.display = "block";
}

// Attach event listener to start button
document.getElementById("start-button").addEventListener("click", fetchQuestions);

function startTimer() {
  const timerElement = document.getElementById("timer");
  let remainingTime = 10;

  timerElement.textContent = remainingTime;

  const interval = setInterval(() => {
      remainingTime--;
      timerElement.textContent = remainingTime;

      if (remainingTime <= 0) {
          clearInterval(interval);
      }
  }, 1000);
}

function updateQuestionStatus(currentIndex, totalQuestions) {
  const questionStatus = document.getElementById("current-question");
  questionStatus.textContent = `Frage ${currentIndex + 1} von ${totalQuestions}`;
}
