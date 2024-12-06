let questions = [];
let currentQuestionIndex = 0;

// Function to fetch questions from the server
async function fetchQuestions() {
    try {
        const response = await fetch("getquestion.php");
        if (!response.ok) {
            throw new Error("Failed to fetch questions from the server.");
        }
        questions = await response.json();
        startQuiz();
    } catch (error) {
        console.error("Error fetching questions:", error);
        alert("Unable to load questions. Please try again later.");
    }
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
        alert("Quiz completed!");
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
        button.addEventListener("click", () => checkAnswer(index));
        optionsContainer.appendChild(button);
    });
}

// Function to check the selected answer
function checkAnswer(selectedIndex) {
    const currentQuestion = questions[currentQuestionIndex];
    const options = document.querySelectorAll(".option");

    options.forEach((option, index) => {
        if (index === currentQuestion.correctAnswer) {
            option.classList.add("correct");
        } else {
            option.classList.remove("correct");
        }
    });

    setTimeout(() => {
        currentQuestionIndex++;
        showQuestion();
    }, 2000);
}

// Function to reset the quiz
function resetQuiz() {
    currentQuestionIndex = 0;
    document.getElementsByClassName("start-button")[0].style.display = "block";
}

// Attach event listener to start button
document.getElementById("start-button").addEventListener("click", fetchQuestions);
