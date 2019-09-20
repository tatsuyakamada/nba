require 'csv'

csv_data = CSV.read('db/teams.csv', 'r:BOM|UTF-8')
csv_data.each do |row|
  Team.create(id: row[0],
              team_name: row[1],
              establishment: row[2],
              home_court: row[3],
              owner: row[4],
              division_id: row[5])
end
