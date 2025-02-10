STACK:
ruby: 3.3.6
gem "rails", "~> 8.0.1"
gem "puma", ">= 5.0"
gem "pg", "~> 1.1"
Import Maps + Stimulus
    Import Maps carrega Stimulus e outras bibliotecas, enquanto Stimulus adiciona comportamento dinâmico à aplicação.
---------------------/

rails new grow_opp_ -d postgresql

(alterar database.yml)

rails db:create

Clients:
rails generate scaffold Clients cnpj:string company_name:string email:string phone:string country:string state:string city:string address:string address_number:string

User:
/-----------------/

Products:
rails generate scaffold Products type:string description:string price:decimal status:boolean license:integer

Company:
rails g scaffold Company company_name:string cnpj:string phone:string address:string address_number:integer country:string state:string city:string

Contacts:
rails g scaffold Contact first_name:string last_name:string phone:string email:string company:id

    CompanyContacts:



Opportunity:
rails g scaffold Opportunity title:string description:text

    Quote:
    rails g scaffold Quote opportunity:references total_price:decimal

    SalesOrder:
    rails g scaffold SalesOrder opportunity:references total_price:decimal

    Contract:
    rails g scaffold Contract opportunity:references total_price:decimal

        OpportunityProduct (Produtos na Oportunidade):
        rails generate model OpportunityProduct opportunity:references product:references quantity:integer price:decimal subtotal_price:decimal

        QuoteProduct (Produtos no Orçamento):
        rails generate model QuoteProduct quote:references product:references quantity:integer price:decimal subtotal_price:decimal total_:_price:decimal

        SalesOrderProduct (Produtos no Pedido):
        rails generate model SalesOrderProduct sales_order:references product:references quantity:integer price:decimal subtotal_price:decimal total_price:decimal

        ContractProduct (Produtos no Contrato):
        rails generate model ContractProduct contract:references product:references quantity:integer price:decimal subtotal_price:decimal total_price:decimal


TaxRegime:
rails generate scaffold TaxRegime tax_regime_name:string status:boolean

Plan:
rails generate scaffold Plan plan_name:string status:boolean plan_duration:integer plan_price:decimal

Stage:
rails generate scaffold Stage stage_name:string status:boolean

City e State:
rails generate model State name:string
rails generate model City name:string state:references
rails generate controller States
rails generate controller Cities

Segment e SubSegment:

rails g scaffold SubSegment sub_segment_name:string status:boolean segment:references
rails g scaffold Segment segment_name:string status:boolean


Brand:



Próximos passos:

Quero adequar a view e controller de opportunities new, show, edit que são renderizações do _form.html.erb apresentem outras informações:

A) No topo da página, gerar um registro de id (o próximo número único não existente na tabela opportunities. Para opportunities criadas (new, create) gerar um novo id e registrá-lo na tabela opportunities assim que salvo.

B) Informações de contato:
Nome:
(para buscar em tempo real e a cada caractere digitado buscar no campo first_name e last_name da tabela contacts e aparecer como dropdown) (salvar o id desse contact no campo 'contact_id' da tabela relacionada opportunity_contact.)

C) Empresa:
(para buscar em tempo real e a cada caractere digitado buscar no campo cnpj e company_name da tabela company e aparecer como dropdown) (salvar isso no campo 'company_id' da tabela relacionada opportunity_company.)

D)Produtos:
(Criar arquivo _opportunity_products.html.erb com uma tabela com as seguintes colunas:
1) Produto:
(para buscar em tempo real e a cada caractere digitado buscar no campo description e product_brand e da tabela company e aparecer como dropdown) (salvar isso no campo 'company_id' da tabela relacionada opportunity_company.)

2) Preço unitário (price):
(para buscar em tempo real e a cada caractere digitado buscar no campo price e da tabela products e aparecer como dropdown)

3) Quantidade (quantity):
O usuário insere manualmente a quantidade de produtos e o valor é salvo na tabela OpportunityProduct

4) Sub Total (sub_total):
(salvar no campo sub_total da tabela opportunity_products)

E) Botão SALVAR (para new>create, para edit>update)

E) Brands:

Cliente na edit e new não deve ser setado e sim relacionar ao usuário logado, a qual cliente ele pertence. Mas isso só será possível mediante autenticação.

-------------
melhorias:

- No cadastro de contacts, corrigir a busca em tempo real dropdown por CNPJ ou company_name na tabela companies e salvar este dado no company_id da tabela contacts (uma FK da tabela companies)

A busca da empresa na view de opp:
- fazer um preenchimento automático da empresa na qual o contato está cadastrado
Hoje está como busca

- O campo de busca de product em opportunity deve salvar isso no campo 'product_id' da tabela relacionada opportunity_company.). Um produto por linha, relacionando à mesma opportunity_id