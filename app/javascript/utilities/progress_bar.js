document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.submit-progress')

  if (control) control.addEventListener('click', moveProgressBar())
})

function moveProgressBar() {
  let progressBar = document.querySelector('.progress-bar')
  const progressValue = progressBar.dataset.progressValue
  const maxValue = progressBar.dataset.maxValue

  let currentProgressBarValue = 100 * progressValue / maxValue

  progressBar.style.width = `${currentProgressBarValue}%`
  progressBar.setAttribute('aria-valuenow', `${currentProgressBarValue}`)
  console.log(currentProgressBarValue)
}
