# Informações para da start na aplicação

 Sempre que precisar limpar os artefatos dos containers
```
./docker-clean.sh
```
Copia o .env
```
cp .env_example .env
```
Caso você precise da permissão para o entrypoint.sh
```
chmod +x entrypoint.sh
```
Caso você tenha problemas com a permissão do entrypoint.sh, use de forma manual 

Subir App Docker
```
docker-compose up -d
```
Criar Banco de Dados
```
docker-compose run app  rails db:create
```

Fazer Migracao
```
docker-compose run app  rails db:migrate
```
Rodar as Permissiões
```
sudo chmod -R 777 app
```
```
sudo chmod -R 777 postgres
```

```
docker-compose run app  rails credentials:edit RAILS_ENV=development
```
Caso precise roda o build do projeto
```
docker-compose up --build
```

Para executar os teste 
```
docker-compose run app bundle exec rspec # "isso irá roda todo o teste"
```
Isso irá roda um arquivo especifico
```
docker-compose run app bundle exec rspec ./spec/path/file_spec.rb
```

Acesso a API 
```
localhots:8181
```
Collecation Postman

[Collecaction](https://github.com/hemershon)
