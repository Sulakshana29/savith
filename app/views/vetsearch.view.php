<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=ROOT?>/assets/css/styles.css">
    <link rel="stylesheet" href="<?=ROOT?>/assets/css/vetsearch.css">
    <link rel="stylesheet" href="<?=ROOT?>/assets/css/components/nav.css">
    <link rel="stylesheet" href="<?=ROOT?>/assets/css/components/footer.css">

    <title>Vet Surgeon Search</title>
    <link rel="stylesheet" href="../css/vetsearch.css">
</head>
<body>
    <?php include ('components/nav.php'); ?>
    <div class="search-container">
        <h1 class="search-heading">Search for Veterinary Surgeons</h1>
        <form action="/VetSearch/index" method="POST">
    <input type="text" name="name" placeholder="Search by name" class="search-bar">
    <input type="text" name="location" placeholder="Search by location" class="search-bar">
    <button type="submit" name="search" class="search-button">Search</button>
    <button type="submit" name="clear" class="clear-button">Clear</button>
</form>

    </div>

    <div class="results-container">
    <?php if (!empty($vets)): ?>
        <?php foreach ($vets as $vet): ?>
            <div class="vet-card">
                <h2 style="color: black;"><?php echo htmlspecialchars($vet['name']); ?></h2>
                <p style="color: black;">Location: <?php echo htmlspecialchars($vet['location']); ?></p>
                <p style="color: black;">Rating: <?php echo str_repeat("⭐", $vet['rating']); ?></p>
                <button class="book-button">Book</button>
            </div>
        <?php endforeach; ?>
    <?php else: ?>
        <p style="color: black;">No results found.</p>
    <?php endif; ?>
</div>



    
    <?php include ('components/footer.php'); ?>
</body>
</html>
