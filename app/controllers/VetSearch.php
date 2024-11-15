<?php

class VetSearch
{
    use Controller;

    public function index()
    {
        // Debugging output
        error_log("VetSearch index() method called.");

        // Full list of veterinarians
        $allVets = [
            ["name" => "Dr. John Doe", "location" => "New York", "rating" => 4],
            ["name" => "Dr. Jane Smith", "location" => "Los Angeles", "rating" => 5],
            ["name" => "Dr. Emily White", "location" => "Chicago", "rating" => 3],
        ];

        // Default vets to display
        $vets = $allVets;

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Debugging: Output POST data
            error_log("POST data: " . print_r($_POST, true));

            if (isset($_POST['clear'])) {
                // Debugging: Clear button logic
                error_log("Clear button clicked.");
                $vets = $allVets;
            } elseif (isset($_POST['search'])) {
                // Debugging: Search button logic
                error_log("Search button clicked.");
                $searchName = trim($_POST['name'] ?? '');
                $searchLocation = trim($_POST['location'] ?? '');

                $vets = array_filter($allVets, function ($vet) use ($searchName, $searchLocation) {
                    return (
                        (!$searchName || stripos($vet['name'], $searchName) !== false) &&
                        (!$searchLocation || stripos($vet['location'], $searchLocation) !== false)
                    );
                });

                // Debugging: Filtered results
                error_log("Filtered vets: " . print_r($vets, true));
            }
        }

        // Pass vets to the view
        $this->view('vetsearch', ['vets' => $vets]);
    }
}
