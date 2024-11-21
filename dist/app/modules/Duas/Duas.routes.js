"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.duasRoutes = void 0;
const express_1 = __importDefault(require("express"));
const Duas_controller_1 = require("./Duas.controller");
const router = express_1.default.Router();
router.get("/categories", Duas_controller_1.duasController.getAllCategoryFromDB);
router.get("/duas", Duas_controller_1.duasController.getDuaFromDB);
exports.duasRoutes = router;
