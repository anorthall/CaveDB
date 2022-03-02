# CaveDB To-do List
A rough list of tasks to complete for the project.



## Project initialisation
- [ ] Set up pre-commit hooks for Black and flake8
- [ ] Initial cleanup of Django files using the above
- [ ] Set up Docker development environment



## Models
- [ ] Create model for a Cave
- [ ] Create model for a System
- [ ] Create model for a District
- [ ] Create model for a Trip



### Cave Model
#### Fields
- [ ] ID (CharField) (Unique)
- [ ] Name (CharField) (Unique)
- [ ] Added on (DateTimeField)
- [ ] Last updated (DateTimeField)
- [ ] District (ForeignKey) 
- [ ] System (ForeignKey) (Can be blank)
- [ ] Location (CharField)
- [ ] Lat/long (CharField) (Can be blank)
- [ ] Length in metres (IntegerField) (Can be blank)
- [ ] Wikipedia link (CharField) (Can be blank)
- [ ] Caving body link (CharField) (Can be blank)
- [ ] Description (TextField) (Can be blank)



### System Model
#### Fields
- [ ] ID (CharField) (Unique)
- [ ] Name (CharField) (Unique)
- [ ] District (ForeignKey)
- [ ] Location (CharField)
- [ ] Lat/long (CharField) (Can be blank)
- [ ] Length in metres (IntegerField) (Can be blank)
- [ ] Wikipedia link (CharField) (Can be blank)
- [ ] Caving body link (CharField) (Can be blank)
- [ ] Description (TextField) (Can be blank)

#### Methods
- [ ] Caves in system



### District
#### Fields
- [ ] ID (CharField) (Unique)
- [ ] Name (CharField) (Unique)
- [ ] Country (CharField)
- [ ] Description (CharField)



### Club
#### Fields
- [ ] ID (CharField) (Unique)
- [ ] Name (CharField) (Unique)
- [ ] Website (CharField)
- [ ] District (ForeignKey)
- [ ] Hut location (CharField)
- [ ] Description (TextField)



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
