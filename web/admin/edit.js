document.addEventListener("DOMContentLoaded", function() {
    const popup = document.getElementById("popupForm");
    const openLink = document.getElementById("openPopup");
    const closeButton = document.getElementById("closePopup");

    // Automatically open the popup when the page loads
    popup.style.display = "block";

    closeButton.onclick = function() {
        popup.style.display = "none"; // Hide the popup
    };

    window.onclick = function(event) {
        if (event.target === popup) {
            popup.style.display = "none"; // Hide the popup if clicked outside
        }
    };
});