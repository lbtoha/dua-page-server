import express from "express";
import { duasRoutes } from "../modules/Duas/Duas.routes";

const router = express.Router();

const moduleRoutes = [
  {
    path: "/",
    route: duasRoutes,
  },
];

moduleRoutes.forEach((route) => router.use(route.path, route.route));

export default router;
