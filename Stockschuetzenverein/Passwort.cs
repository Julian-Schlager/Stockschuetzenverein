using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Stockschuetzenverein
{
    public class Passwort
    {
        public static string CreateSalt()
        {
            RNGCryptoServiceProvider rand = new RNGCryptoServiceProvider();

            byte[] salt = new byte[20];
            rand.GetBytes(salt);

            return Convert.ToBase64String(salt);
        }
        
        public static string CreatePasswordHash(string input, string salt)
        {
            HashAlgorithm hashAlgorithm = new SHA256Managed();
            byte[] hash = new byte[input.Length + salt.Length];

            string passwordAndSalt = input + salt;

            hash = Encoding.ASCII.GetBytes(passwordAndSalt);

            return Convert.ToBase64String(hashAlgorithm.ComputeHash(hash));

        }
    }
}