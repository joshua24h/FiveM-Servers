USE `essentialmode`;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('krowa', 0, 'employee', 'Farmer', 5, '', '')
;

INSERT INTO `jobs` (name, label) VALUES
	('krowa','Farmer')
;

INSERT INTO `items` (name, label, `limit`) VALUES
	('mleko','Milk', 50)
;