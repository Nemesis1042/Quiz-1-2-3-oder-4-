<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$host = 'localhost';
$user = 'd042262e';
$password = 'BmYDUuduxafo3HcfnsqE';
$database = 'd042262e';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$conn->set_charset('utf8mb4'); // Set UTF-8 charset

$sql = "SELECT question, option1, option2, option3, option4, correct_option FROM questions";
$result = $conn->query($sql);

header('Content-Type: text/plain; charset=utf-8');
if ($result->num_rows > 0) {
    $output = "";
    while ($row = $result->fetch_assoc()) {
        $output .= $row["question"] . "|" .
                   $row["option1"] . "|" .
                   $row["option2"] . "|" .
                   $row["option3"] . "|" .
                   $row["option4"] . "|" .
                   $row["correct_option"] . "\n";
    }
    echo trim($output);
} else {
    echo "No questions found";
}

$conn->close();
?>
