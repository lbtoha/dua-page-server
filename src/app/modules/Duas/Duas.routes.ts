import express from "express";
import { duasController } from "./Duas.controller";

const router = express.Router();

router.get("/categories", duasController.getAllCategoryFromDB);
router.get("/duas", duasController.getDuaFromDB);

export const duasRoutes = router;
