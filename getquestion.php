<?php
// Database connection
$host = 'localhost';
$user = 'd042262e';
$password = 'BmYDUuduxafo3HcfnsqE';
$database = 'd042262e';

// Create a connection
$conn = new mysqli($host, $user, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch questions
$sql = "SELECT question, option1, option2, option3, option4, correct_option FROM questions";
$result = $conn->query($sql);

if (!$result) {
    die("Error executing query: " . $conn->error);
}


if ($result->num_rows > 0) {
    $questions = array();
    while ($row = $result->fetch_assoc()) {
        $questions[] = array(
            "question" => $row["question"],
            "options" => array($row["option1"], $row["option2"], $row["option3"], $row["option4"]),
            "correctAnswer" => intval($row["correct_option"]) - 1
        );
    }
    echo json_encode($questions);
} else {
    echo json_encode([]);
}

$conn->close();
?>



