"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const Duas_routes_1 = require("../modules/Duas/Duas.routes");
const router = express_1.default.Router();
const moduleRoutes = [
    {
        path: "/",
        route: Duas_routes_1.duasRoutes,
    },
];
moduleRoutes.forEach((route) => router.use(route.path, route.route));
exports.default = router;
