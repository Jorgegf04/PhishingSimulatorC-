﻿using BlazorSimuladorJGF.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSimuladorJGF.Services
{
    public interface IUserService
    {
        Task<List<User>> GetUsersAsync();
        Task<User> GetUserByIdAsync(int id);
        Task AddUserAsync(User user);
        Task UpdateUserAsync(User user);
        Task DeleteUserAsync(int id);
    }
}