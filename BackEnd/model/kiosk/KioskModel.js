var conn = require("../../database/db");
const mybatisMapper = require("mybatis-mapper");

//현재 운동 데이터 받아오기
const searchDailyData = async (req, res) => {
  const param = null;
  const format = { language: "sql", indent: "" };
  const query = mybatisMapper.getStatement(
    "kiosk",
    "searchDailyData",
    param,
    format
  );
  conn.query(query, (err, results) => {
    if (err) console.log(err);
    console.log(results);
    return res.json(results);
  });
};

module.exports = {
  searchDailyData,
};