require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :username, :body, :posted_on

  def initialize(id:, username:, body:, posted_on:)
    @id = id
    @username = username
    @body = body 
    @posted_on = posted_on
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        username: peep['username'], 
        body: peep['body'], 
        posted_on: peep['posted_on']
      )
    end
  end

  
end
