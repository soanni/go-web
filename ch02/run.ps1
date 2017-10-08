docker run -d `
          --name go-web-chitchat `
	      --cpu-percent "75" `
	      -m 1GB `
	      --ip 172.17.125.245 `
          -p 8000:8000 go-web/chitchat:0.1