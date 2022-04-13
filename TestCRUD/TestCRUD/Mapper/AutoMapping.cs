using TestCRUD.DTO;
using AutoMapper;
using TestCRUD.Models;

namespace TestCRUD.Mapper
{
    public class AutoMapping : Profile
    {
        public AutoMapping()
        {
            CreateMap<TUser, UserDTO>().ReverseMap();
        }
    }
}
