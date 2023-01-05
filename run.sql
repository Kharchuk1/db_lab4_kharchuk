-- виклик функції get_team()
select get_team('2')

-- виклик функції get_team()
call get_player('Steven Adams')

-- перевірка роботи тригера, задаємо нові дані
INSERT INTO team(team_id, team_name) VALUES ('8', 'npi')
DELETE FROM team where team_id = '8'

select * from team