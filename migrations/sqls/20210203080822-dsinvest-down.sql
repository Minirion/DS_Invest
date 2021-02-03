-- disable FOREIGN KEYS check to "FALSE" in order to delete tables of DATABASE
SET FOREIGN_KEY_CHECKS = 0;

-- delete all tables
DROP TABLE IF EXISTS comment; 
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS user;

-- set FOREIGN KEYS check to "TRUE" as defined in Default
SET FOREIGN_KEY_CHECKS = 1;