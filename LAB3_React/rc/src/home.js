// Home.js

import React, { useState } from 'react';
import AppointmentPage from './AppointmentPage';
import { Link } from 'react-router-dom';


const Home = () => {
  const [department, setDepartment] = useState('');
  const [selectedDate, setSelectedDate] = useState('');
  const [queryData, setQueryData] = useState(null);

  const handleQuery =async () => {
    // 模拟查询返回的数据
    
if(department==='')
{
  alert("请选择类型");
  return ;
}
if(selectedDate==='')
{
  alert("请选择时间");
  return ;
}
    debugger
    const response = await fetch('http://localhost:57060/api/Reservation', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ department, BeginTime:selectedDate }),
    });

    if (response.ok) {
      debugger
      const data =  await response.json();
      setQueryData(data.Data);
     
  } 
 
  };

  return (
    <div>
      {/* 选择科室 */}
      <select value={department} onChange={(e) => setDepartment(e.target.value)}>
      <option value="">请选择</option>
        <option value="家庭医生">家庭医生</option>
        <option value="耳鼻喉科医生">耳鼻喉科医生</option>
        <option value="皮肤科医生">皮肤科医生</option>
        <option value="眼科医生">眼科医生</option>
        <option value="神经科医生">神经科医生</option>
        <option value="骨科医生">骨科医生</option>
        <option value="儿科医生">儿科医生</option>
        {/* 添加更多科室选项 */}
      </select>
      {/* 选择时间 */}
      <label>选择时间:</label>
      <input type="date" value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} />

      {/* 查询按钮 */}
      <button onClick={handleQuery}>查询</button>
      <Link to="/view">Go to view</Link>
      {/* 显示查询结果 */}
      {queryData && <AppointmentPage data={queryData} />}
    </div>
  );
};

export default Home;
