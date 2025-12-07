<?php
$host = 'localhost';
$username = 'lab5_user';
$password = 'password123';
$dbname = 'world';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Get parameters
    $country = isset($_GET['country']) ? trim($_GET['country']) : '';
    $lookup = isset($_GET['lookup']) ? $_GET['lookup'] : 'countries';
    
    if ($lookup == 'cities') {
        // Cities lookup
        if (!empty($country)) {
            $stmt = $conn->prepare("
                SELECT cities.name, cities.district, cities.population 
                FROM cities 
                JOIN countries ON cities.country_code = countries.code 
                WHERE countries.name LIKE :country
                ORDER BY cities.population DESC
            ");
            $stmt->bindValue(':country', "%$country%", PDO::PARAM_STR);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            if (count($results) > 0) {
                echo "<h3>Cities in " . htmlspecialchars($country) . "</h3>";
                echo "<table>";
                echo "<thead><tr><th>Name</th><th>District</th><th>Population</th></tr></thead>";
                echo "<tbody>";
                foreach ($results as $row) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['name']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['district']) . "</td>";
                    echo "<td>" . number_format($row['population']) . "</td>";
                    echo "</tr>";
                }
                echo "</tbody></table>";
            } else {
                echo "<p>No cities found for '" . htmlspecialchars($country) . "'</p>";
            }
        } else {
            echo "<p>Please enter a country name to search for cities.</p>";
        }
        
    } else {
        // Countries lookup
        if (!empty($country)) {
            $stmt = $conn->prepare("
                SELECT name, continent, independence_year, head_of_state 
                FROM countries 
                WHERE name LIKE :country
                ORDER BY name
            ");
            $stmt->bindValue(':country', "%$country%", PDO::PARAM_STR);
            $stmt->execute();
        } else {
            // If no country specified, show all
            $stmt = $conn->prepare("
                SELECT name, continent, independence_year, head_of_state 
                FROM countries 
                ORDER BY name
            ");
            $stmt->execute();
        }
        
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        if (count($results) > 0) {
            if (!empty($country)) {
                echo "<h3>Countries matching '" . htmlspecialchars($country) . "'</h3>";
            } else {
                echo "<h3>All Countries</h3>";
            }
            
            echo "<table>";
            echo "<thead><tr><th>Name</th><th>Continent</th><th>Independence Year</th><th>Head of State</th></tr></thead>";
            echo "<tbody>";
            foreach ($results as $row) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['name']) . "</td>";
                echo "<td>" . htmlspecialchars($row['continent']) . "</td>";
                echo "<td>" . ($row['independence_year'] ? htmlspecialchars($row['independence_year']) : 'N/A') . "</td>";
                echo "<td>" . htmlspecialchars($row['head_of_state']) . "</td>";
                echo "</tr>";
            }
            echo "</tbody></table>";
            echo "<p>" . count($results) . " country(ies) found.</p>";
        } else {
            echo "<p>No countries found matching '" . htmlspecialchars($country) . "'</p>";
        }
    }
    
} catch(PDOException $e) {
    echo "<p>Database error: " . htmlspecialchars($e->getMessage()) . "</p>";
}
?>
