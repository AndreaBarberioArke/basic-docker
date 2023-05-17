#base image
FROM node:16-alpine
#create that directory 
RUN mkdir -p /usr/app
#allows us to define the current working directory
WORKDIR /usr/app

# copy everything from the current next pages into our dockerr images working directory 
COPY ./ ./ 
# DOTS REPRESENTING THE PATH FROM WHERE I WANT TO COPY AND WHICH PATH I WANT TO COPY


# this will create, in the file system of the image a .next folder
RUN npm install 
RUN npm run build

#once our command serie is done, we need to expose a port to let the app being accessible using EXPOSE COMMAND so this container will use it 

EXPOSE 3000   

# as last step define entry point for any containers that will be created using this image definition 
#for that we are using CMD Command, which we will define as npm start to start our application, so

CMD ["npm", "start"]


# then we need to use a docker command to build our container 
# docker build -t(-t serve a dare un nome che sarà quello che segue il flag) nextjs-basic (l'altro parametro di cui ha bisogno il docker engine è il percorso)
# dove è presente l'app, quindi dall'ide se abbiamo già puntato il file giusto avremo bisogno di scrivere ./

# so command is:       docker build -t nextjs-basic ./ 