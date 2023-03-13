require "ostruct"
module Github
  class RepoSearchService

    GITHUB_ENDPOINT="https://api.github.com/search/repositories?q="

    def self.search(repo_name)
      response = RestClient.get("#{GITHUB_ENDPOINT}#{repo_name}", headers={})
      if response.code == 200
       repos = JSON.parse(response.body)["items"]
       construct_repo_object(repos)
      else 
        "Service Unavailable"
      end
    end

    def self.construct_repo_object(repos)
        repos.map do |repo|
            OpenStruct.new(repo)
        end
    end
    
  end
end