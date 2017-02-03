using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.Repository
{
    class AnuncioPublicitarioRepository : Contracts.IAnuncioPublicitarios
    {
        public void cancelarAnuncio(int idAnuncio)
        {
            throw new NotImplementedException();
        }

        public List<AnuncioPublicitario> GetAnuncios()
        {
            throw new NotImplementedException();
        }
        public void modificarAnuncio(int idAnuncio)
        {
            throw new NotImplementedException();
        }

        public void registrarAnuncio(AnuncioPublicitario anuncio)
        {
            string jsonAnuncio = JsonConvert.SerializeObject(anuncio);
        }
    }
}
