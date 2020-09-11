USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_dealer','Dealer',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_dealer','Dealer',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('dealer','Dealer')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('dealer',0,'recrue','Recruit',20,'{}','{}'),
  ('dealer',1,'novice','Novice',40,'{}','{}'),
  ('dealer',2,'experimente','Experienced',60,'{}','{}'),
  ('dealer',3,'chief','Leader',80,'{}','{}'),
  ('dealer',4,'boss','Boss',100,'{}','{}')
;
