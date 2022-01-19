document.addEventListener('turbolinks:load', function() {
    const registrationForm = document.getElementById('new_user')

    const firstPass = document.getElementById('user_password')
    const secondPass = document.getElementById('user_password_confirmation')

    if (firstPass || secondPass)
        registrationForm.addEventListener('input', validatePasswordConfirmation)

    function validatePasswordConfirmation() {
        const confirmationBlock = document.querySelector('.password-confirmation-check')

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
})
