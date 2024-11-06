#Imagem
FROM python:3.13.0
#Diretorio para trabalhar no projeto
WORKDIR /app
#Faço uma cópia das requirements
COPY requirements.txt .
#Rodo o comando do python para baixar as dependências do projeto
RUN pip install -r requirements.txt
#Faço uma cópia de tudo para o diretório do projeto que criei lá em cima [WORKDIR: /app]
COPY . /app/
#Porta que vai rodar a aplicação
EXPOSE 5000
#Comando para ser executado na hora da criação do container.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
