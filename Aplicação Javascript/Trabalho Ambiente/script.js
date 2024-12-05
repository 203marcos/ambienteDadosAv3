function mostrarUsuarios() {
    console.log('Fetching users...');
    fetch('http://localhost:3000/get-users')
        .then(response => {
            console.log('Response received:', response);
            return response.json();
        })
        .then(data => {
            console.log('Data received:', data);
            const { users, total } = data;
            let userList = '<h3>Primeiros 50 Usuários:</h3><ul>';
            users.forEach(user => {
                userList += `<li>${user.nome} - ${user.email}</li>`;
            });
            userList += '</ul>';
            userList += `<p>Total de Usuários: ${total}</p>`;
            
            document.getElementById('userList').innerHTML = userList;
            document.getElementById('userModal').style.display = 'block';
            console.log('User list updated in the DOM');
        })
        .catch(error => console.error('Error:', error));
}

function fecharModal() {
    document.getElementById('userModal').style.display = 'none';
}

function abrirModalAdicionarUsuario() {
    document.getElementById('addUserModal').style.display = 'block';
}

function fecharModalAdicionarUsuario() {
    document.getElementById('addUserModal').style.display = 'none';
}

function adicionarUsuario() {
    const form = document.getElementById('addUserForm');
    const formData = new FormData(form);
    const user = {
        id_usuario: formData.get('id_usuario'),
        nome: formData.get('nome'),
        email: formData.get('email'),
        data_nascimento: formData.get('data_nascimento'),
        senha: formData.get('senha'),
        plano_assinatura: formData.get('plano_assinatura')
    };

    console.log('Adding user...', user);
    fetch('http://localhost:3000/add-user', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(user)
    })
    .then(response => {
        console.log('Response received:', response);
        return response.text();
    })
    .then(data => {
        console.log('Data received:', data);
        alert(data);
        fecharModalAdicionarUsuario();
    })
    .catch(error => console.error('Error:', error));
}

function adicionarUsuariosTeste() {
    console.log('Adding fifty users...');
    fetch('http://localhost:3000/add-fifty-users')
        .then(response => {
            console.log('Response received:', response);
            return response.text();
        })
        .then(data => {
            console.log('Data received:', data);
            alert(data);
            alert("50 usuários de teste adicionados!");
        })
        .catch(error => console.error('Error:', error));
}

function adicionarUmMilhaoUsuarios() {
    console.log('Adding one million users...');
    fetch('http://localhost:3000/add-million-users')
        .then(response => {
            console.log('Response received:', response);
            return response.text();
        })
        .then(data => {
            console.log('Data received:', data);
            alert(data);
            alert("1 milhão de usuários adicionados!");
        })
        .catch(error => console.error('Error:', error));
}