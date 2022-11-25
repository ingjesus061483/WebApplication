using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factory;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAccess
{
    public class Datos
    {
        SqlConnection conexion; SqlCommand comand;
        SqlDataAdapter adapter; DataSet bd; string NombreCadena = "reserva"; SqlDataReader read;
        string CadenaConexion
        {
            get
            {
                return ConfigurationManager.ConnectionStrings[NombreCadena].ConnectionString;
            }
        }
        public Datos() {
            conexion = new SqlConnection {
                ConnectionString = CadenaConexion
            };
        }
        void AbrirConexion() {
            try
            {
                if (conexion.State == ConnectionState.Closed)
                {
                    conexion.Open();
                }
            }
            catch (Exception ex) {
                throw ex;
            }
        }
        void CerrarConexion() {
            try
            {
                if (conexion.State == ConnectionState.Open)
                {
                    conexion.Close();
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        SqlCommand InicializarComando(SqlConnection con, CommandType comandtype, string query) {
            SqlCommand com = new SqlCommand {
                Connection = con,
                CommandType = comandtype,
                CommandText = query
            };
            return com;
        }
        SqlCommand InicializarComando(SqlConnection con, CommandType comandtype)
        {
            SqlCommand com = new SqlCommand {
                Connection = con,
                CommandType = comandtype
            };
            return com;
        }
        public List<Departamento> Listardepartamentos()
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "Listardepartamentos");
                read = comand.ExecuteReader();
                List<Departamento> departamentos = new List<Departamento>();
                while (read.Read())
                {
                    Departamento departamento = new Departamento
                    {
                        Id = int.Parse(read["id"].ToString()),
                        Nombre = read["nombre"].ToString()
                    };
                    departamentos.Add(departamento);
                }
                return departamentos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }

        }
        public List<Municipio> ListarMunicipiosPorDepartamento(int idDepartamento)
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ListarMunicipiosPorDepartamento");
                comand.Parameters.Add("id", SqlDbType.Int).Value = idDepartamento;
                read = comand.ExecuteReader();
                List<Municipio> municipios = new List<Municipio>();
                while (read.Read())
                {
                    Municipio municipio = new Municipio
                    {
                        Id = int.Parse(read["id"].ToString()),
                        Nombre = read["nombre"].ToString(),
                        IdDepartamento = int.Parse(read["idDepartamento"].ToString())
                    };
                    municipios.Add(municipio);
                }
                return municipios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public List<Estado> ListarEstados()
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ListarEstados");
                read = comand.ExecuteReader();
                List<Estado> estados = new List<Estado>();
                while (read.Read())
                {
                    Estado estado = new Estado
                    {
                        Id = int.Parse(read["id"].ToString()),
                        Nombre = read["nombre"].ToString()
                    };
                    estados.Add(estado);
                }
                return estados;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public List<Cliente> ListarClientes()
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ListarClientes");
                read = comand.ExecuteReader();
                List<Cliente> clientes = new List<Cliente>();
                while (read.Read())
                {
                    Cliente cliente = new Cliente
                    {
                        Id = int.Parse(read["id"].ToString()),
                        Identificacion = read["Identificacion"].ToString(),
                        Nombre = read["nombre"].ToString(),
                        Apellido = read["apellido"].ToString(),
                        Telefono = read["telefono"].ToString(),
                        Correo = read["correo"].ToString(),
                        IdDepartamento = int.Parse(read["IdDepartamento"].ToString()),
                        Deepartamento = read["Deepartamento"].ToString(),
                        IdCiudad = int.Parse(read["idciudad"].ToString()),
                        Ciudad = read["ciudad"].ToString(),
                        FechaNacimento = DateTime.Parse(read["FechaNacimento"].ToString()),
                        Edad = int.Parse(read["edad"].ToString()),
                        CantidadEventos = int.Parse(read["cantidadEventos"].ToString())
                    };
                    clientes.Add(cliente);
                }
                return clientes;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public List<Evento> ListarEventos()
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ListarEventos");
                read = comand.ExecuteReader();
                List<Evento> eventos = new List<Evento>();
                while (read.Read())
                {
                    Evento evento = new Evento
                    {
                        Id = int.Parse(read["id"].ToString()),
                        Identificacion =read["Identificacion"].ToString (),
                        IdEstado = int.Parse(read["idestado"].ToString()),
                        IdCliente = int.Parse(read["idcliente"].ToString()),
                        IdMotivo = int.Parse(read["idmotivo"].ToString()),
                        Motivo = read["motivo"].ToString(),
                        CantidadPersonas = int.Parse(read["CantidadPersonas"].ToString()),
                        Estado = read["estado"].ToString(),
                        FechaEvento = DateTime.Parse(read["FechaEvento"].ToString()),
                        Observaciones = read["observaciones"].ToString()
                    };
                    eventos.Add(evento);
                }
                return eventos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public void ActualizarClientes(string Identificacion, string Nombre, string Apellido, string Telefono,
                                      string Correo, int idDepartamento, int idCiudad, DateTime FechaNacimento, int id)
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ActualizarClientes");
                comand.Parameters.Add("Identificacion", SqlDbType.VarChar).Value = Identificacion;
                comand.Parameters.Add("nombre", SqlDbType.VarChar).Value = Nombre;
                comand.Parameters.Add("apellido", SqlDbType.VarChar).Value = Apellido;
                comand.Parameters.Add("telefono", SqlDbType.VarChar).Value = Telefono;
                comand.Parameters.Add("Correo", SqlDbType.VarChar).Value = Correo;
                comand.Parameters.Add("idDepartamento", SqlDbType.Int).Value = idDepartamento;
                comand.Parameters.Add("idciudad", SqlDbType.Int).Value = idCiudad;
                comand.Parameters.Add("FechaNacimento", SqlDbType.DateTime).Value = FechaNacimento;
                comand.Parameters.Add("id", SqlDbType.Int ).Value = id;
                comand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public void  ActualizarEventos(int Id, DateTime fechaEvento, int CantidadPersonas,
                                                    int IdMotivo, string Observaciones, int IdEstado)
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ActualizarEventos");
                comand.Parameters.Add("id", SqlDbType.Int).Value = Id;
                comand.Parameters.Add("fechaevento", SqlDbType.DateTime).Value = fechaEvento;
                comand.Parameters.Add("cantidadpersonas", SqlDbType.Int).Value = CantidadPersonas;
                comand.Parameters.Add("idmotivo", SqlDbType.Int).Value = IdMotivo;
                comand.Parameters.Add("Observaciones", SqlDbType.VarChar).Value = Observaciones;
                comand.Parameters.Add("Idestado", SqlDbType.Int).Value = IdEstado;
                comand.ExecuteNonQuery();
            } 
            catch (Exception ex )
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public void InsertarEventos(int IdCliente , DateTime fechaEvento,int CantidadPersonas,
                                                    int IdMotivo,string Observaciones,int  IdEstado)
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "InsertarEventos");
                comand.Parameters.Add("idcliente", SqlDbType.Int).Value = IdCliente;
                comand.Parameters.Add("fechaevento", SqlDbType.DateTime).Value = fechaEvento;
                comand.Parameters.Add("cantidadpersonas", SqlDbType.Int).Value = CantidadPersonas;
                comand.Parameters.Add("idmotivo", SqlDbType.Int).Value = IdMotivo;
                comand.Parameters.Add("Observaciones", SqlDbType.VarChar).Value = Observaciones;
                comand.Parameters.Add("Idestado", SqlDbType.Int).Value = IdEstado;
                comand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public void InsertarClientes(string Identificacion,string Nombre,string Apellido,string Telefono,
                                      string Correo, int idDepartamento,int idCiudad,DateTime FechaNacimento)
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "InsertarClientes");
                comand.Parameters.Add("Identificacion", SqlDbType.VarChar).Value = Identificacion;
                comand.Parameters.Add("nombre", SqlDbType.VarChar).Value = Nombre ;
                comand.Parameters.Add("apellido", SqlDbType.VarChar).Value = Apellido ;
                comand.Parameters.Add("telefono", SqlDbType.VarChar).Value = Telefono ;
                comand.Parameters.Add("Correo", SqlDbType.VarChar).Value = Correo;
                comand.Parameters.Add("idDepartamento", SqlDbType.Int ).Value = idDepartamento ;
                comand.Parameters.Add("idciudad", SqlDbType.Int).Value = idCiudad ;
                comand.Parameters.Add("FechaNacimento", SqlDbType.DateTime ).Value =FechaNacimento ;
                comand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
        public List <Motivo > ListarMotivos()
        {
            try
            {
                AbrirConexion();
                comand = InicializarComando(conexion, CommandType.StoredProcedure, "ListarMotivos");
                read = comand.ExecuteReader();
                List<Motivo> motivos = new List<Motivo>();
                while (read .Read ())
                {
                    Motivo motivo = new Motivo
                    {
                        Id = int.Parse(read["id"].ToString()),
                        Nombre = read["nombre"].ToString()
                    };
                    motivos.Add(motivo);
                }
                return motivos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
    }
}
