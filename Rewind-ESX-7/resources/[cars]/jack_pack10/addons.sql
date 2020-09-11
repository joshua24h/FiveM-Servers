USE `essentialmode`;

INSERT INTO `vehicle_categories` (name, label) VALUES
	('milos','Milos Exclusives')
;

INSERT INTO `vehicles` (name, model, price, category) VALUES
	('Supra A90','supraa90',150000,'milos'),
	('Nissan GTR 50','gtr50',185000,'milos'),
	('Caddie CT5V','ct5v',75000,'milos'),
	('SRT Daytona','srtday20',100000,'milos'),
	('Porsche 992 Targa','992t',205000,'addons2'),
	('Bentley Conti GT S','cgts',195000,'addons2'),
	('BMW E36 GD','gdae36v',120000,'addons2'),
	('Mercedes C63 Coupe','c63coupe',160000,'addons2')
	
;
