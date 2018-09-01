using System;
using Microsoft.Extensions.Configuration;

namespace DiscourseSso.Services
{
    public class Helpers
    {
        private IConfigurationRoot _config;
        public Helpers(IConfigurationRoot config)
        {
            _config = config;
        }

        public byte[] HexStringToByteArray(string hex)
        {
            byte[] bytes = new byte[hex.Length / 2];
            for (int i = 0; i < hex.Length; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }
    }
}
