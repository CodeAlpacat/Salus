var expree = require('express');
var router = expree.Router();

// controller
const controller = require("../../controller/user/userController");
router.get("/allsearch", controller.allSearch);
router.get("/search", controller.search);
router.post("/signup", controller.signup);
router.get("/signin", controller.signin);
module.exports = router;