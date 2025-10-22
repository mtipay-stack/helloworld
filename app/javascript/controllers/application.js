import { Application } from "@hotwired/stimulus"

const application = Application.start()
application.debug = false
window.Stimulus = application

export { application }

// === 🌙 DARK MODE TOGGLE (with Turbo Drive Support) ===
function setupDarkMode() {
  const toggleBtn = document.getElementById("themeToggle");
  const body = document.body;

  if (!toggleBtn) return; // if no button (on some pages), skip

  // Apply saved theme preference
  if (localStorage.getItem("theme") === "dark") {
    body.classList.add("dark-mode");
    toggleBtn.textContent = "☀️ Light Mode";
  } else {
    body.classList.remove("dark-mode");
    toggleBtn.textContent = "🌙 Dark Mode";
  }

  // Re-bind click event each Turbo load
  toggleBtn.addEventListener("click", () => {
    const isDark = body.classList.toggle("dark-mode");
    toggleBtn.textContent = isDark ? "☀️ Light Mode" : "🌙 Dark Mode";
    localStorage.setItem("theme", isDark ? "dark" : "light");
  });
}

// Run this function every time a Turbo page loads
document.addEventListener("turbo:load", setupDarkMode);
