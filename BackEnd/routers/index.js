const express = require("express");
const router = express.Router();

/** 유저 관련 router */

const user = require('./user');
router.use('/user', user);

/** KAKAO 로그인 관련 router*/
const auth = require('./auth');
router.use('/auth', auth);

module.exports = router;