-- процедура get_player(id_arg), яка надає інформацію про гравця за його іменем

DROP PROCEDURE IF EXISTS get_player(varchar(50));
CREATE OR REPLACE PROCEDURE get_player(name_arg varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE record_id player.player_id%TYPE;
DECLARE record_name player.player_name%TYPE;
DECLARE record_poss player.poss%TYPE;
DECLARE record_team_id player.team_id%TYPE;

BEGIN
    SELECT player_id, player_name, poss, team_id into record_id, record_name, record_poss, record_team_id FROM player WHERE player_name = name_arg;
    RAISE INFO 'player_id: %,  player_name: %, poss: %, team_id: %', TRIM(record_id), TRIM(record_name), TRIM(record_poss), record_team_id;
END;
$$