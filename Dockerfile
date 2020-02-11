# base image
FROM node:12.14.1

# install chrome for protractor tests
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# RUN apt-get update && apt-get install -yq google-chrome-stable

# Create and Change the working directory where our app will be placed and where our commands will run
RUN mkdir -p /app
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
# RUN npm install
# RUN npm install -g @angular/cli@8.3.25
# RUN npm install -g @angular-devkit/architect
# RUN npm install -g @angular-devkit/build-angular
# RUN npm install -g @angular-devkit/build-optimizer
# RUN npm install -g @angular-devkit/build-webpack
# RUN npm install -g @angular-devkit/schematics
# RUN npm install -g @ngtools/webpack
# RUN npm install -g @schematics/angular
# RUN npm install -g @schematics/update
# RUN npm install -g rxjs
# RUN npm install -g typescript
# RUN npm install -g webpack

# add app
COPY . /app

# start app
# CMD ng serve --host 0.0.0.0

# add app
COPY . /app

# Expose the port the app runs in
EXPOSE 4200

# start app
CMD ["npm", "start"]