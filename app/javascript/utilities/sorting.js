document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.sort-by-title')

    if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
    const table = document.querySelector('table')

    const tableBody = table.querySelector('tbody')
    let sortedRows = []

    tableBody.querySelectorAll('tr').forEach((element) => sortedRows.push(element))

    const arrowUp = document.querySelector('.octicon-arrow-up')
    const arrowDown = document.querySelector('.octicon-arrow-down')

    if (arrowUp.classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        arrowUp.classList.remove('hide')
        arrowDown.classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        arrowDown.classList.remove('hide')
        arrowUp.classList.add('hide')
    }

    const sortedTableBody = document.createElement('tbody')

    sortedRows.forEach((element) => sortedTableBody.appendChild(element))

    table.replaceChild(sortedTableBody, tableBody)
}

function compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}
