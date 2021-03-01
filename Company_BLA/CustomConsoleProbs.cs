using System;
using ThunderBear.Utility.EasyConsole.Facade;

namespace Pwb.Client.Internal.Admin.ConsolePages.Probs
{
    public class CustomConsoleProbs : IConsoleProberties
    {


        private string _mainHeader =
            "\n" + @"      _____           _____         ______  _______        _____          ____  _____   ______    _____      _____        _____         _____   " +
            "\n" + @"  ___|\    \     ____|\    \       |      \/       \   ___|\    \    ____|\   \|\    \ |\     \  |\    \    /    /|   ___|\    \   ___|\     \  " +
            "\n" + @" /    /\    \   /     /\    \     /          /\     \ |    |\    \  /    /\    \\\    \| \     \ | \    \  /    / |  |    |\    \ |    |\     \ " +
            "\n" + @"|    |  |    | /     /  \    \   /     /\   / /\     ||    | |    ||    |  |    |\|    \  \     ||  \____\/    /  /  |    | |    ||    | |     |" +
            "\n" + @"|    |  |____||     |    |    | /     /\ \_/ / /    /||    |/____/||    |__|    | |     \  |    | \ |    /    /  /   |    | |    ||    | /_ _ / " +
            "\n" + @"|    |   ____ |     |    |    ||     |  \|_|/ /    / ||    ||    |||    .--.    | |      \ |    |  \|___/    /  /    |    | |    ||    |\    \  " +
            "\n" + @"|    |  |    ||\     \  /    /||     |       |    |  ||    ||____|/|    |  |    | |    |\ \|    |      /    /  /     |    | |    ||    | |    | " +
            "\n" + @"|\ ___\/    /|| \_____\/____/ ||\____\       |____|  /|____|       |____|  |____| |____||\_____/|     /____/  / ___  |____|/____/||____|/____/| " +
            "\n" + @"| |   /____/ | \ |    ||    | /| |    |      |    | / |    |       |    |  |    | |    |/ \|   ||    |`    | / |   | |    /    | ||    /     || " +
            "\n" + @" \|___|    | /  \|____||____|/  \|____|      |____|/  |____|       |____|  |____| |____|   |___|/    |_____|/  |___| |____|____|/ |____|_____|/ " +
            "\n" + @"   \( |____|/      \(    )/        \(          )/       \(           \(      )/     \(       )/         )/             \(    )/     \(    )/    " +
            "\n" + @"    '   )/          '    '          '          '         '            '      '       '       '          '               '    '       '    '     " +
            "\n" + @"        '                                                                                                          ";

        private ConsoleKey[] _keys = new ConsoleKey[] {
                ConsoleKey.D1,
                ConsoleKey.D2,
                ConsoleKey.D3,
                ConsoleKey.D4,
                ConsoleKey.D5,
                ConsoleKey.D6,
                ConsoleKey.D7,
                ConsoleKey.D8,
            };

        public CustomConsoleProbs()
        {

            ConsoleBackColor = ConsoleColor.DarkGray;
            ConsoleFrontColor = ConsoleColor.Green;
            ConsoleLoaderColor = ConsoleColor.Magenta;
            ConsoleHeight = 35;
            ConsoleWidth = 150;
        }

        public string MainHeader { get => _mainHeader; set => _mainHeader = value; }
        public ConsoleKey[] AvailableKey { get => _keys; set => _keys = value; }
        public ConsoleColor ConsoleFrontColor { get; set; }
        public ConsoleColor ConsoleBackColor { get; set; }
        public ConsoleColor ConsoleLoaderColor { get; set; }
        public int ConsoleHeight { get; set; }
        public int ConsoleWidth { get; set; }
    }


}
