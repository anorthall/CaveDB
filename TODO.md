# CaveDB To-do List
A rough list of tasks to complete for the project.

## Project initialisation
- [X] Set up pre-commit hooks for Black and flake8
- [X] Initial cleanup of Django files using the above
- [X] Set up Docker development environment
- [X] Create Docker development environment that responds actively to code changes
- [X] Export test database and allow easy reload of test data
- [ ] Create Docker production environment
- [ ] Create basic unit tests
- [ ] Set up test workflows on GitHub

## Feature implementations
- [X] Create a list of Countries and their Regions
- [X] Create a list view that shows Caves and Systems within Regions
- [ ] Create a list view for Clubs
- [ ] Make list views sortable
- [X] Create a homepage with an introduction and recent updates
- [X] Combine cave/system template into one template to reduce duplication
- [ ] Add validation of region/country
- [ ] Create a method to report errors, or suggest corrections/new caves
- [ ] Add an about page with notes on data sourcing and use
- [ ] Implement trip logging
- [ ] Add a section for surveys on Caves and Systems
- [ ] Add photos to Cave/System pages
- [X] Add Google Maps links to Lat/long

## Models
- [X] Create model for a Cave
- [X] Create model for a System
- [X] Create model for a Region
- [ ] Create model for a Trip
- [X] Create model for a Club
- [X] Create model for a Caving Body
- [X] Create model for a Country

### Trip
#### Fields
- [ ] ID (CharField) (Unique)
- [ ] Cave (ForeignKey)
- [ ] Type of trip (CharField)
    - Sporting
    - Digging
    - Survey
    - Bolting
    - Conservation
    - Diving
    - Other

- [ ] Trip start (DateTimeField)
- [ ] Trip end (DateTimeField)
- [ ] Club (ForeignKey) (Can be blank)
- [ ] Cavers (TextField) (Can be blank)
- [ ] Route (TextField) (Can be blank)
- [ ] Distance covered in metres (IntegerField) (Can be blank)
- [ ] Vertical distance covered in metres (IntegerField) (Can be blank)
- [ ] Trip notes (TextField) (Can be blank)

#### Methods
- [ ] Trip duration in minutes
