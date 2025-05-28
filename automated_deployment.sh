
#! /bin/bash

DIRECTORY="<WORKSPACE_LOCATION>"
PROJECT="<PROJECT_NAME>"
CONTAINER=<CONTAINER_NAME>
IMAGE_ID=<IMAGE_NAME>
IMAGE_TAG=<IMAGE_TAG>
BACKUP_IMAGE="${IMAGE_ID}-bkp:${IMAGE_TAG}-backup"
CONTAINER_PORT=<CONTAINER_PORT>
SOURCE_PORT=<PROJECT_PORT>
LOG_EXPORTER_PATH="<LOG_EXPORTING_PATH>"
CONATINER_PATH="<CONTAINER_PATH>"

cd $DIRECTORY

echo "Checking Right Path for project ...." && pwd

echo "Validating Existing Containers -- [${CONTAINER}] ...."

docker container inspect "${CONTAINER}" >/dev/null 2>&1 && EXISTS=yes || EXISTS=no
echo "IS EXISTS? ${EXISTS}."
if [ $EXISTS = yes ]
then
	echo "container -- [${CONTAINER}] already exists. Removing existing container..... Please wait" && docker stop "${CONTAINER}" && docker rm "${CONTAINER}"
	docker ps -a
	docker image inspect "${IMAGE_ID}:${IMAGE_TAG}" >/dev/null 2>&1 && SUCCESS=yes || SUCCESS=no
	
	echo "IS SUCCESS? ${SUCCESS}."
	if [ $SUCCESS = yes ]
	
	then
		echo "Image already exists ... " && docker images 
		echo "Taking Backup of Last Deployed Image ..."
		docker image inspect $BACKUP_IMAGE  >/dev/null 2>&1 && BACKUP=yes || BACKUP=no
		echo "IS BACKUP AVAILABLE? ${BACKUP}."
		if [ $BACKUP = yes ]

		then
			echo "Previous Backup Available. Removing Previous Backup File $BACKUP_IMAGE ."
			docker rmi -f $BACKUP_IMAGE
			docker tag "${IMAGE_ID}:${IMAGE_TAG}" $BACKUP_IMAGE
			echo "${BACKUP_IMAGE} Backup Created."
		else
			echo "Previous Backup Not Available."
			docker tag "${IMAGE_ID}:${IMAGE_TAG}" $BACKUP_IMAGE
			echo "${BACKUP_IMAGE} Backup Created."
		fi
		
		echo "Removing existing image ... " && docker rmi -f "${IMAGE_ID}:${IMAGE_TAG}"
		cd $DIRECTORY/$PROJECT
		echo "Creating New Image of ${IMAGE_ID}:${IMAGE_TAG} ... "  && docker build -t "${IMAGE_ID}:${IMAGE_TAG}" . && docker images
    	
	else
		echo "No Images Found with name -- [${IMAGE_ID}:${IMAGE_TAG}]. Processing new image creation..... Please wait" && docker images
		cd $DIRECTORY/$PROJECT
		echo "Creating New Image of ${IMAGE_ID}:${IMAGE_TAG} ... "  && docker build -t "${IMAGE_ID}:${IMAGE_TAG}" . && docker images
    	
	fi
    	
	echo "Creating Docker container -- [${CONTAINER}]. Please wait......."
    	docker run -d -it --name ${CONTAINER} -v $LOG_EXPORTER_PATH:$CONATINER_PATH -p $CONTAINER_PORT:$SOURCE_PORT "${IMAGE_ID}:${IMAGE_TAG}" &&  docker ps -a

else
    	echo "No Containers Found with name -- [${CONTAINER}]. Processing new Container creation..... Please wait"
    	docker image inspect "${IMAGE_ID}:${IMAGE_TAG}" >/dev/null 2>&1 && SUCCESS=yes || SUCCESS=no
	
	echo "IS SUCCESS? ${SUCCESS}."
	if [ $SUCCESS = yes ]
    	
	then
		echo "Image ${IMAGE_ID}:${IMAGE_TAG} already exists ... " && docker images
                echo "Taking Backup of Last Deployed Image ..."
                docker image inspect $BACKUP_IMAGE  >/dev/null 2>&1 && BACKUP=yes || BACKUP=no
                echo "IS BACKUP AVAILABLE? ${BACKUP}."
                if [ $BACKUP = yes ]

                then
                        echo "Previous Backup Available. Removing Previous Backup File $BACKUP_IMAGE ."
                        docker rmi -f $BACKUP_IMAGE
                        docker tag "${IMAGE_ID}:${IMAGE_TAG}" $BACKUP_IMAGE
                        echo "${BACKUP_IMAGE} Backup Created."
                else
                        echo "Previous Backup Not Available."
                        docker tag "${IMAGE_ID}:${IMAGE_TAG}" $BACKUP_IMAGE
                        echo "${BACKUP_IMAGE} Backup Created."
                fi

		echo "Removing existing image ... " && docker rmi -f "${IMAGE_ID}:${IMAGE_TAG}"
		cd $DIRECTORY/$PROJECT
                echo "Creating New Image of ${IMAGE_ID}:${IMAGE_TAG} ... "  && docker build -t "${IMAGE_ID}:${IMAGE_TAG}" . && docker images
    	else
		echo "No Images Found with name -- [${IMAGE_ID}:${IMAGE_TAG}]. Processing new image creation..... Please wait" && docker images
		cd $DIRECTORY/$PROJECT
                echo "Creating New Image of ${IMAGE_ID}:${IMAGE_TAG} ... "  && docker build -t "${IMAGE_ID}:${IMAGE_TAG}" . && docker images
    	fi
    	echo "Creating Docker container -- [${CONTAINER}]. Please wait......."
    	docker run -d -it --name ${CONTAINER} -v $LOG_EXPORTER_PATH:$CONATINER_PATH -p $CONTAINER_PORT:$SOURCE_PORT "${IMAGE_ID}:${IMAGE_TAG}" &&  docker ps -a
fi

echo -e "\nThank You for Your Patience, Your Deployment is SUCCESS.\n\nRegards\nKinnar Chowdhury, Sr. DevOps Engineer\nMSQUBE Technology Solutions Private Limited.\n"
date
