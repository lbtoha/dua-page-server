FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY prisma ./prisma
COPY dua_main.sqlite .


COPY . .

RUN npx prisma generate

EXPOSE 5000

CMD ["npm", "run", "dev"]
