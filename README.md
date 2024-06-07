### Hexlet tests and linter status:
[![Actions Status](https://github.com/Kadina1988/rails-project-65/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Kadina1988/rails-project-65/actions)

Setup:
```
sudo service postgresql start
rails db:migrate
rails s
```

Проект Hexlet 'Доска объявлений'.
В проекте имеется пользовательская часть, и админка.

Пользователь может добавлять обьявления и отправлять их на модерацию.
Функции администратора: рассматривать объявления на модерации, опубликоввывать, возвращать,
или отправлять объявления в архив.Так же админ создает, редактирует и удаляет категории
Регистрация и аутенфикация происходит через Github

Использованы гемы:
```
gem 'aasm', '~> 4.10'
gem 'active_storage_validations'
gem 'kaminari'
gem 'omniauth-github', '~> 2.0.0'
gem 'omniauth-rails_csrf_protection'
gem 'pundit', github: 'varvet/pundit'
gem 'rails-i18n'
gem 'ransack'
gem 'sass-rails'
gem 'simple_form'
```

