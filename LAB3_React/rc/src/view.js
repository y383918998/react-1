// Home.js

import React, { useState,useEffect  } from 'react';
import AppointmentPages from '././AppointmentPages';


const Home = () => {

  const [queryData, setQueryData] = useState(null);

//   debugger
//   const response = await fetch('http://localhost:57060/api/Reservation/'+localStorage.getItem("uid"), {
//     method: 'get',
//   });

//   if (response.ok) {
//     debugger
//     const data =  await response.json();
//     setQueryData(data.Data);
   
// } 


useEffect(() => {
    // 在组件加载时，使用useEffect加载数据
    const fetchData = async () => {
      try {
        // 发起异步请求获取数据

        const response = await fetch('http://localhost:57060/api/Reservation/'+localStorage.getItem("uid"), {
          method: 'Get',
          headers: {
            'Content-Type': 'application/json',
          },
        });

        const result = await response.json();

        // 更新组件的状态，触发重新渲染
        setQueryData(result.Data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    // 调用fetchData函数
    fetchData();
  }, []); // 依赖数组为空表示只在组件加载时执行一次


  return (
    <div>
      {/* 显示查询结果 */}
      {queryData && <AppointmentPages data={queryData} />}
    </div>
  );
};

export default Home;
