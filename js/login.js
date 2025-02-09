  const passwordField = document.getElementById('password');
  const toggleButton = document.getElementById('togglePassword');

  toggleButton.addEventListener('click', () => {
    const type = passwordField.type === 'password' ? 'text' : 'password';
    passwordField.type = type;

    toggleButton.textContent = type === 'password' ? 'Show password' : 'Hide password';
  });