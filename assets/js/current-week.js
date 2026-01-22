document.getElementById("current-week-btn").addEventListener("click", function (e) {
  e.preventDefault();

  const semesterStart = new Date(window.SEMESTER_START);
  console.log("Semester start date:", semesterStart);
  const today = new Date();
  today.setHours(0,0,0,0);

  const diffDays = Math.floor((today - semesterStart) / (1000 * 60 * 60 * 24));
  const weekNumber = Math.max(1, Math.floor(diffDays / 7) + 1);

  const targetId = "week-" + weekNumber;
  const target = document.getElementById(targetId);
  console.log("Scrolling to:", targetId);

  if (target) {
    target.scrollIntoView({ behavior: "smooth" });
    window.location.hash = targetId;
  }
});