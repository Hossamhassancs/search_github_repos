require 'spec_helper'
describe Github::RepoSearchService do
    let(:github_repo_search) {"https://api.github.com/search/repositories?q=blog"}
    let(:response) do
      {"items": [
        {
            "id": 156704256,
            "node_id": "MDEwOlJlcG9zaXRvcnkxNTY3MDQyNTY=",
            "name": "Spring-Boot-Blog-REST-API",
            "full_name": "osopromadze/Spring-Boot-Blog-REST-API",
            "private": false
        }
      ]
    }.to_json
    end
    let(:result) do
       OpenStruct.new({
            "id": 156704256,
            "node_id": "MDEwOlJlcG9zaXRvcnkxNTY3MDQyNTY=",
            "name": "Spring-Boot-Blog-REST-API",
            "full_name": "osopromadze/Spring-Boot-Blog-REST-API",
            "private": false
        })
    end
    
    before do
      stub_request(:get, /api.github.com/).to_return(status: 200, body: response)
    end
    
    describe "search repo" do
      it "search for blog" do 
        expect(described_class.search("blog")).to eq(result)
      end
    end
end