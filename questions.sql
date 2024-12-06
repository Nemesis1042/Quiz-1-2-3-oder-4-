-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Dez 2024 um 15:06
-- Server-Version: 10.6.18-MariaDB-0ubuntu0.22.04.1-log
-- PHP-Version: 7.4.33-nmm6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `d042262e`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_option` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `questions`
--

INSERT INTO `questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_option`) VALUES
(1, 'Wie heißt die Hauptstadt von Norwegen?', 'Stockholm', 'Oslo', 'Kopenhagen', 'Helsinki', 2),
(2, 'Welches Tier ist bekannt für seine langsame Fortbewegung?', 'Faultier', 'Schildkröte', 'Koala', 'Eidechse', 1),
(3, 'Wie heißt die Hauptstadt von Norwegen?', 'Stockholm', 'Oslo', 'Kopenhagen', 'Helsinki', 2),
(4, 'Welches Tier ist bekannt für seine langsame Fortbewegung?', 'Faultier', 'Schildkröte', 'Koala', 'Eidechse', 1),
(5, 'Wie viele Kontinente gibt es auf der Erde?', '5', '6', '7', '8', 3),
(6, 'Welche Farbe entsteht durch die Mischung von Blau und Gelb?', 'Grün', 'Orange', 'Lila', 'Braun', 1),
(7, 'Welches ist der längste Fluss der Welt?', 'Nil', 'Amazonas', 'Mississippi', 'Yangtse', 2),
(8, 'Welcher Planet ist der größte in unserem Sonnensystem?', 'Saturn', 'Jupiter', 'Neptun', 'Uranus', 2),
(9, 'Wie nennt man die Hauptstadt von Griechenland?', 'Athen', 'Rom', 'Sofia', 'Ankara', 1),
(10, 'Wer schrieb das Buch \'1984\'?', 'Aldous Huxley', 'George Orwell', 'Ernest Hemingway', 'J.D. Salinger', 2),
(11, 'Was ist das chemische Symbol für Gold?', 'Au', 'Ag', 'Pb', 'Fe', 1),
(12, 'Wie viele Planeten hat unser Sonnensystem?', '7', '8', '9', '10', 2),
(13, 'Welche Sprache wird in Brasilien gesprochen?', 'Spanisch', 'Portugiesisch', 'Italienisch', 'Französisch', 2),
(14, 'Welche Einheit misst die elektrische Stromstärke?', 'Volt', 'Ohm', 'Ampere', 'Watt', 3),
(15, 'Wie viele Farben hat ein Regenbogen?', '5', '6', '7', '8', 3),
(16, 'Welcher ist der höchste Berg der Welt?', 'K2', 'Everest', 'Kilimandscharo', 'Mont Blanc', 2),
(17, 'Was ist das am meisten gesprochene Wort weltweit?', 'Hallo', 'Ja', 'Okay', 'Danke', 3),
(18, 'Wer hat die Glühbirne erfunden?', 'Thomas Edison', 'Alexander Bell', 'Nikola Tesla', 'Benjamin Franklin', 1),
(19, 'Was ist das chemische Symbol für Wasserstoff?', 'H', 'O', 'N', 'C', 1),
(20, 'Welches Land hat die größte Bevölkerung der Welt?', 'USA', 'China', 'Indien', 'Russland', 2),
(21, 'Wie viele Sekunden hat eine Stunde?', '3600', '600', '1200', '2400', 1),
(22, 'Welche Farbe hat ein typischer Smaragd?', 'Rot', 'Blau', 'Grün', 'Gelb', 3),
(23, 'Welcher Planet wird als \'roter Planet\' bezeichnet?', 'Mars', 'Venus', 'Jupiter', 'Saturn', 1),
(24, 'Welches Tier ist das größte lebende Säugetier?', 'Elefant', 'Blauwal', 'Giraffe', 'Krokodil', 2),
(25, 'Wie viele Zähne hat ein erwachsener Mensch normalerweise?', '28', '30', '32', '34', 3),
(26, 'Welches Instrument hat Tasten und wird oft in Kirchen verwendet?', 'Klavier', 'Orgel', 'Violine', 'Flöte', 2),
(27, 'Wer war der erste Mensch auf dem Mond?', 'Buzz Aldrin', 'Yuri Gagarin', 'Neil Armstrong', 'Michael Collins', 3),
(28, 'Welches Element hat die chemische Bezeichnung \'O\'?', 'Sauerstoff', 'Stickstoff', 'Kohlenstoff', 'Helium', 1),
(29, 'Welches Tier kann rückwärts fliegen?', 'Kolibri', 'Adler', 'Taube', 'Papagei', 1),
(30, 'Welches Land erfand das Eis am Stiel?', 'Italien', 'USA', 'Deutschland', 'Frankreich', 2),
(31, 'Was ist der längste Fluss in Europa?', 'Donau', 'Wolga', 'Rhein', 'Elbe', 2),
(32, 'Welche Farbe hat die Zunge eines Giraffen?', 'Blau', 'Rosa', 'Schwarz', 'Rot', 3),
(33, 'Wie viele Knochen hat der menschliche Körper?', '200', '206', '212', '220', 2),
(34, 'Wer schrieb die Tragödie \'Hamlet\'?', 'Goethe', 'Schiller', 'Shakespeare', 'Hemingway', 3),
(35, 'Wie viele Tage hat ein Schaltjahr?', '365', '366', '367', '364', 2),
(36, 'Welches Tier ist bekannt als \'König der Tiere\'?', 'Tiger', 'Löwe', 'Elefant', 'Wolf', 2),
(37, 'Wie viele Ecken hat ein Würfel?', '6', '8', '10', '12', 2),
(38, 'Welche Farbe hat der Himmel normalerweise?', 'Blau', 'Grün', 'Rot', 'Weiß', 1),
(39, 'Was ist der chemische Name von Kochsalz?', 'Natriumchlorid', 'Kaliumchlorid', 'Magnesiumchlorid', 'Calciumchlorid', 1),
(40, 'Welches Meer ist das salzigste?', 'Totes Meer', 'Rotes Meer', 'Schwarzes Meer', 'Karibisches Meer', 1),
(41, 'Wer hat das erste Automobil erfunden?', 'Henry Ford', 'Carl Benz', 'Nikola Tesla', 'Thomas Edison', 2),
(42, 'Welches Tier legt Eier, obwohl es ein Säugetier ist?', 'Känguru', 'Ornithorhynchus', 'Delfin', 'Fledermaus', 2),
(43, 'Wie viele Tage hat der Februar in einem Schaltjahr?', '28', '29', '30', '31', 2),
(44, 'Wie viele Bücher hat die Bibel?', '50', '66', '72', '81', 2),
(45, 'Wer gilt als der Begründer des Christentums?', 'Mose', 'Jesus Christus', 'Paulus', 'Petrus', 2),
(46, 'Welches ist das letzte Buch im Neuen Testament?', 'Johannes', 'Offenbarung', 'Apostelgeschichte', 'Hebräer', 2),
(47, 'Wie viele Jünger hatte Jesus?', '10', '11', '12', '13', 3),
(48, 'Was bedeutet das Wort \'Evangelium\'?', 'Buch', 'Frohe Botschaft', 'Gebot', 'Lobpreis', 2),
(49, 'Wie nennt man die 10 grundlegenden Gebote Gottes?', 'Psalmen', 'Prophezeiungen', 'Die zehn Gebote', 'Das Gesetz Mose', 3),
(50, 'Wer brachte das Christentum nach Europa?', 'Petrus', 'Paulus', 'Lukas', 'Matthäus', 2),
(51, 'Was symbolisiert das Kreuz im Christentum?', 'Opfer und Auferstehung', 'Gesetz und Gnade', 'Herrschaft', 'Glaube', 1),
(52, 'Welcher Prophet führte die Israeliten aus Ägypten?', 'Jesaja', 'Jeremia', 'Mose', 'Ezechiel', 3),
(53, 'Wie viele Tage verbrachte Jesus nach seiner Auferstehung auf der Erde?', '7', '12', '40', '50', 3),
(54, 'Was feiert man am Pfingsttag?', 'Die Geburt Jesu', 'Die Himmelfahrt Christi', 'Die Ausgießung des Heiligen Geistes', 'Die Wiederkunft Jesu', 3),
(55, 'Welche Stadt wird in der Bibel als \'Stadt Davids\' bezeichnet?', 'Nazareth', 'Bethlehem', 'Jerusalem', 'Hebron', 3),
(56, 'Welches Gebot ist das erste der zehn Gebote?', 'Du sollst nicht stehlen.', 'Du sollst keine anderen Götter haben neben mir.', 'Du sollst nicht töten.', 'Du sollst Vater und Mutter ehren.', 2),
(57, 'Wie nennt man die ersten fünf Bücher der Bibel?', 'Evangelien', 'Tora', 'Propheten', 'Briefe', 2),
(58, 'Wer verriet Jesus für 30 Silberlinge?', 'Petrus', 'Judas Iskariot', 'Thomas', 'Jakobus', 2),
(59, 'Wie viele Evangelien gibt es im Neuen Testament?', '3', '4', '5', '6', 2),
(60, 'Welche drei Gaben brachten die Weisen aus dem Morgenland zu Jesus?', 'Gold, Weihrauch und Myrrhe', 'Gold, Silber und Bronze', 'Weihrauch, Myrrhe und Salz', 'Gold, Salz und Öl', 1),
(61, 'Was ist das größte Gebot laut Jesus?', 'Liebe deinen Nächsten wie dich selbst.', 'Du sollst nicht töten.', 'Du sollst Gott mit ganzem Herzen lieben.', 'Ehre deinen Vater und deine Mutter.', 3),
(62, 'Welches Buch der Bibel erzählt von der Schöpfung der Welt?', 'Genesis', 'Exodus', 'Psalmen', 'Offenbarung', 1),
(63, 'Wer baute die Arche, um die Sintflut zu überleben?', 'Mose', 'Noah', 'Abraham', 'David', 2),
(64, 'Wer führte die Israeliten nach dem Tod Moses in das Gelobte Land?', 'Josua', 'Aaron', 'Kaleb', 'Samuel', 1),
(65, 'Was geschah laut der Bibel am dritten Tag nach der Kreuzigung Jesu?', 'Seine Auferstehung', 'Sein Begräbnis', 'Das letzte Abendmahl', 'Die Himmelfahrt', 1),
(66, 'Welcher Kaiser erklärte das Christentum zur offiziellen Religion des Römischen Reiches?', 'Augustus', 'Konstantin', 'Nero', 'Trajan', 2),
(67, 'Was bedeutet das griechische Wort \'Christos\'?', 'Gesandter', 'Gesalbter', 'Erlöser', 'Herr', 2),
(68, 'Welcher Psalm beginnt mit \'Der Herr ist mein Hirte\'?', 'Psalm 1', 'Psalm 23', 'Psalm 91', 'Psalm 119', 2),
(69, 'Was ist die heilige Schrift des Christentums?', 'Koran', 'Bibel', 'Torah', 'Veden', 2),
(70, 'Wie viele Testamente hat die Bibel?', '1', '2', '3', '4', 2),
(71, 'Wer war der erste König von Israel?', 'David', 'Salomo', 'Saul', 'Josua', 3),
(72, 'Welches Buch der Bibel enthält die Schöpfungsgeschichte?', 'Genesis', 'Exodus', 'Psalmen', 'Sprüche', 1),
(73, 'Wer wurde von einem Wal verschluckt und überlebte?', 'Jona', 'Mose', 'David', 'Jesaja', 1),
(74, 'Welche Stadt wurde von Gott wegen ihrer Sünden zerstört?', 'Sodom', 'Jericho', 'Babylon', 'Nineve', 1),
(75, 'Wie oft sollte man laut Jesus vergeben?', '7 Mal', '77 Mal', '70 Mal 7 Mal', 'Unendlich oft', 3),
(76, 'Wer ist der Schutzpatron der Reisenden?', 'Christophorus', 'Michael', 'Gabriel', 'Petrus', 1),
(77, 'Wer schrieb die meisten Briefe im Neuen Testament?', 'Petrus', 'Paulus', 'Johannes', 'Jakobus', 2),
(78, 'Was symbolisiert die Taube im Christentum?', 'Den Frieden', 'Den Heiligen Geist', 'Die Liebe', 'Die Reinheit', 2),
(79, 'Wie viele Apostel hatte Jesus?', '10', '11', '12', '13', 3),
(80, 'Welcher Berg ist bekannt als der Berg der Verklärung?', 'Tabor', 'Horeb', 'Sinai', 'Olivenberg', 1),
(81, 'Welches Gebot fordert die Ehrung von Vater und Mutter?', 'Das 3. Gebot', 'Das 4. Gebot', 'Das 5. Gebot', 'Das 6. Gebot', 2),
(82, 'Welcher Prophet wurde in eine Löwengrube geworfen?', 'Daniel', 'Jeremia', 'Ezechiel', 'Jesaja', 1),
(83, 'Wie viele Plagen sandte Gott nach Ägypten?', '7', '9', '10', '12', 3),
(84, 'Wer war der Vater von König Salomo?', 'Saul', 'David', 'Josua', 'Aaron', 2),
(85, 'Wie hieß der Garten, in dem Adam und Eva lebten?', 'Garten Eden', 'Himmelsgarten', 'Paradies', 'Garten der Reinheit', 1),
(86, 'Welcher Engel erschien Maria, um ihr die Geburt Jesu anzukündigen?', 'Michael', 'Gabriel', 'Raphael', 'Uriel', 2),
(87, 'Welche Stadt wird oft als das Zentrum des Christentums angesehen?', 'Rom', 'Jerusalem', 'Nazareth', 'Bethlehem', 1),
(88, 'Was ist das wichtigste Sakrament im Christentum?', 'Taufe', 'Eucharistie', 'Firmung', 'Beichte', 2),
(89, 'Wer führte die Israeliten durch das Rote Meer?', 'Mose', 'Aaron', 'Josua', 'Kaleb', 1),
(90, 'Wie heißt das Gebet, das Jesus seine Jünger lehrte?', 'Vaterunser', 'Gegrüßet seist du Maria', 'Das Glaubensbekenntnis', 'Ave Maria', 1),
(91, 'Welche Zahl symbolisiert die Vollkommenheit in der Bibel?', '3', '7', '12', '40', 2),
(92, 'Wie heißt die Frau, die Jesus in Bethanien die Füße salbte?', 'Maria Magdalena', 'Martha', 'Maria von Bethanien', 'Salome', 3),
(93, 'Welches Symbol trägt der Papst?', 'Kreuz', 'Ring des Fischers', 'Tiara', 'Bischofsstab', 2),
(94, 'Wie nennt man den ersten Tag der Schöpfung?', 'Licht', 'Wasser', 'Land', 'Nacht', 1),
(95, 'Welches Buch der Bibel ist ein Liebeslied?', 'Psalmen', 'Das Hohelied', 'Jesaja', 'Sprüche', 2),
(96, 'Welche Bibelstelle wird oft als \'goldene Regel\' bezeichnet?', 'Du sollst den Herrn lieben.', 'Liebe deinen Nächsten wie dich selbst.', 'Du sollst nicht töten.', 'Vergib 70 Mal 7.', 2),
(97, 'Wer war die Mutter von Johannes dem Täufer?', 'Maria', 'Elisabeth', 'Martha', 'Magdalena', 2),
(98, 'Welcher König baute den ersten Tempel in Jerusalem?', 'Saul', 'David', 'Salomo', 'Josua', 3),
(99, 'Welche Sprache wurde im Neuen Testament verwendet?', 'Hebräisch', 'Griechisch', 'Latein', 'Aramäisch', 2),
(100, 'Was war das erste Wunder, das Jesus vollbrachte?', 'Die Heilung eines Blinden', 'Die Verwandlung von Wasser in Wein', 'Die Speisung der 5000', 'Die Auferweckung des Lazarus', 2),
(101, 'Wer schrieb die Offenbarung des Johannes?', 'Petrus', 'Johannes', 'Jakobus', 'Paulus', 2),
(102, 'Wer war der erste Märtyrer der Christenheit?', 'Petrus', 'Stephanus', 'Paulus', 'Jakobus', 2),
(103, 'Wie heißt die größte Wüste der Welt?', 'Sahara', 'Gobi', 'Atacama', 'Kalahari', 1),
(104, 'Welcher Kontinent hat die meisten Länder?', 'Asien', 'Afrika', 'Europa', 'Südamerika', 2),
(105, 'Welche Stadt wird auch \'die Stadt der Liebe\' genannt?', 'Rom', 'Venedig', 'Paris', 'Barcelona', 3),
(106, 'In welchem Land liegt der Amazonas-Regenwald größtenteils?', 'Brasilien', 'Peru', 'Kolumbien', 'Venezuela', 1),
(107, 'Was ist die Hauptstadt von Australien?', 'Sydney', 'Melbourne', 'Canberra', 'Perth', 3),
(108, 'Welcher ist der längste Fluss in Afrika?', 'Nil', 'Kongo', 'Niger', 'Sambesi', 1),
(109, 'In welchem Land befinden sich die Pyramiden von Gizeh?', 'Ägypten', 'Mexiko', 'Peru', 'Jordanien', 1),
(110, 'Welcher See ist der tiefste der Welt?', 'Baikalsee', 'Victoriasee', 'Caspian Sea', 'Tanganjikasee', 1),
(111, 'Welche zwei Länder trennt der Ärmelkanal?', 'England und Frankreich', 'Spanien und Marokko', 'Italien und Griechenland', 'Portugal und Spanien', 1),
(112, 'In welchem Land liegt der Mount Everest?', 'Nepal', 'China', 'Indien', 'Bhutan', 1),
(113, 'Welches ist der größte Ozean der Welt?', 'Pazifik', 'Atlantik', 'Indischer Ozean', 'Arktischer Ozean', 1),
(114, 'Wie viele Sterne hat die Flagge der Vereinigten Staaten?', '48', '49', '50', '52', 3),
(115, 'Welche Währung wird in Japan verwendet?', 'Yen', 'Won', 'Yuan', 'Dollar', 1),
(116, 'Welches Land hat die größte Fläche der Welt?', 'Kanada', 'Russland', 'China', 'USA', 2),
(117, 'In welcher Stadt steht der Eiffelturm?', 'London', 'Paris', 'Berlin', 'Rom', 2),
(118, 'Wie heißt die Hauptstadt von Italien?', 'Rom', 'Mailand', 'Venedig', 'Florenz', 1),
(119, 'Welches Land ist bekannt für seine Tulpen und Windmühlen?', 'Belgien', 'Niederlande', 'Dänemark', 'Deutschland', 2),
(120, 'Welche Stadt liegt auf zwei Kontinenten?', 'Istanbul', 'Kairo', 'Moskau', 'Tokio', 1),
(121, 'Welcher Fluss fließt durch London?', 'Themse', 'Seine', 'Donau', 'Rhein', 1),
(122, 'Was ist die Hauptstadt von Deutschland?', 'Berlin', 'Hamburg', 'München', 'Frankfurt', 1),
(123, 'Welche Sprache hat die meisten Muttersprachler weltweit?', 'Englisch', 'Mandarin', 'Spanisch', 'Hindi', 2),
(124, 'Welches Land hat die längste Küstenlinie der Welt?', 'Kanada', 'Australien', 'USA', 'Russland', 1),
(125, 'In welcher Stadt steht der schiefe Turm von Pisa?', 'Rom', 'Venedig', 'Florenz', 'Pisa', 4),
(126, 'Welcher ist der größte Kontinent der Erde?', 'Afrika', 'Asien', 'Europa', 'Antarktis', 2),
(127, 'Wie heißt der längste Fluss Europas?', 'Donau', 'Rhein', 'Wolga', 'Elbe', 3),
(128, 'Welches Land ist bekannt für den Mount Fuji?', 'China', 'Japan', 'Südkorea', 'Thailand', 2),
(129, 'Welches ist das kleinste Land der Welt?', 'San Marino', 'Monaco', 'Vatikanstadt', 'Liechtenstein', 3),
(130, 'Welches Gebirge trennt Europa und Asien?', 'Ural', 'Alpen', 'Himalaya', 'Kaukasus', 1),
(131, 'Welche Stadt ist die Hauptstadt von Südafrika?', 'Kapstadt', 'Pretoria', 'Johannesburg', 'Durban', 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
