# Use uma imagem Ruby oficial como base
FROM ruby:3.3.6

# Instale dependências do sistema
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    wget \
    gnupg2

# Adicione o repositório oficial do PostgreSQL para Debian 12 (Bookworm)
RUN echo "deb http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Atualize os pacotes e instale o cliente PostgreSQL 16
RUN apt-get update && apt-get install -y postgresql-client-16

# Configure o diretório de trabalho
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para instalar as gems
COPY Gemfile Gemfile.lock ./

# Instale as gems
RUN gem install bundler && bundle install

# Copie o restante do código da aplicação
COPY . .

# Exponha a porta padrão do Rails
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]