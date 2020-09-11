USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_lizard','lizard',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_lizard','lizard',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('lizard','lizard')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('lizard',0,'recrue','Recrue',12,'{}','{}'),
  ('lizard',1,'novice','Novice',24,'{}','{}'),
  ('lizard',2,'experimente','Experimente',36,'{}','{}'),
  ('lizard',3,'chief','Chef d\'équipe',48,'{}','{}'),
  ('lizard',4,'boss','Patron',0,'{}','{}')
;
