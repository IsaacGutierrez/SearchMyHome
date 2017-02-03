using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.Contracts
{
    interface IAnuncioPublicitarios
    {
        void registrarAnuncio();
        void modificarAnuncio(int idAnuncio);
        List<AnuncioPublicitario> GetAnuncios();
        void cancelarAnuncio(int idAnuncio);
       }
}
