using TestCRUD.DTO;
using TestCRUD.Interface;
using TestCRUD.Models;
using AutoMapper;
using log4net;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestCRUD.Services
{
    public class UserServices : IUser
    {
        static readonly ILog log = LogManager.GetLogger(typeof(UserServices));

        private readonly TestCrudContext _context;
        private readonly IMapper _mapper;

        public UserServices(TestCrudContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public  List<TUser> GetUsers()
        {
            try
            {
                return  _context.TUsers.ToList();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Usuarios GetUsers()  {0} : {1} ", e.Source, e.Message);
                throw;

            }
        }

        public async Task<TUser> GetUserByID(int id)
        {
            try
            {
                return await _context.TUsers.FirstOrDefaultAsync(x => x.CodUsuario == id);
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Usuario GetUserByID()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<TUser> AddUser(TUser user)
        {
            try
            {
                _context.TUsers.Add(user);
                await _context.SaveChangesAsync();
                return user;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Crear Usuario AddUser()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<TUser> UpdateUser(TUser user)
        {
            try
            {
                var model = await _context.TUsers.AsNoTracking().FirstOrDefaultAsync(x => x.CodUsuario == user.CodUsuario);
                if(model != null)
                {
                    _context.Update(user).State = EntityState.Modified;
                    await _context.SaveChangesAsync();

                    return user;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al  Actualizar Usuario UpdateUser()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }

        public async Task<TUser> DeleteUser(int id)
        {
            try
            {
                var user = await _context.TUsers.FirstOrDefaultAsync(x => x.CodUsuario == id);
                if (user != null)
                {
                    _context.TUsers.Remove(user);
                    await _context.SaveChangesAsync();
                    return user;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Eliminar Usuario DeleteUser()  {0} : {1} ", e.Source, e.Message);
                throw;
            }

        }
       
    }
}
