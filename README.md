# docker-compose postgres13.4 alpine
<h2>Docker postgres</h> 
<br/>
<p>
Faça Download clique no link  <a href="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe">Docker Destop Windows</a>
instale o docker
</p>
<br/>
Faça Clone do projeto para diretorio bases<br/>
abra um terminal no Windows<br/>
tecla windows+R <br/>
Digite CMD  Ok <br/>
crie os diretorio<br/>
mkdir  %userprofile%\Projetos\docker<br/>
entre nele <br/>
cd  %userprofile%\Projetos\docker<br/><br/>

git clone https://github.com/mrlsoares/postgres10.git bases<br/><br/>

cd bases <br/>
renomeie  o arquivo .env-exemplo para .env<br/>
rename .env-exemplo .env<br/>

Edit .env e Altere variáveis de ambiente <br/>
notepad .env <br/><br/>
Grave as alteraçoes precionando as teclas CTRL+S <br/>

crie uma rede para uso do docker<br/>
docker network create ansata_net<br/><br/>
para subir o serviço<br/>
docker-compose up -d

