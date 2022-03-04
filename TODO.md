# CaveDB To-do List
A rough list of tasks to complete for the project.

## Project initialisation
- [X] Set up pre-commit hooks for Black and flake8
- [X] Initial cleanup of Django files using the above
- [X] Set up Docker development environment

## Models
- [X] Create model for a Cave
- [X] Create model for a System
- [X] Create model for a District
- [ ] Create model for a Trip
- [X] Create model for a Club
- [X] Create model for a Caving Body
- [X] Create model for a Country


### Cave Model
#### Fields
- [X] ID (IntegerField) (Unique) (PK)
- [X] Name (CharField) (Unique)
- [X] Added on (DateTimeField)
- [X] Last updated (DateTimeField)
- [X] District (ForeignKey)
- [X] System (ForeignKey) (Can be blank)
- [X] Location (CharField)
- [X] Latitude (DecimalField) (Can be blank)
- [X] Longitude (DecimalField) (Can be blank)
- [X] Length in metres (IntegerField) (Can be blank)
- [X] Depth in metres (IntegerField) (Can be blank)
- [X] Wikipedia link (CharField) (Can be blank)
- [X] Caving body (ForeignKey) (Can be blank)
- [X] Website (URLField) (Can be blank)
- [X] Description (TextField) (Can be blank)


### System Model
#### Fields
- [X] ID (IntegerField) (Unique) (PK)
- [X] Name (CharField) (Unique)
- [X] Added on (DateTimeField)
- [X] Last updated (DateTimeField)
- [X] District (ForeignKey)
- [X] Location (CharField)
- [X] Latitude (DecimalField) (Can be blank)
- [X] Longitude (DecimalField) (Can be blank)
- [X] Length in metres (IntegerField) (Can be blank)
- [X] Depth in metres (IntegerField) (Can be blank)
- [X] Wikipedia link (CharField) (Can be blank)
- [X] Caving body (ForeignKey) (Can be blank)
- [X] Website (URLField) (Can be blank)
- [X] Description (TextField) (Can be blank)

#### Methods
- [ ] Caves in system


### Caving Body
#### Fields
- [X] Name (CharField) (Unique)
- [X] Country (ForeignKey)
- [X] District (ForeignKey) (Can be blank)


### District
#### Fields
- [X] ID (CharField) (Unique) (PK)
- [X] Name (CharField) (Unique)
- [X] Country (ForeignKey)
- [ ] Caving Body (ForeignKey) (Can be blank)
- [X] Website (URLField) (Can be blank)
- [X] Wikipedia (URLField) (Can be blank)
- [X] Description (CharField)


### Country
#### Fields
 - [X] ID (CharField) (Unique)
 - [X] Name (CharField) (Unique)
 - [ ] Caving Body (ForeignKey) (Can be blank)


### Club
#### Fields
- [X] Name (CharField) (Unique)
- [X] District (ForeignKey)
- [X] Caving Body (ForeignKey) (Can be blank)
- [X] Location (CharField)
- [X] Website (CharField)
- [X] Description (TextField)


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
