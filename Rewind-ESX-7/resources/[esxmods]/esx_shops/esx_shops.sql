USE `essentialmode`;

CREATE TABLE `shops` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `shops` (name, item, price) VALUES
	('TwentyFourSeven','bread',5),
	('TwentyFourSeven','water',5),
	('TwentyFourSeven','radio',10),
	('TwentyFourSeven','fishbait',3),
	('TwentyFourSeven','turtlebait', 8),
	('TwentyFourSeven','fishingrod', 12),
	('RobsLiquor','beer', 2),
	('RobsLiquor','bread',5),
	('RobsLiquor','water',5),
	('RobsLiquor','radio',10),
	('RobsLiquor','fishbait',3),
	('RobsLiquor','bandage2',8),
	('RobsLiquor','turtlebait', 8),
	('RobsLiquor','fishingrod', 12),
	('RobsLiquor','advancedlockpick', 1500),
	('RobsLiquor','armor', 1000),
	('LTDgasoline','bread',5),
	('LTDgasoline','water',5),
	('LTDgasoline','radio',10),
	('LTDgasoline','fishbait',3),
	('LTDgasoline','turtlebait', 8),
	('LTDgasoline','fishingrod', 12),
	('Steves','donut',4),
	('Steves','donut2',5),
	('Steves','monster',4),
	('Steves','taco',2),
	('Steves','taco2', 3),
	('Steves','taco3', 3),
	('Steves','taco4', 4),
	('Steves','hotdog', 2),
	('Police','fixkit', 0),
	('Police','radio', 0),
	('Police','armor2', 0)

;