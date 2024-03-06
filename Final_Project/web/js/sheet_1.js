var btnXlsx = document.getElementById('export_btn');

btnXlsx.onclick = () => exportData('xlsx')

function exportData(type) {
    const fileName = 'AttendanceSheet1.' + type
    const courseRegistration_table = document.getElementById("table-id")
    const wb = XLSX.utils.table_to_book(courseRegistration_table)
   XLSX.writeFile(wb, fileName)
 }