USE `essentialmode`;

INSERT INTO `vehicle_categories` (name, label) VALUES
	('bikes','Addon Bikes')
;

INSERT INTO `vehicles` (name, model, price, category) VALUES
	('Husqvarna FC450','fc450',22500,'bikes'),
	('Honda GoldWing','goldwing',45000,'bikes'),
	('Honda Grom','msx',25000,'bikes'),
	('Suzuki GSXR','gsxr',50000,'bikes'),
	('Kawasaki H2','h2carb',150000,'bikes'),
	('Suzuki LTR450','ltr450',10000,'bikes'),
	('Aprilia MXV450','mxv450',25000,'bikes'),
	('Aprilia MXV450 Supermoto','mxv450sm',35000,'bikes'),
	('Stomp 110','pitbike',1200,'bikes'),
	('Yamaha R1','r1',40000,'bikes'),
	('Yamaha R6','r6',80000,'bikes'),
	('Suzuki RMZ','rmz2',39000,'bikes'),
	('KTM SXF450','sxf450',29000,'bikes'),
	('KTM SXF450 Supermoto','sxf450sm',32000,'bikes'),
	('TM SMR450','tmsm',35000,'bikes'),
	('Kawasaki Ninja ZX-10R','zx10r',62000,'bikes')

;
