$volume="C:\Users\soanni\Documents\go-web\ch02\chitchat\db-data"
#docker run -d `
#          -v $volume`:'C:\sql' `
#	      --cpu-percent "75" `
#	      -m 4GB `
#	      --ip 172.17.125.244 `
#         -p 5432:5432 go-web/pgsql:9.6.4-1

docker run -d `
          --name go-web-pgsql `
	      --cpu-percent "75" `
	      -m 4GB `
	      --ip 172.17.125.244 `
          -p 5432:5432 mustiks/postgres-windows