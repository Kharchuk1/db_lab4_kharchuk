-- функція get_team(team_arg), яка виводить назву команди по його id

DROP FUNCTION IF EXISTS get_team(int)
CREATE OR REPLACE FUNCTION get_team(team_arg int) 
    RETURNS TABLE (team_id int, team_name varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT team.team_id::int, team.team_name::varchar
		FROM team
		WHERE team.team_id = team_arg;
END;
$$