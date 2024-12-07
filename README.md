# Simple Wallet Transaction System

version: 1.0.0 by Rendy Reynaldy A.

## Features
- Login with JWT
- Top-up, Withdraw, Transfer transactions
- At the end of the day or at 23:00 everyday, all the account wallets will be recalculate to update the balance by looking all transactions.

## Tech Used
- [Ruby on Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)

## Installation
- Download or clone this repository
- Go to project root directory & run this command for installing dependencies:
```sh
bundle install
```
- Adjust the database config in:
```sh
config/database.yml
```
- My database configs are:
```sh
host: localhost
port: 5432
username: postgres
password: password
database: ror_test_atask
```
- create your database with the name based on config
- run this command to migrate database:
```sh
rails db:migrate
rails db:seed
```
- after migration successfull, run this command to run the server in your local machine:
```sh
rails s
```
- By default the url will be: <code>localhost:3000</code>

## Postman Collection
- [Link to Postman Collection & Environment](https://drive.google.com/drive/folders/1KBslOWESYZikYdIXS2w1d5sOvPK78cYA?usp=drive_link)
