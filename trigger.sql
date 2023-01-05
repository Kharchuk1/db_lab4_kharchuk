-- тригер, який при додаванні нового рядка в таблицю Team записує значення поля team_nam у верхньому регістрі

-- Перший етап: створення тригерної функції
CREATE OR REPLACE FUNCTION upper_team_name() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE team 
          SET team_name = upper(team_name) WHERE team.team_id = NEW.team_id; 
		  RETURN NULL;
     END;
$$;

-- Другий етап: створення тригеру
CREATE TRIGGER team_insert 
AFTER INSERT ON team
FOR EACH ROW EXECUTE FUNCTION upper_team_name()