SET @job_name = 'nightclub';
SET @society_name = 'society_nightclub';
SET @job_Name_Caps = 'Nightclub';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_nightclub_fridge', 'Nightclub (fridge)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'barman', 'Barkeeper', 1450, '{}', '{}'),
  (@job_name, 1, 'dancer', 'dancer', 1450, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Co-Manager', 3500, '{}', '{}'),
  (@job_name, 3, 'boss', 'Manager', 5000, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
    ('jager', 'Jägermeister', 5, 0, 1),
    ('rhum', 'Rhum', 5, 0, 1),
    ('whisky', 'Whisky', 5, 0, 1),
    ('tequila', 'Tequila', 5, 0, 1),
    ('martini', 'White Martini', 5, 0, 1),
    ('soda', 'Soda', 5, 0, 1),
    ('jusfruit', 'Fruit juice', 5, 0, 1),
    ('icetea', 'Ice Tea', 5, 0, 1),
    ('energy', 'Energy Drink', 5, 0, 1),
    ('drpepper', 'Dr. Pepper', 5, 0, 1),
    ('limonade', 'Lemonade', 5, 0, 1),
    ('bolcacahuetes', 'Bowl of peanuts', 5, 0, 1),
    ('bolnoixcajou', 'Bowl of cashew nuts', 5, 0, 1),
    ('bolpistache', 'Bowl of pistachios', 5, 0, 1),
    ('bolchips', 'Bowl of crisps', 5, 0, 1),
    ('saucisson', 'Sausage', 5, 0, 1),
    ('grapperaisin', 'Bunch of grapes', 5, 0, 1),
    ('jagerbomb', 'Jägerbomb', 5, 0, 1),
    ('golem', 'Golem', 5, 0, 1),
    ('whiskycoca', 'Whisky-coke', 5, 0, 1),
    ('vodkaenergy', 'Vodka-energy', 5, 0, 1),
    ('vodkafruit', 'Vodka-fruit juice', 5, 0, 1),
    ('rhumfruit', 'Rhum-fruit juice', 5, 0, 1),
    ('teqpaf', "Teq'paf", 5, 0, 1),
    ('rhumcoca', 'Rhum-coke', 5, 0, 1),
    ('mojito', 'Mojito', 5, 0, 1),
    ('ice', 'Ice', 5, 0, 1),
    ('mixapero', 'Aperitif Mix', 3, 0, 1),
    ('metreshooter', 'Shooter meter', 3, 0, 1),
    ('jagercerbere', 'Jäger Cerberus', 3, 0, 1),
    ('menthe', 'Mint leaf', 10, 0, 1),
    ('yusuf', 'Luxushaut', -1, 0, 1);
