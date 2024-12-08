<?php
$host = 'localhost';
$user = 'd042262e';
$password = 'BmYDUuduxafo3HcfnsqE';
$database = 'd042262e';

$conn = new mysqli($host, $user, $password, $database);

// Set UTF-8 for the connection
$conn->set_charset('utf8mb4');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Verarbeiten von Formularanfragen (Erstellen, Bearbeiten, Löschen)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    $action = $_POST['action'];
    $id = $_POST['id'] ?? null;
    $question = $_POST['question'] ?? null;
    $option1 = $_POST['option1'] ?? null;
    $option2 = $_POST['option2'] ?? null;
    $option3 = $_POST['option3'] ?? null;
    $option4 = $_POST['option4'] ?? null;
    $correct_option = $_POST['correct_option'] ?? null;

    if ($action === 'create') {
        $sql = "INSERT INTO questions (question, option1, option2, option3, option4, correct_option) 
                VALUES ('$question', '$option1', '$option2', '$option3', '$option4', $correct_option)";
    } elseif ($action === 'update') {
        $sql = "UPDATE questions SET 
                question = '$question', 
                option1 = '$option1', 
                option2 = '$option2', 
                option3 = '$option3', 
                option4 = '$option4', 
                correct_option = $correct_option 
                WHERE id = $id";
    } elseif ($action === 'delete') {
        $sql = "DELETE FROM questions WHERE id = $id";

    }

    if ($conn->query($sql)) {
        echo "Aktion erfolgreich!";
        header('Location: admin.php');
        exit();
    
    } else {
        echo "Fehler: " . $conn->error;
    }
    exit;
}

// Abrufen der Frage für eine bestimmte ID
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['fetch_id'])) {
    $id = $_POST['fetch_id'];
    $result = $conn->query("SELECT * FROM questions WHERE id = $id");

    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
        foreach ($data as $key => $value) {
            $data[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8'); // Sonderzeichen schützen
        }
        echo implode('|', $data);
    } else {
        echo "Keine Daten gefunden für die angegebene ID";
    }
    exit;
}

// Fragen abrufen
$result = $conn->query("SELECT * FROM questions");
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Fragenverwaltung</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button.delete {
            background-color: #dc3545;
        }
        #back-button {
            margin-top: 20px;
            background-color: #28a745;
        }
    </style>
</head>
<body>
    <h1>Fragenverwaltung</h1>

    <!-- Button zurück zur Startseite -->
    <button id="back-button" onclick="window.location.href='index.html';">Zurück zur Startseite</button>

    <!-- ID-Eingabe -->
    <form id="fetch-form" method="POST" onsubmit="fetchQuestion(event)">
        <label for="fetch_id">Frage-ID eingeben:</label>
        <input type="number" name="fetch_id" id="fetch_id" required>
        <button type="submit">Daten laden</button>
    </form>

    <!-- Formular für die Frage -->
    <form id="question-form" method="POST">
        <input type="hidden" name="id" id="id">
        <label for="question">Frage:</label><br>
        <input type="text" name="question" id="question" required><br><br>

        <label for="option1">Option 1:</label><br>
        <input type="text" name="option1" id="option1" required><br><br>

        <label for="option2">Option 2:</label><br>
        <input type="text" name="option2" id="option2" required><br><br>

        <label for="option3">Option 3:</label><br>
        <input type="text" name="option3" id="option3" required><br><br>

        <label for="option4">Option 4:</label><br>
        <input type="text" name="option4" id="option4" required><br><br>

        <label for="correct_option">Richtige Option (1-4):</label><br>
        <input type="number" name="correct_option" id="correct_option" required min="1" max="4"><br><br>

        <button type="submit" name="action" value="create">Erstellen</button>
        <button type="submit" name="action" value="update">Bearbeiten</button>
        <button type="submit" name="action" value="delete" class="delete">Löschen</button>
    </form>

    <h2>Vorhandene Fragen</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Frage</th>
                <th>Option 1</th>
                <th>Option 2</th>
                <th>Option 3</th>
                <th>Option 4</th>
                <th>Richtige Option</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr onclick="fillFormFromTable(<?= $row['id'] ?>)">
                    <td><?= htmlspecialchars($row['id'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['question'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['option1'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['option2'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['option3'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['option4'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['correct_option'], ENT_QUOTES, 'UTF-8') ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <script>
        async function fetchQuestion(event) {
            event.preventDefault();
            const fetchId = document.getElementById("fetch_id").value;
            const formData = new FormData();
            formData.append("fetch_id", fetchId);

            const response = await fetch("admin.php", {
                method: "POST",
                body: formData,
            });

            const text = await response.text();
            if (text.includes("Keine Daten gefunden")) {
                alert(text);
            } else {
                const parts = text.split("|");
                document.getElementById("id").value = parts[0];
                document.getElementById("question").value = parts[1];
                document.getElementById("option1").value = parts[2];
                document.getElementById("option2").value = parts[3];
                document.getElementById("option3").value = parts[4];
                document.getElementById("option4").value = parts[5];
                document.getElementById("correct_option").value = parts[6];
            }
        }

        function fillFormFromTable(id) {
            document.getElementById("fetch_id").value = id;
            document.getElementById("fetch-form").dispatchEvent(new Event("submit"));
        }
    </script>
</body>
</html>
