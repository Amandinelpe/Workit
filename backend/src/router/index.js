const express = require("express");

const router = express.Router();
const userRouter = require("./userRouter");
const roleRouter = require("./roleRouter");
const firmRouter = require("./firmRouter");
const contractRouter = require("./contractRouter");

router.use("/user", userRouter);
router.use("/role", roleRouter);
router.use("/firm", firmRouter);
router.use("/contract", contractRouter);
const jobRouter = require("./jobRouter");
const offerRouter = require("./offerRouter");
const consultantRouter = require("./consultantRouter");
const experienceRouter = require("./experienceRouter");

router.use("/user", userRouter);
router.use("/role", roleRouter);
router.use("/consultant", consultantRouter);
router.use("/experience", experienceRouter);
router.use("/job", jobRouter);
router.use("/offer", offerRouter);

module.exports = router;
