using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IRepository
{
    public interface IUserRepository : IBaseRepository<UserModel>
    {
        UserModel GetDetail(int Id);
        UserModel CheckLogin(string username, string password);
        int ModifyPwd(PassWordModel model);
        IEnumerable<UserModel> GetUserList(int roleId);
    }
}
