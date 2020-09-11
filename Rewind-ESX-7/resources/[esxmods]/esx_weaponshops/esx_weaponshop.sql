USE `essentialmode`;

CREATE TABLE `weashops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`zone` varchar(255) NOT NULL,
	`item` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `licenses` (`type`, `label`) VALUES
	('weapon', "Weapon License")
;

INSERT INTO `weashops` (`zone`, `item`, `price`) VALUES
	('GunShop', 'WEAPON_BALL', 2),
	('GunShop', 'WEAPON_BAT', 85),
	('GunShop', 'WEAPON_BATTLEAXE', 195),
	('GunShop', 'WEAPON_BOTTLE', 1),
	('GunShop', 'WEAPON_CROWBAR', 35),
	('GunShop', 'WEAPON_DAGGER', 185),
	('GunShop', 'WEAPON_FIREEXTINGUISHER', 20),
	('GunShop', 'WEAPON_FLASHLIGHT', 15),
	('GunShop', 'WEAPON_GOLFCLUB', 75),
	('GunShop', 'WEAPON_HAMMER', 15),
	('GunShop', 'WEAPON_HATCHET', 95),
	('GunShop', 'WEAPON_KNIFE', 35),
	('GunShop', 'WEAPON_KNUCKLE', 95),
	('GunShop', 'WEAPON_MACHETE', 200),
	('GunShop', 'WEAPON_PETROLCAN', 100),
	('GunShop', 'WEAPON_POOLCUE', 15),
	('GunShop', 'WEAPON_SNOWBALL', 5),
	('GunShop', 'WEAPON_SWITCHBLADE', 75),
	('GunShop', 'WEAPON_WRENCH', 35),
	('BlackWeashop', 'WEAPON_STUNGUN', 250),
	('BlackWeashop', 'WEAPON_DBSHOTGUN', 650),
	('BlackWeashop', 'WEAPON_COMBATPISTOL', 1500)
	
;
