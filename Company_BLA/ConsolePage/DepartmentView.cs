using Company_BLA.Service;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Threading;
using ThunderBear.Utility.EasyConsole.Abstract;
using ThunderBear.Utility.EasyConsole.Components;
using ThunderBear.Utility.EasyConsole.Facade;

namespace Company_BLA.ConsolePage
{
    public class DepartmentView : AbstractConsolePage
    {


        public DepartmentView(ServiceProvider serv, IConsoleProberties probs) : base(serv, probs)
        {
            var con = serv.GetService<IDepartmentController>();
            Header = "Department";
            SetMenu(new List<IAsyncMenuItem> {
                new StandartMenuItem("Create Department", async () => {
                   DrawHeader();
                   //con.Create();
                   AwaitInput();
                }),
                new StandartMenuItem("Update Department name", async () => {
                    DrawHeader();
                   con.UpdateName();
                   AwaitInput();
                }),
                new StandartMenuItem("Update Department MgrSSN", async () => {
                    DrawHeader();
                   con.UpdateMgr();
                   AwaitInput();

                }),
                new StandartMenuItem("Delete Department", async () => {
                    DrawHeader();
                   con.Delete();
                   AwaitInput();
                }),
                new StandartMenuItem("Get Department", async () => {
                    DrawHeader();
                   con.Read();
                   AwaitInput();

                }),
                new StandartMenuItem("Get All Department", async () => {
                   DrawHeader();
                   con.ReadALL();
                   AwaitInput();

                })
            });
        }
    }


}
