const ImportDetail = require("../models/import_detail.model");
const Product = require("../models/product.model");
const Category = require("../models/category.model");
const Supplier = require("../models/supplier.model");
const { Op, literal } = require("sequelize");
const sequelize = require("../config/db");
const SaleDetail = require("../models/sale_detail.model"); // Assuming SaleDetail model exists

// _____________________select most imported product within a given date range
exports.getMostImportedProductByDateRange = async (req, res) => {
  const { startDate, endDate } = req.query;

  try {
    // Convert startDate to the start of the day (00:00:00)
    const startOfDay = new Date(startDate);
    startOfDay.setHours(0, 0, 0, 0);

    // Convert endDate to the end of the day (23:59:59)
    const endOfDay = new Date(endDate);
    endOfDay.setHours(23, 59, 59, 999);

    const mostImportedProducts = await ImportDetail.findAll({
      attributes: [
        [sequelize.col("product_id"), "product_id"],
        [sequelize.fn("SUM", sequelize.col("Imp_quantity")), "totalQuantity"],
        [literal("(SUM(Imp_price * Imp_quantity))"), "totalPrice"], // Calculate total price
        [sequelize.col("ImportDetail.createdAt"), "createdAt"], // Include createdAt field
      ],
      include: [
        {
          model: Product,
          as: "product",
          attributes: ["name", "profile"],
        },
      ],
      where: {
        [Op.and]: [
          sequelize.where(sequelize.col("ImportDetail.createdAt"), {
            [Op.between]: [startOfDay, endOfDay],
          }),
        ],
      },
      group: ["product_id"],
      order: [[sequelize.literal("totalQuantity"), "DESC"]], // Sort by totalQuantity in descending order
    });

    if (!mostImportedProducts || mostImportedProducts.length === 0) {
      // No imports found within the date range
      res.status(200).json({ result: "No imports found within the date range" });
    } else {
      const formattedProducts = mostImportedProducts.map((product) => ({
        product_id: product.product_id,
        name: product.product.name,
        profile: product.product.profile,
        totalQuantity: product.dataValues.totalQuantity,
        totalPrice: product.dataValues.totalPrice,
        createdAt: product.dataValues.createdAt, // Include createdAt field in the response
      }));

      res.status(200).json(formattedProducts);
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
// _____________________select income and expenses by verery mount_____________________________

exports.getIncomeAndExpensesSummaryByDateRange = async (req, res) => {
  const { startDate, endDate } = req.query;
  try {
    const start = new Date(startDate);
    const end = new Date(endDate);
    const summaryData = [];
    let totalIncome = 0;
    let totalExpenses = 0;

    // Loop through each month within the date range
    while (start <= end) {
      const month = start.getMonth() + 1; // Month is 0-indexed, so add 1 to get the correct month
      const year = start.getFullYear();

      // Calculate Income (Revenue from Sales)
      const incomeSummary = await SaleDetail.findAll({
        attributes: [
          [sequelize.literal("SUM(sale_price * quantity)"), "totalIncome"],
        ],
        where: {
          [Op.and]: [
            sequelize.where(sequelize.col("createdAt"), {
              [Op.between]: [
                new Date(year, month - 1, 1), // Start of the month
                new Date(year, month, 0), // End of the month
              ],
            }),
          ],
        },
      });

      const monthIncome = incomeSummary[0].dataValues.totalIncome || 0;
      totalIncome += monthIncome;

      // Calculate Expenses (Total Cost of Imports)
      const expensesSummary = await ImportDetail.findAll({
        attributes: [
          [sequelize.literal("SUM(Imp_price * Imp_quantity)"), "totalExpenses"],
        ],
        where: {
          [Op.and]: [
            sequelize.where(sequelize.col("createdAt"), {
              [Op.between]: [
                new Date(year, month - 1, 1), // Start of the month
                new Date(year, month, 0), // End of the month
              ],
            }),
          ],
        },
      });

      const monthExpenses = expensesSummary[0].dataValues.totalExpenses || 0;
      totalExpenses += monthExpenses;

      // Calculate Profit (Income - Expenses)
      const profit = monthIncome - monthExpenses;

      summaryData.push({
        month,
        year,
        totalIncome: monthIncome,
        totalExpenses: monthExpenses,
        profit,
      });

      // Move to the next month
      start.setMonth(start.getMonth() + 1);
    }

    res.status(200).json({
      summaryData,
      totalIncome,
      totalExpenses,
      totalProfit: totalIncome - totalExpenses,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// ______________________select income an expenses by start day to end day_______________________
// exports.getIncomeAndExpensesSummaryByDateRange = async (req, res) => {
//   const { startDate, endDate } = req.query;

//   try {
//     // Calculate Income (Revenue from Sales)
//     const incomeSummary = await SaleDetail.findAll({
//       attributes: [
//         [sequelize.fn("SUM", sequelize.col("sale_price")), "totalIncome"],
//       ],
//       where: {
//         [Op.and]: [
//           sequelize.where(sequelize.col("createdAt"), {
//             [Op.between]: [startDate, endDate],
//           }),
//         ],
//       },
//     });

//     const totalIncome = incomeSummary[0].dataValues.totalIncome || 0;

//     // Calculate Expenses (Total Cost of Imports)
//     const expensesSummary = await ImportDetail.findAll({
//       attributes: [
//         [sequelize.fn("SUM", sequelize.col("Imp_price")), "totalExpenses"],
//       ],
//       where: {
//         [Op.and]: [
//           sequelize.where(sequelize.col("createdAt"), {
//             [Op.between]: [startDate, endDate],
//           }),
//         ],
//       },
//     });

//     const totalExpenses = expensesSummary[0].dataValues.totalExpenses || 0;

//     // Calculate Profit (Income - Expenses)
//     const profit = totalIncome - totalExpenses;

//     res.status(200).json({
//       startDate,
//       endDate,
//       totalIncome,
//       totalExpenses,
//       profit,
//     });
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// };
// ______________________select by mouth_________________________________
exports.getIncomeAndExpensesSummaryByMonth = async (req, res) => {
  const { month, year } = req.query;

  try {
    // Calculate Income (Revenue from Sales)
    const incomeSummary = await SaleDetail.findAll({
      attributes: [
        [
          sequelize.literal("SUM(sale_price * quantity)"),
          "totalIncome",
        ],
      ],
      where: {
        [Op.and]: [
          sequelize.where(
            sequelize.fn("MONTH", sequelize.col("createdAt")),
            parseInt(month, 10)
          ),
          sequelize.where(
            sequelize.fn("YEAR", sequelize.col("createdAt")),
            parseInt(year, 10)
          ),
        ],
      },
    });

    const totalIncome = incomeSummary[0].dataValues.totalIncome || 0;

    // Calculate Expenses (Total Cost of Imports)
    const expensesSummary = await ImportDetail.findAll({
      attributes: [
        [
          sequelize.literal("SUM(Imp_price * Imp_quantity)"),
          "totalExpenses",
        ],
      ],
      where: {
        [Op.and]: [
          sequelize.where(
            sequelize.fn("MONTH", sequelize.col("createdAt")),
            parseInt(month, 10)
          ),
          sequelize.where(
            sequelize.fn("YEAR", sequelize.col("createdAt")),
            parseInt(year, 10)
          ),
        ],
      },
    });

    const totalExpenses = expensesSummary[0].dataValues.totalExpenses || 0;

    // Calculate Profit (Income - Expenses)
    const profit = totalIncome - totalExpenses;

    res.status(200).json({
      month,
      year,
      totalIncome,
      totalExpenses,
      profit,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

//_______________________select by year__________________________________

// Define the getIncomeAndExpensesSummaryByYear function
exports.getIncomeAndExpensesSummaryByYear = async (req, res) => {
  const { year } = req.query;

  try {
    // Calculate Income (Revenue from Sales)
    const incomeSummary = await SaleDetail.findAll({
      attributes: [
        [sequelize.literal("SUM(sale_price * quantity)"), "totalIncome"],
      ],
      where: {
        createdAt: {
          [Op.between]: [`${year}-01-01`, `${year}-12-31`],
        },
      },
    });

    const totalIncome = incomeSummary[0].dataValues.totalIncome || 0;

    // Calculate Expenses (Total Cost of Imports)
    const expensesSummary = await ImportDetail.findAll({
      attributes: [
        [sequelize.literal("SUM(Imp_price * Imp_quantity)"), "totalExpenses"],
      ],
      where: {
        createdAt: {
          [Op.between]: [`${year}-01-01`, `${year}-12-31`],
        },
      },
    });

    const totalExpenses = expensesSummary[0].dataValues.totalExpenses || 0;

    // Calculate Profit (Income - Expenses)
    const profit = totalIncome - totalExpenses;

    res.status(200).json({
      year,
      totalIncome,
      totalExpenses,
      profit,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// ___________________________________create import detail ______________________
exports.createImportDetail = (req, res) => {
  const { product_id, import_id, Imp_price, Imp_quantity } = req.body;

  ImportDetail.create({
    product_id,
    import_id,
    Imp_price,
    Imp_quantity,
  })
    .then((importDetail) => {
      res.status(201).json({ result: importDetail });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getImportDetail = (req, res) => {
  ImportDetail.findAll()
    .then((importDetails) => {
      res.status(200).json({ result: importDetails });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getImportDetailById = (req, res) => {
  const { id } = req.params;

  ImportDetail.findByPk(id)
    .then((importDetail) => {
      if (!importDetail) {
        res.status(404).json({ result: "Import detail not found" });
      } else {
        res.status(200).json({ result: importDetail });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.updateImportDetail = (req, res) => {
  const { id } = req.params;
  const { product_id, import_id, Imp_price, Imp_quantity } = req.body;

  ImportDetail.findByPk(id)
    .then((importDetail) => {
      if (!importDetail) {
        res.status(404).json({ result: "Import detail not found" });
      } else {
        importDetail
          .update({
            product_id,
            import_id,
            Imp_price,
            Imp_quantity,
          })
          .then((updatedImportDetail) => {
            res.status(200).json({ result: updatedImportDetail });
          });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.deleteImportDetail = (req, res) => {
  const { id } = req.params;

  ImportDetail.destroy({ where: { id } })
    .then((rowsDeleted) => {
      if (rowsDeleted === 0) {
        res.status(404).json({ result: "Import detail not found" });
      } else {
        res.status(200).json({ result: "Import detail deleted successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
exports.getImportDetailsByImportId = (req, res) => {
  const { import_id } = req.params;

  ImportDetail.findAll({
    where: { import_id },
    include: [
      {
        model: Product,
        as: "product",
        attributes: ["name", "profile"],
        include: [
          { model: Category, as: "category", attributes: ["category"] },
          { model: Supplier, as: "supplier", attributes: ["name"] },
        ],
      },
    ],
  })
    .then((importDetails) => {
      // Map the result to the desired structure
      const mappedImportDetails = importDetails.map((importDetail) => ({
        id: importDetail.id,
        product_id: importDetail.product_id,
        import_id: importDetail.import_id,
        Imp_price: importDetail.Imp_price,
        Imp_quantity: importDetail.Imp_quantity,
        createdAt: importDetail.createdAt,
        updatedAt: importDetail.updatedAt,
        productName: importDetail.product.name,
        productProfile: importDetail.product.profile,
        category: importDetail.product.category.category,
        supplierName: importDetail.product.supplier.name,
      }));

      res.status(200).json({ result: mappedImportDetails });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// _______________________select the import details by import id 

// exports.getImportDetailsByImportId = (req, res) => {
//   const { import_id } = req.params;

//   ImportDetail.findAll({
//     where: { import_id },
//     include: [
//       {
//         model: Product,
//         as: "product",
//         attributes: ["name", "profile"],
//         include: [
//           { model: Category, as: "category", attributes: ["category"] },
//           { model: Supplier, as: "supplier", attributes: ["name"] },
//         ],
//       },
//     ],
//   })
//     .then((importDetails) => {
//       // Map the result to the desired structure
//       const mappedImportDetails = importDetails.map((importDetail) => ({
//         id: importDetail.id,
//         product_id: importDetail.product_id,
//         import_id: importDetail.import_id,
//         Imp_price: importDetail.Imp_price,
//         Imp_quantity: importDetail.Imp_quantity,
//         createdAt: importDetail.createdAt,
//         updatedAt: importDetail.updatedAt,
//         productName: importDetail.product.name,
//         productProfile: importDetail.product.profile,
//         category: importDetail.product.category.category,
//         supplierName: importDetail.product.supplier.name,
//       }));

//       res.status(200).json({ result: mappedImportDetails });
//     })
//     .catch((error) => {
//       res.status(500).json({ error: error.message });
//     });
// };