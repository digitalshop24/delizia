## Запуск проекта
- `cp config/application_sample.yml config/application.yml`
- изменить конфиги на необходимые в `config/application.yml`
- `bundle` - установить необходимые гемы
- `rake db:create db:migrate db:seed` - создать БД и таблицы
- `rails s`

## Deploy
`cap production deploy`
