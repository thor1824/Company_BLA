using System;
using System.Threading;
using ThunderBear.Utility.EasyConsole.Facade;

namespace ThunderBear.Utility.EasyConsole.Components
{
    public class LoadSpinner : IDisposable
    {
        private const string Sequence = @"/-\|";
        private int counter = 0;
        private readonly int left;
        private readonly int top;
        private readonly int delay;
        private bool active;
        private readonly Thread thread;
        private IConsoleProberties probs;

        public LoadSpinner(int left, int top, IConsoleProberties probs, int delay = 100)
        {
            this.left = left;
            this.top = top;
            this.delay = delay;
            this.probs = probs;
            thread = new Thread(Spin);
        }

        public void Start()
        {
            Console.ForegroundColor = probs.ConsoleLoaderColor;
            active = true;
            if (!thread.IsAlive)
                thread.Start();
        }

        public void Stop()
        {
            active = false;
            Draw(' ');
            Console.ForegroundColor = probs.ConsoleFrontColor;
        }

        private void Spin()
        {
            while (active)
            {
                Turn();
                Thread.Sleep(delay);
            }
        }

        private void Draw(char c)
        {
            Console.SetCursorPosition(left, top);
            Console.Write(c);
        }

        private void Turn()
        {
            Draw(Sequence[++counter % Sequence.Length]);
        }

        public void Dispose()
        {
            Stop();
        }
    }
}
