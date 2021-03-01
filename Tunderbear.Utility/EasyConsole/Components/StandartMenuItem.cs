using System;
using System.Threading.Tasks;
using ThunderBear.Utility.EasyConsole.Facade;

namespace ThunderBear.Utility.EasyConsole.Components
{
    public class StandartMenuItem : IAsyncMenuItem
    {

        public string Title { get; set; }
        public Func<Task> Action { get; set; }
        public ConsoleKey Key { get; set; }
        public string KeyName { get; set; }

        public StandartMenuItem(string title, Func<Task> action)
        {
            Action = action;
            Title = title;
        }

        public void Draw()
        {
            Console.WriteLine("[" + KeyName + "] - " + Title);
        }


        public async Task GoAsync()
        {
            await Action.Invoke();
        }

    }
}
