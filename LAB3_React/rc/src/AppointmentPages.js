// AppointmentPages.js

import React from 'react';
import { Link, useHistory } from 'react-router-dom';
const AppointmentPages = ({ data }) => {
  // 样式可以通过内联样式或者引入外部样式表
  const appointmentStyle = {
    border: '1px solid #ccc',
    padding: '5px',
    margin: '5px',
    borderRadius: '5px',
    backgroundColor: '#f9f9f9',
  };

  const tableStyle = {
    width: '100%',
    borderCollapse: 'collapse',
    
  };

  const cellStyle = {
    width: '20.33%',
    padding: '10px',
    border: '1px solid #ccc',
  };

const handleRefresh = () => {
  // 刷新当前页面
  window.location.reload();
};

const Choice = async (id) => {
  // 刷新当前页面

   
  const response = await fetch('http://localhost:57060/api/Reservation/'+id, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ Id:id, UID:localStorage.getItem("uid"),Type:1 }),
  });

if (response.ok) {
            const data = await response.json();
            if(data.Status===true)
            {
               alert("取消成功");
               window.location.reload();
            }
            else
            {
                //失败
                alert(data.Msg);
            }
          // 模拟登录成功后的操作
           
        } else {
          // 模拟登录失败的操作
          console.error('取消失败');
        }

};

  return (

  
    <div >
      {/* 显示查询的预约数据 */}
      <table style={tableStyle} >
        <tbody>
          {data.map((appointment, index) => (
            // 每行显示3个预约
         
              <tr key={index}>
                <td style={cellStyle}>
                  <div style={appointmentStyle}>
                    <p>Department: {appointment.Department}</p>
                    <p>Time: {appointment.BeginTime}</p>
                    <p>Doctor: {appointment.DocterName}</p>
                    <button onClick={() => Choice(appointment.Id)}>Cancel</button>
                  </div>
                </td>
              </tr>
          
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default AppointmentPages;
