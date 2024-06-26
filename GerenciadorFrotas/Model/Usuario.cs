﻿using GerenciadorFrotas.Data;
using GerenciadorFrotas.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace GerenciadorFrotas.Model
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Login { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public bool Ativo { get; set; }

        public Usuario()
        {
            Id = 0;
            Login = string.Empty;
            Nome = string.Empty;
            Email = string.Empty;
            Senha = string.Empty;
            Ativo = false;
        }

        AcessoDAO acessoDAO = new AcessoDAO();
        DataTable dataTable = new DataTable();
        List<SqlParameter> parameters = new List<SqlParameter>();
        StringBuilder sql;

        public DataTable Consultar()
        {
            sql = new StringBuilder();

            try
            {
                parameters.Clear();
                sql.Append("SELECT id, login, nome, email, senha, ativo \n");
                sql.Append("FROM tblUsuario \n");

                if (Id != 0)
                {
                    sql.Append("WHERE id = @id \n");
                    parameters.Add(new SqlParameter("@id", Id));

                } else if (Login != string.Empty)
                {
                    sql.Append("WHERE login = @Login \n");
                    parameters.Add(new SqlParameter("@Login", Login));

                } else if (Nome != string.Empty)
                {
                    sql.Append("WHERE nome like @nome \n");
                    parameters.Add(new SqlParameter("@nome", DatabaseUtils.LikeFormatter(Nome)));
                }
                dataTable = acessoDAO.Consultar(sql.ToString(), parameters);

                if (Id != 0 || Login != string.Empty && dataTable.Rows.Count == 1)
                {
                    Id = Convert.ToInt32(dataTable.Rows[0]["id"]);
                    Login = dataTable.Rows[0]["login"].ToString();
                    Email = dataTable.Rows[0]["email"].ToString();
                    Nome = dataTable.Rows[0]["nome"].ToString();
                    Senha = dataTable.Rows[0]["Senha"].ToString();
                    Ativo = Convert.ToBoolean(dataTable.Rows[0]["ativo"]);
                }

                return dataTable;
            } catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public bool Autenticar(string senha)
        {
            return senha == Senha;
        }

        public void Gravar()
        {
            sql = new StringBuilder();

            try
            {
                parameters.Clear();

                if (Id == 0)
                {
                    sql.Append("INSERT INTO tblUsuario \n");
                    sql.Append("(login, nome, email, senha, ativo) \n");
                    sql.Append("VALUES \n");
                    sql.Append("(@login, @nome, @email, @senha, @ativo) \n");

                } else
                {
                    sql.Append("UPDATE tblUsuario \n");
                    sql.Append("SET \n");
                    sql.Append("login       = @login, \n");
                    sql.Append("nome        = @nome, \n");
                    sql.Append("email       = @email, \n");
                    sql.Append("senha       = @senha, \n");
                    sql.Append("ativo       = @ativo \n");
                    sql.Append("WHERE id = @id \n");

                    parameters.Add(new SqlParameter("@id", Id));
                }

                parameters.Add(new SqlParameter("@login", Login));
                parameters.Add(new SqlParameter("@nome", Nome));
                parameters.Add(new SqlParameter("@email", Email));
                parameters.Add(new SqlParameter("@senha", Senha));
                parameters.Add(new SqlParameter("@ativo", Ativo));

                acessoDAO.Executar(sql.ToString(), parameters);
            } catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
