using Company_BLA.ConsolePage;
using Company_BLA.Service;
using Microsoft.Extensions.DependencyInjection;
using Pwb.Client.Internal.Admin.ConsolePages.Probs;
using System;
using System.Threading.Tasks;
using ThunderBear.Utility.EasyConsole.Abstract;
using ThunderBear.Utility.EasyConsole.Facade;

namespace Company_BLA
{
    class Program
    {
            static async Task Main(string[] args)
            {
                Console.WriteLine("...Starting, Company Termianl");


                var serviceProvider = BuildServiceProvider();
                var probs = serviceProvider.GetService<IConsoleProberties>();
                ApplyConsoleProbs(probs);

                var page = new DepartmentView(serviceProvider, probs);

                await RunApp(page);
            }

            private static async Task RunApp(AbstractConsolePage page)
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

            private static void ApplyConsoleProbs(IConsoleProberties probs)
            {
                Console.SetWindowSize(probs.ConsoleWidth, probs.ConsoleHeight);
                Console.BackgroundColor = probs.ConsoleBackColor;
                Console.ForegroundColor = probs.ConsoleFrontColor;
            }

            private static ServiceProvider BuildServiceProvider()
            {

                var services = new ServiceCollection();
                //Configure services here

                services.AddScoped<IConsoleProberties, CustomConsoleProbs>();
                services.AddScoped<IDepartmentController, DepartmentController>();

                return services.BuildServiceProvider();
            }
        }
}
