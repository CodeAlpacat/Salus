var expree = require("express");
var router = expree.Router();

// controller
const controller = require("../../controller/kiosk/kioskController");
router.get("/daily/:rfidKey", controller.dailyData);
router.get("/login/:rfidKey", controller.userInfo);
router.get("/calendar/:userid", controller.calendarData);
module.exports = router;
