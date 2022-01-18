document.addEventListener('turbolinks:load', function() {
    registrationForm = document.getElementById('new_user')

    var secondPass = document.getElementById('user_password_confirmation')

    if (secondPass) { registrationForm.addEventListener('input', validatePasswordConfirmation) }
})

function validatePasswordConfirmation() {
    var firstPass = document.getElementById('user_password')
    var secondPass = document.getElementById('user_password_confirmation')

    var confirmationBlock = document.querySelector('.password-confirmation-check')

    if (secondPass.value) {
        confirmationBlock.classList.remove('hide')
        if (firstPass.value == secondPass.value) {
            confirmationBlock.querySelector('.octicon-alert').classList.add('hide')
            confirmationBlock.querySelector('.octicon-check').classList.remove('hide')
        } else {
            confirmationBlock.querySelector('.octicon-alert').classList.remove('hide')
            confirmationBlock.querySelector('.octicon-check').classList.add('hide')
        }
    }
}