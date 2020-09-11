USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_mecano','Mechanic',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_mecano','Mechanic',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('mecano','Mechanic')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('mecano',0,'recrue','Recruit',20,'{}','{}'),
  ('mecano',1,'novice','Novice',40,'{}','{}'),
  ('mecano',2,'experimente','Experienced',60,'{}','{}'),
  ('mecano',3,'chief','Leader',80,'{}','{}'),
  ('mecano',4,'boss','Boss',100,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
  ('gazbottle', 'Gas Bottle'),
  ('fixtool', 'Repair Tools'),
  ('carotool', 'Tools'),
  ('blowpipe', 'Blowtorch'),
  ('fixkit', 'Repair Kit'),
  ('carokit', 'Body Kit')
;
