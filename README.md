# README
HINT: i know this task dosn't require Rails but i added the framework
requirements:
- docker
- docker compose already installed on your machine

after clone the repo:
- cd ..../the_project_directory/
- docker-compose up --build
- docker-compose exec web bash
- rails db:create
- hit : http://localhost:3000/ 
- search any repos you want :)

to Run the specs
- docker-compose exec web bash
- bundle exec rspec
