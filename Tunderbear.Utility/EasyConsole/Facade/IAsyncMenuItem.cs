using System;
using System.Threading.Tasks;

namespace ThunderBear.Utility.EasyConsole.Facade
{
    public interface IAsyncMenuItem
    {
        Func<Task> Action { get; set; }
        ConsoleKey Key { get; set; }
        string KeyName { get; set; }
        string Title { get; set; }

        void Draw();
        Task GoAsync();
    }
}