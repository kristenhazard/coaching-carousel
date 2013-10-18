module PfrImport

  class ImportAllCoaches
    def initialize

    end

    def get_coaches
      agent = Mechanize.new
      list_of_coaches = agent.get('http://www.pro-football-reference.com/coaches/')
      coach_table = list_of_coaches.search('#coaches')
      coach_rows = coach_table.search('tbody tr')
      coach_rows.each do |row|
        coach_td = row.search('td')[1]
        name = coach_td.text.strip unless coach_td.blank?
        unless name.nil?
          relative_url = coach_td.at('a')['href']
          base_url = URI.join('http://www.pro-football-reference.com/coaches',relative_url)
          import = PfrImport::ImportSingleCoach.new(name,base_url)
          import.get_and_save_coaching_history
        end
      end
    end
  end

  class ImportSingleCoach
    def initialize(name,url)
      @name = name
      @url = url
    end

    def get_and_save_coaching_history
      coach = @name
      agent = Mechanize.new
      page = agent.get(@url)
      coaching_history_rows = page.search('#coaching_history tbody tr')
      coaching_history_rows.each do |row|
        coaching_history_tds = row.search('td')
        year = coaching_history_tds[0].text.strip unless coaching_history_tds[0].nil?
        age = coaching_history_tds[1].text.strip unless coaching_history_tds[1].nil?
        level = coaching_history_tds[2].text.strip unless coaching_history_tds[2].nil?
        employer = coaching_history_tds[3].text.strip unless coaching_history_tds[3].nil?
        role = coaching_history_tds[4].text.strip unless coaching_history_tds[4].nil?
        if SourceDataPfr.where("coach = ? AND year = ?", coach, year).size.eql? 0
          SourceDataPfr.create(
            :coach => coach,
            :year => year,
            :age => age,
            :level => level,
            :employer => employer,
            :role => role
          )
        end
      end
    end
  end

  def dennis_allen
    coach = "Dennis Allen"
    page = agent.get('http://www.pro-football-reference.com/coaches/AlleDe0.htm')
    coaching_history_rows = page.search('#coaching_history tbody tr')
    coaching_history_rows.each do |row|
      coaching_history_tds = row.search('td')
      year = coaching_history_tds[0].text.strip unless coaching_history_tds[0].nil?
      age = coaching_history_tds[1].text.strip unless coaching_history_tds[1].nil?
      level = coaching_history_tds[2].text.strip unless coaching_history_tds[2].nil?
      employer = coaching_history_tds[3].text.strip unless coaching_history_tds[3].nil?
      role = coaching_history_tds[4].text.strip unless coaching_history_tds[4].nil?
      if SourceDataPfr.where("coach = ? AND year = ?", coach, year).size.eql? 0
        SourceDataPfr.create(
          :coach => coach,
          :year => year,
          :age => age,
          :level => level,
          :employer => employer,
          :role => role
        )
      end
    end
  end

  class ImportFromHoldingTable
    def initialize
    end

    def import_to_models
      SourceDataPfr.all.each do |row|
        coach = row.coach
        year = row.year
        age = row.age
        level = row.level
        team = row.employer
        role = row.role

        # does coach exist already
        c = Coach.where("name = ?", coach).first

        if c.nil?
          c = Coach.create(:name => coach)
        end

        # does team exist already
        t = Team.where("name = ? AND level = ?", team, level).first

        if t.nil?
          t = Team.create(:name => team, :level => level)
        end

        # does the team coach mapping exist
        ct = CoachEmployment.where("coach_id = ? AND team_id = ? AND year = ?", c.id, t.id, year).first

        if ct.nil?
          ct = CoachEmployment.create(:coach_id => c.id, :team_id => t.id, :year => year, :role => role, :age => age)
        end

      end
    end

  end

end