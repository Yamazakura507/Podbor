using System.Reflection;
using System.Text.Json;

namespace Podbor.Classes.AppSettings
{
    public class StartParametrs
    {
        private string FileName = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "temp.json");

        private int idAutorizateUser;
        private bool isGet = false;

        public int IdAutorizateUser 
        {
            get
            {
                return !isGet ? GetParametrs<int>("IdAutorizateUser").Result : idAutorizateUser;
            } 
            set 
            {
                Save();
            }
        }

        public StartParametrs(int idAutorizateUser = 0)
        {
            this.idAutorizateUser = idAutorizateUser;
            isGet = true;
        }

        private async Task<T> GetParametrs<T>(string fildsName)
        {
            try
            {
                StartParametrs parametrs;

                isGet = true;

                using (FileStream fs = new FileStream(FileName, FileMode.OpenOrCreate))
                {
                    parametrs = await JsonSerializer.DeserializeAsync<StartParametrs>(fs) ?? new StartParametrs();
                }

                isGet = false;

                return (T)typeof(StartParametrs).GetFields(BindingFlags.Instance | BindingFlags.NonPublic).ToArray().First(i => i.Name == "IdAutorizateUser").GetValue(parametrs);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private async void Save()
        {
            try
            {
                using (FileStream fs = new FileStream(FileName, FileMode.OpenOrCreate))
                {
                    await JsonSerializer.SerializeAsync(fs, this);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
