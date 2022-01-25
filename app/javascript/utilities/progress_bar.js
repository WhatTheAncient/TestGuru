document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.submit-progress')

  console.log(control)

  if (control) control.addEventListener('click', moveProgressBar())
})

function moveProgressBar() {
  let progressBar = document.querySelector('.progress-bar')
  const progressValue = progressBar.dataset.progressValue
  const maxValue = progressBar.dataset.maxValue

  let currentProgressBarValue = progressValue / maxValue

  console.log(currentProgressBarValue)

  progressBar.value = currentProgressBarValue
}
