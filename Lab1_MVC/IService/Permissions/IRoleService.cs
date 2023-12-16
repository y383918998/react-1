﻿using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
    public interface IRoleService:IBaseService<RoleModel>
    {
        IEnumerable<RoleModel> GetRoleList();
        /// <summary>
        /// 删除角色时,同时删除t_menu_role_action记录
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        bool DeleteRoleAllByRoleId(int roleId);
    }
}
