USE `essentialmode`;

INSERT INTO `vehicle_categories` (name, label) VALUES
	('jap_imports','jap imports')
;

INSERT INTO `vehicles` (name, model, price, category) VALUES
	('Honda Integra DC2','dc2',85000,'jap_imports'),
	('Honda Integra DC5','dc5',95000,'jap_imports'),
	('Honda Civic EF9','ef9',65000,'jap_imports'),
	('Honda Civic EG6','eg6',75000,'jap_imports'),
	('Honda Civic EP3','ep3',70000,'jap_imports'),
	('Honda Civic FK8','fk8',90000,'jap_imports'),
	('Toyota Chaser MK1','jzx100',120000,'jap_imports'),
	('Nissan Skyline Mk1','kgc10',300000,'jap_imports'),
	('Drift Lexus KSC300','ksc300',600000,'jap_imports'),
    ('Honda NSX','nc1',250000,'jap_imports'),
	('Nissan S30 Pandem','ps30',250000,'jap_imports'),
	('Nissan Skyline R35','r35',320000,'jap_imports'),
	('Nissan S15 Rocket Bunny','s15rbjr',175000,'jap_imports'),
	('Nissan S30','s30',300000,'jap_imports')
	
;
