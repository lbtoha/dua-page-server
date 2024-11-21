import prisma from "../../../shared/prisma";

const getAllCategoryFromDB = async () => {
  const result = await prisma.category.findMany({
    include: {
      subCategories: true,
    },
  });

  return {
    data: result,
  };
};

const getDuaFromDB = async (cat: any) => {
  const catId = parseInt(cat);
  const result = await prisma.dua.findMany({
    where: {
      cat_id: catId,
    },
  });

  return {
    data: result,
  };
};

export const duasService = {
  getAllCategoryFromDB,
  getDuaFromDB,
};
