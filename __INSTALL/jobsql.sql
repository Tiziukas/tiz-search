INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lawyer', 'Lawyer', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lawyer', 'Lawyer', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lawyer', 'Lawyer', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lawyer',0,'lawyer1','1',20,'{}','{}'),
	('lawyer',1,'lawyer2','2',40,'{}','{}'),
	('lawyer',2,'lawyer3','3',60,'{}','{}'),
	('lawyer',3,'boss','4',80,'{}','{}')
;

INSERT INTO `jobs` (name, label) VALUES
	('lawyer','Lawyer')
;
