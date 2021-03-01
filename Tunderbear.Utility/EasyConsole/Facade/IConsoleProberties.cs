using System;

namespace ThunderBear.Utility.EasyConsole.Facade
{
    public interface IConsoleProberties
    {
        string MainHeader { get; set; }
        ConsoleKey[] AvailableKey { get; set; }
        ConsoleColor ConsoleFrontColor { get; set; }
        ConsoleColor ConsoleBackColor { get; set; }
        ConsoleColor ConsoleLoaderColor { get; set; }

        int ConsoleHeight { get; set; }
        int ConsoleWidth { get; set; }
    }
}
