using TestCRUD.DTO;
using TestCRUD.Interface;
using TestCRUD.Models;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TestCRUD.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUser _user;
        private readonly IMapper _mapper;
        public UsersController(IUser user, IMapper mapper)
        {
            _user = user;
            _mapper = mapper;
        }

        /// <summary>
        /// Peticion para obtener todos los Usuarios
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [ProducesResponseType(typeof(UserDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet]
        public IActionResult GetUsers()
        {
            try
            {
                var resp = _mapper.Map<List<UserDTO>>(_user.GetUsers());

                if (resp == null)
                    return NotFound(resp);

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        /// <summary>
        /// Peticio para obtener informacion de un usuario
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [ProducesResponseType(typeof(UserDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetUserByID(int id)
        {
            try
            {
                var resp =  _mapper.Map<UserDTO>(await _user.GetUserByID(id));

                if (resp == null)
                    return NotFound(new { message = $"Usuario con Id = {id} no encontrado" });

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        /// <summary>
        /// Peticion para agregar un usuario
        /// </summary>
        /// <param name="userDTO"></param>
        /// <returns></returns>
        //[AuthorizeRoles(Rol.Administrator)]
        [HttpPost]
        [ProducesResponseType(typeof(UserDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [AllowAnonymous]

        public async Task<IActionResult> AddUser([FromBody] UserDTO userDTO)
        {
            try
            {
                var user = _mapper.Map<TUser>(userDTO);
                var resp = await _user.AddUser(user);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                //return StatusCode(StatusCodes.Status201Created, user);
                return CreatedAtAction(nameof(GetUserByID), new { id = user.CodUsuario}, userDTO);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }

        //[AuthorizeRoles(Rol.Administrator)]
        [HttpPut("{id}")]
        [ProducesResponseType(typeof(UserDTO), 204)]
        [ProducesResponseType(400)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> UpdateUser(int id, [FromBody] UserDTO userDTO)
        {
            try
            {
                if (id != userDTO.CodUsuario)
                    return BadRequest();

                var user = _mapper.Map<TUser>(userDTO);
                await _user.UpdateUser(user);

                return StatusCode(StatusCodes.Status204NoContent, user);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        

        //[AuthorizeRoles(Rol.Administrator)]
        [ProducesResponseType(204)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            try
            {
                await _user.DeleteUser(id);

                return NoContent();
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }
    }
}
