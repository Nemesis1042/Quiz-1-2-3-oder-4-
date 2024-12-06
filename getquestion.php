<?php
// Database connection
$host = 'localhost';
$user = 'd042262e';
$password = 'BmYDUuduxafo3HcfnsqE';
$database = 'd042262e';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch questions from the database
$sql = "SELECT question, option1, option2, option3, option4, correct_option FROM questions";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $questions = array();
    while ($row = $result->fetch_assoc()) {
        $questions[] = array(
            "question" => $row["question"],
            "options" => array($row["option1"], $row["option2"], $row["option3"], $row["option4"]),
            "correctAnswer" => intval($row["correct_option"]) - 1 // Assuming correct_option is 1-based
        );
    }
    echo json_encode($questions);
} else {
    echo json_encode([]);
}

$conn->close();
?>
