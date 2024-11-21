import { Request, Response } from "express";
import httpStatus from "http-status";

import catchAsync from "../../../shared/catchAsync";
import sendResponse from "../../../shared/sendResponse";
import { duasService } from "./Duas.sevice";

const getAllCategoryFromDB = catchAsync(async (req: Request, res: Response) => {
  const result = await duasService.getAllCategoryFromDB();
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Category Get successfully",
    data: result,
  });
});

const getDuaFromDB = catchAsync(async (req: Request, res: Response) => {

  const { cat } = req.query;
  const result = await duasService.getDuaFromDB(cat);
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Duas Get successfully",
    data: result,
  });
});
export const duasController = {
  getAllCategoryFromDB,
  getDuaFromDB,
};
