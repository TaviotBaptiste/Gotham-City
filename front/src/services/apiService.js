import axios from 'axios';

export async function getAllUsers() {

    const response = await axios.get('http://localhost:4000/api/users');
    return response.data;
}

export async function createUser(data) {
    const response = await axios.post(`http://localhost:4000/api/users`, { user: data });
    return response.data;
}








