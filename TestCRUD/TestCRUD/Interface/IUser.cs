using TestCRUD.DTO;
using TestCRUD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestCRUD.Interface
{
    public interface IUser
    {
        List<TUser> GetUsers();
        Task<TUser> GetUserByID(int id);
        Task<TUser> AddUser(TUser user);
        Task<TUser> UpdateUser(TUser user);
        Task<TUser> DeleteUser(int id);

    }
}
