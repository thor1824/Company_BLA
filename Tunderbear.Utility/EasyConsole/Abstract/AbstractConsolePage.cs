using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThunderBear.Utility.EasyConsole.Facade;

namespace ThunderBear.Utility.EasyConsole.Abstract
{
    public abstract class AbstractConsolePage
    {
        public readonly ServiceProvider _servicePro;
        private int _page;
        private Dictionary<ConsoleKey, IAsyncMenuItem> _mappedItems;
        private int _maxPage;
        private readonly int _minPage = 0;

        private readonly int _itemsPrPage = 8;
        private IList<IAsyncMenuItem> _menuItems { get; set; }
        public string Header { get; set; }
        public string Page { get; set; }
        public string MaxPages { get; set; }
        public IConsoleProberties _probs { get; }


        public AbstractConsolePage(ServiceProvider servicePro, IConsoleProberties probs)
        {
            _servicePro = servicePro;
            _page = _minPage;
            _probs = probs;
        }

        public void DrawHeader()
        {
            Console.Clear();
            Console.WriteLine(_probs.MainHeader);
            Console.WriteLine("- " + Header + "\n");

        }

        public void SetMenu(IList<IAsyncMenuItem> menuItems)
        {
            _maxPage = menuItems.Count / _itemsPrPage;
            
            if (menuItems.Count == _maxPage * _itemsPrPage) {
                _maxPage = _maxPage - 1;
            }
            _menuItems = menuItems;
        }

        public void DrawMenus()
        {
            if (_menuItems.Count <= _itemsPrPage)
            {
                var keys = _probs.AvailableKey;
                var dic = new Dictionary<ConsoleKey, IAsyncMenuItem>();
                for (int i = 0; i < _menuItems.Count; i++)
                {
                    _menuItems[i].Key = keys[i];
                    _menuItems[i].KeyName = "" + (i + 1);
                    _menuItems[i].Draw();
                    dic.Add(keys[i], _menuItems[i]);
                }
                for (int i = 0; i < _itemsPrPage - _menuItems.Count; i++)
                {
                    Console.WriteLine("");
                }
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine();
                _mappedItems = dic;
            }
            else
            {

                var keys = _probs.AvailableKey;
                var dic = new Dictionary<ConsoleKey, IAsyncMenuItem>();
                decimal maxOfCurrentPage = (_maxPage + 1 - (_maxPage - _page)) * _itemsPrPage;
                var startIndex = 0 + _page * _itemsPrPage;

                if (maxOfCurrentPage <= _menuItems.Count)
                {
                    for (int i = startIndex; i < maxOfCurrentPage; i++)
                    {
                        _menuItems[i].Key = keys[i % _itemsPrPage];
                        _menuItems[i].KeyName = "" + (i % _itemsPrPage + 1);
                        _menuItems[i].Draw();
                        dic.Add(keys[i % _itemsPrPage], _menuItems[i]);
                    }
                }
                else
                {
                    for (int i = startIndex; i < _menuItems.Count; i++)
                    {
                        _menuItems[i].Key = keys[i % _itemsPrPage];
                        _menuItems[i].KeyName = "" + (i % _itemsPrPage + 1);
                        _menuItems[i].Draw();
                        dic.Add(keys[i % _itemsPrPage], _menuItems[i]);
                    }
                    for (int i = 0; i < maxOfCurrentPage - _menuItems.Count; i++)
                    {
                        Console.WriteLine("");
                    }
                }

                _mappedItems = dic;
                Console.WriteLine("");
                if (_page != _maxPage)
                {
                    Console.WriteLine("[9] - Next page");
                }
                else
                {
                    Console.WriteLine("");
                }
                if (_page != _minPage)
                {
                    Console.WriteLine("[0] - Next page");
                }
                else
                {
                    Console.WriteLine("");
                }
            }

            Console.WriteLine("Page " + (_page + 1) + " of " + (_maxPage + 1));
            Console.WriteLine("\n[Esc] - Exit");


        }

        public ConsoleKeyInfo AwaitInput()
        {
            Console.WriteLine("\nPlease Press key to continue");
            return Console.ReadKey(true);
        }
        public ConsoleKeyInfo AwaitInput(string msg)
        {
            Console.WriteLine("\n" + msg);
            return Console.ReadKey(true);
        }

        public async Task HandleInputAsync(ConsoleKey key)
        {
            if (key == ConsoleKey.D9)
            {
                _page++;
            }
            else if (key == ConsoleKey.D0)
            {
                _page--;
            }
            else if (_mappedItems.ContainsKey(key))
            {
                await _mappedItems[key].GoAsync();
            }

        }

        public async Task OpenSubmenuAsync(AbstractConsolePage page)
        {
            var running = true;
            while (running)
            {
                try
                {
                    page.DrawHeader();
                    page.DrawMenus();
                    var input = page.AwaitInput("Press key to navigate");

                    if (input.Key == ConsoleKey.Escape)
                    {
                        running = false;
                    }

                    await page.HandleInputAsync(input.Key);
                }
                catch (Exception e)
                {
                    page.DrawHeader();
                    Console.WriteLine("Error Occured: " + e.Message);
                    page.AwaitInput();
                }
            }
        }

        public bool AwaitConfirmation(string subMsg, bool defaultYes)
        {
            Console.Write("Are you sure you want " + subMsg + "?  ");
            Console.Write(defaultYes ? "[Y] [n]" : "[y] [N]");
            var userDecision = -1;
            while (userDecision < 0)
            {
                var key = Console.ReadKey(true);
                if (key.Key == ConsoleKey.Y)
                {
                    userDecision = 1;
                }
                else if (key.Key == ConsoleKey.N)
                {
                    userDecision = 0;
                }
                else if (key.Key == ConsoleKey.Enter)
                {
                    userDecision = defaultYes ? 1 : 0;
                }
            }
            Console.Write(": " + (userDecision == 1 ? "Y" : "N"));
            Console.WriteLine();
            return userDecision == 1;
        }
    }
}
