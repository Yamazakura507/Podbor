
using System.Text;

namespace Podbor.Classes
{
    static class TextBoxRestrictions
    {

        private static Color AlertBursh = Color.FromRgba(112, 1, 1, 30);

        private static Color GoodBursh = Colors.Transparent;

        async private static void Sleep(Entry textBox)
        {
            await Task.Delay(3000);
            textBox.BackgroundColor = GoodBursh;
        }

        async private static void Sleep(ListView listBox)
        {
            await Task.Delay(3000);
            listBox.BackgroundColor = GoodBursh;
        }

        public static bool TextEmptyTextBox(Entry textBox)
        {
            if (String.IsNullOrWhiteSpace(textBox.Text))
            {
                textBox.BackgroundColor = AlertBursh;
                textBox.Text = null;
                Sleep(textBox);
            }
            else
            {
                textBox.BackgroundColor = GoodBursh;
                return true;
            }

            return false;
        }

        public static bool TextCheckTextBox(Entry passwordBox, Entry passwordRepetBox)
        {
            if (passwordBox.Text != passwordRepetBox.Text)
            {
                passwordRepetBox.BackgroundColor = passwordBox.BackgroundColor = AlertBursh;
                passwordBox.Text = passwordRepetBox.Text = null;

                Sleep(passwordRepetBox);
                Sleep(passwordBox);
                return false;
            }
            else
            {
                passwordRepetBox.BackgroundColor = passwordBox.BackgroundColor = GoodBursh;
                return true;
            }
        }

        public static bool EmailTextBoxCheck(this Page page, string email, string login = null)
        {
            try
            {
                 page.EmailTextBoxCheck(new Entry() { Text = email }, login);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return true;
        }

        public static bool EmailTextBoxCheck(this Page page, Entry textBox, string login = null)
        {
            string rand = GeneratorChufleString(new Random().Next(4, 10));

            string answer;

            try
            {
                answer = page.InputMessage(Properties.Resources.mailActiv, "Подтвердитверждение учетной записи", textBox.Text, new Dictionary<string, string>()
                                                                                            {
                                                                                                { "@Login", login },
                                                                                                { "@Code", rand }
                                                                                            }, "На вашу электронную почту\nбыло отправлено письмо.\nВведите код подтверждения\nиз письма");
            }
            catch (Exception)
            {
                throw new Exception("Указаный Email не существует.\n");
            }

            try
            {
                if (rand != answer)
                {
                    textBox.BackgroundColor = AlertBursh;
                    textBox.Text = null;
                    Sleep(textBox);
                    throw new Exception("Ключ подтверждения не валиден\n");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


            textBox.Background = GoodBursh;
            return true;
        }

        public static bool ListEmpty<T>(IEnumerable<T> values, ListView listView)
        {
            if (values.Count() == 0)
            {
                listView.BackgroundColor = AlertBursh;
                Sleep(listView);
                return false;
            }

            listView.BackgroundColor = GoodBursh;
            return true;
        }

        public static string GeneratorChufleString(int lenght)
        {
            string symbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            Random random = new Random();

            string rand = null;


            rand = Enumerable.Range(0, lenght)
                    .Aggregate(
                        new StringBuilder(),
                        (sb, n) => sb.Append(symbols[random.Next(0, symbols.Length)]),
                        sb => sb.ToString());


            return rand;
        }
    }
}
