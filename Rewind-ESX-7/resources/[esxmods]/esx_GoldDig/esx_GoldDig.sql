USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('gold_o', 'Scrap gold', 25, 0, 1),
	('gold_t', 'Gold', 5, 0, 1)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('gold_processing', 'Gold Processing License')
;