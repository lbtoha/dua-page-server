import { Server } from "http";
import app from "./app";

async function main() {
  const server: Server = app.listen(process.env.PORT, () => {
    console.log("Sever is running on port ", process.env.PORT);
  });

  const exitHandler = () => {
    if (server) {
      server.close(() => {
        console.info("Server closed!");
      });
    }
    process.exit(1);
  };
  process.on("uncaughtException", (error) => {
    console.log(error);
    exitHandler();
  });

  process.on("unhandledRejection", (error) => {
    console.log(error);
    exitHandler();
  });
}

main();
