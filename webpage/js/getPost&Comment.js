export function fetchData(endpoint, tableBodySelector, type = 'post') {
    const tableBody = document.querySelector(tableBodySelector);
    if (!tableBody) {
        console.error('Table body not found:', tableBodySelector);
        return;
    }

    fetch(endpoint)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (!data || data.length === 0) {
                insertErrorRow(tableBody, '데이터가 없습니다.');
                return;
            }
            data.forEach(item => {
                const row = document.createElement('tr');
                const idCell = document.createElement('td');
                idCell.innerText = item.id;
                row.appendChild(idCell);
                const contentCell = document.createElement('td');
                contentCell.innerText = type === 'post' ? item.title : item.comment;
                row.appendChild(contentCell);
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error(`There was a problem fetching ${type} data:`, error);
            insertErrorRow(tableBody, '데이터를 가져오는데 문제가 발생했습니다.');
        });
}

function insertErrorRow(tableBody, message) {
    const row = document.createElement('tr');
    const cell = document.createElement('td');
    cell.setAttribute('colspan', '2');
    cell.innerText = message;
    row.appendChild(cell);
    tableBody.appendChild(row);
}