CURRENT_DIR:= ${CURDIR}
NAME=hoge

build:
	docker build ./docker -t ${NAME}

run: create start

create:
	docker create -it -v $(CURRENT_DIR)/src:/home/my-app -p 8080:8080 --name ${NAME} ${NAME}

start:
	docker start ${NAME}
	docker attach ${NAME}

rm:
	docker stop ${NAME}
	docker rm ${NAME}

rmi: rm
	docker rmi ${NAME}
