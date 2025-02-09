    // Function to confirm logout
    function confirmLogout(event) {
      const userConfirmed = confirm("Are you sure you want to logout?");
      if (!userConfirmed) {
        // Prevent the default link action if the user cancels
        event.preventDefault();
      }
    }
    
    // Add the event listener after DOM is loaded
    document.addEventListener("DOMContentLoaded", function () {
      const logoutLink = document.querySelector('a[href="..\\controllers\\logout.php"]');
      if (logoutLink) {
        logoutLink.addEventListener("click", confirmLogout);
      }
    });