# CaveDB
A Django application to display a database of caves in the UK, and later internationally.

The application is also envisioned to allow logging of caving trips, with a public profile for each user
displaying their most recent trips.

## Development setup
The development environment runs within Docker via gunicorn, nginx, and postgresql. Test data is pre-loaded
into the database at the build stage and files are hot-reloaded based on modifications to the code.

### Set up instructions
1) Clone the repository: `git clone git@github.com:anorthall/CaveDB.git`
2) Enter the repository directory: `cd CaveDB`
3) Build the docker container: `export DOCKER_BUILDKIT=1; docker-compose build`
4) Run the docker container: `docker-compose up`
5) The server will now be running on http://127.0.0.1:8000
6) If you wish to repopulate the test data, run `docker-compose down -v` to delete the database volume,
then relaunch the container
