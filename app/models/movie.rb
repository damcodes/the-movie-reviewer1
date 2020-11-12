require 'net/http'
class Movie < ApplicationRecord
    #belongs_to :director
    #has_many :actors, through: :role
    has_many :reviews
    has_many :users, through: :reviews

    def self.get_movies(title, year=nil)
        title = title.split(' ').join('%20')
        if year
          year = year.to_s
          url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?s=#{title}&page=1&y=#{year}&r=json")
        else
          url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?s=#{title}&page=1&r=json&type=movie")
        end
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = 'edbb9a96b4mshb3e7818223626c1p1fe43cjsn140bf1245030'
        request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
        response = http.request(request)
        hash = JSON.parse(response.read_body)["Search"]
    end

    def self.get_movie_details(id)
        url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{id}&r=json&plot=full")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = 'edbb9a96b4mshb3e7818223626c1p1fe43cjsn140bf1245030'
        request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
        response = http.request(request)
        movie_hash = JSON.parse(response.read_body)
        %w"Writer Language Country Awards Ratings Metascore imdbRating imdbVotes Type DVD BoxOffice Website Response".each { |x| movie_hash.delete(x)}
        movie_hash = movie_hash.each_with_object({}) { |(k, v), hash| hash[k.downcase] = v }
        movie_hash.symbolize_keys!
    end
end
