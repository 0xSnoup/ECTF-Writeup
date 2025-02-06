// Collect all image elements
const images = document.querySelectorAll('#grid img');

// Convert the NodeList to an array and sort images based on their filenames
const sortedImages = Array.from(images).sort((a, b) => {
    const aFileName = a.src.split('/').pop();  // Get the filename of image a
    const bFileName = b.src.split('/').pop();  // Get the filename of image b
    return aFileName.localeCompare(bFileName); // Compare the filenames
});

// Empty the grid container
const grid = document.getElementById('grid');
grid.innerHTML = '';

// Append the sorted images back to the grid container
sortedImages.forEach(image => grid.appendChild(image));
