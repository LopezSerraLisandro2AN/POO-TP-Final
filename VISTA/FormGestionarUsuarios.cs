﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CONTROLADORA;
using MODELO;

namespace VISTA
{
    public partial class FormGestionarUsuarios : Form
    {
        private readonly ControladoraUsuarios userControl = ControladoraUsuarios.obtener_instancia();
        private readonly ControladoraPerfiles profileControl = ControladoraPerfiles.obtener_instancia();

        private readonly int usuarioId;
        public FormGestionarUsuarios(int usuarioId)
        {
            this.usuarioId = usuarioId;
            InitializeComponent();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            RegistroForm form = new RegistroForm();
            DialogResult result = form.ShowDialog();
            if (result == DialogResult.OK) UpdateUsers();
        }

        private void FormGestionarUsuarios_Load(object sender, EventArgs e)
        {
            UpdateUsers();
        }

        private void UpdateUsers()
        {
            try
            {
                Usuario loggedUser = userControl.Obtener_Usuario(usuarioId);
                List<Usuario> availableUsers = new List<Usuario>
                {
                    loggedUser
                };

                switch (loggedUser.Perfil.Id)
                {
                    case Perfil.SUPER_ADMIN:
                        {
                            availableUsers.AddRange(userControl.Listar_Usuarios().FindAll(usuario => usuario.Id != loggedUser.Id));
                        };
                        break;
                    case Perfil.ADMIN:
                        {
                            availableUsers.AddRange(userControl.Listar_Usuarios().FindAll(usuario => usuario.Id != loggedUser.Id && usuario.Perfil.Id == 1));
                        };
                        break;
                };


                dgvGestionarUsuarios.DataSource = null;
                dgvGestionarUsuarios.DataSource = availableUsers;
                dgvGestionarUsuarios.Columns[4].Visible = false;

                bool isClient = loggedUser.Perfil.Id == Perfil.CLIENT;
                btnAgregar.Visible = !isClient;
                btnEliminar.Visible = !isClient;
            }
            catch (Exception Ex)
            {
                DialogResult dialogResult = MessageBox.Show("Error al cargar los usuario: " + Ex.Message);
                if (dialogResult == DialogResult.OK) this.Close();
            }
        }

        private void dgvGestionarUsuarios_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                foreach(DataGridViewRow selectedRow in dgvGestionarUsuarios.SelectedRows)
                {
                    Usuario selectedUser = selectedRow.DataBoundItem as Usuario;
                    userControl.Eliminar_Usuario(selectedUser);
                }
                
                UpdateUsers();
            } catch(Exception error)
            {
                ShowError("Error al eliminar usuario: " + error.Message);
            }
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int id = (Convert.ToInt32(dgvGestionarUsuarios.CurrentRow.Cells[0].Value));
            Usuario selected = CONTROLADORA.ControladoraUsuarios.obtener_instancia().Obtener_Usuario(id); 


            FormModificarUsuario form = new FormModificarUsuario(selected);
            DialogResult result = form.ShowDialog();
            if (result == DialogResult.OK) UpdateUsers();
        }

        private void ShowError(string msg)
        {
            MessageBox.Show(msg, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
