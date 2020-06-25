SELECT 
    appx_employee.lastname AS apellido,
    appx_educationlevel.description
FROM
    appx_employee
        INNER JOIN
    appx_department ON appx_employee.department_id = appx_department.id
        INNER JOIN
    appx_educationlevel ON appx_educationlevel.id = appx_employee.educationlevel_id
        INNER JOIN
    (SELECT 
        appx_department.id, SUM(appx_employee.salary) AS salary
    FROM
        prueba.appx_employee
    INNER JOIN appx_department ON appx_department.id = appx_employee.department_id
    GROUP BY appx_department.id) AS dato_2 ON dato_2.id = appx_department.id
WHERE
    dato_2.salary > 3000000
ORDER BY apellido ASC;