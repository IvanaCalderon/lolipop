// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
    // Función para añadir un nuevo campo de Training
  document.getElementById('add-training').addEventListener('click', function(e) {
    e.preventDefault();
    let container = document.getElementById('trainings-container');
    let template = document.getElementById('new-training-template').innerHTML;
    let time = new Date().getTime();
    let newField = template.replace(/new_trainings/g, time); // Reemplaza el índice por un valor único
    container.insertAdjacentHTML('beforeend', newField);
  });

  // Función para añadir un nuevo campo de Job Experience
  document.getElementById('add-job-experience').addEventListener('click', function(e) {
    e.preventDefault();
    let container = document.getElementById('job-experiences-container');
    let template = document.getElementById('new-job-experience-template').innerHTML;
    let time = new Date().getTime();
    let newField = template.replace(/new_job_experiences/g, time); // Reemplaza el índice por un valor único
    container.insertAdjacentHTML('beforeend', newField);
  });

  // Función para eliminar dinámicamente un campo de Training o Job Experience
  document.addEventListener('click', function(e) {
    if (e.target.classList.contains('remove-training')) {
      e.preventDefault();
      e.target.closest('.nested-fields').remove();
    }
    if (e.target.classList.contains('remove-job-experience')) {
      e.preventDefault();
      e.target.closest('.nested-fields').remove();
    }
  });

  // Función para remover los campos vacíos antes de enviar el formulario
  document.querySelector('form').addEventListener('submit', function(e) {
    const emptyFields = document.querySelectorAll('.nested-fields input').forEach((field) => {
      if (field.value === "") {
        field.closest('.nested-fields').remove();
      }
    });
  });
});
  
