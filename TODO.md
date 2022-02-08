# CaveLog To-do List
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
- [ ] ID
- [ ] Name
- [ ] District (ForeignKey)
- [ ] System (ForeignKey)
- [ ] Location
- [ ] Lat/long
- [ ] Length
- [ ] Wikipedia link
- [ ] Caving body link
- [ ] Description

### System Model
#### Fields
- [ ] ID
- [ ] Name
- [ ] District (ForeignKey)
- [ ] Location
- [ ] Lat/long
- [ ] Length
- [ ] Wikipedia link
- [ ] Caving body link
- [ ] Description

#### Methods
- [ ] Caves in system


### District
#### Fields
- [ ] ID
- [ ] Name
- [ ] Country
- [ ] Location
- [ ] Description


### Trip
#### Fields
- [ ] ID
- [ ] Cave (ForeignKey)
- To be continued...