document.addEventListener('turbolinks:load', function() {
  const timer = document.querySelector('.timer')
  console.log(timer.dataset.timeTotal)
  if (timer) {
    timer.innerText = formattedTime(timer.dataset.timeTotal)
    startTimer()
  }
})

function startTimer() {
  setTimeout(checkForTimeOut, 1000)
}

function checkForTimeOut() {
  const timer = document.querySelector('.timer')
  if (!timer) return

  let timeLeft = formattedStringToSeconds(timer.innerText)
  if (!timeLeft) document.querySelector('.submit-progress').click()

  timeLeft -= 1
  timer.innerText = formattedTime(timeLeft)

  startTimer(timeLeft)
}

function formattedTime(timeInSeconds) {
  function formattedDigit(digit){
    return digit / 10 >= 1 ? digit : `0${digit}`
  }
  const minutes = Math.floor(timeInSeconds / 60)
  const seconds = timeInSeconds - minutes * 60

  return `${formattedDigit(minutes)}:${formattedDigit(seconds)}`
}

function formattedStringToSeconds(formattedString) {
  const time = formattedString.split(':')

  return parseInt(time[0]) * 60 + parseInt(time[1])
}
