import decode from 'jwt-decode'
import axios from 'axios'

const REST = 'http://localhost:4000/'
const TOKEN = 'token'

export function loginUser(email, password) {
    return new Promise(async (resolve, reject) => {
        try {
            let res = await axios({
                url: `${REST}api/users/login/`,
                method: 'POST',
                data: {
                    email: email,
                    password: password,
                    grant_type: 'password'
                }
            })
            setAuthToken(res.data.token)
            resolve()
        } catch (err) {
        }
    })
}
export function logoutUser() {
    clearAuthToken()
}

export function setAuthToken(token) {
    axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    localStorage.setItem(TOKEN, token)
}

export function getAuthToken() {
    return localStorage.getItem(TOKEN)
}

export function clearAuthToken() {
    axios.defaults.headers.common['Authorization'] = ''
    localStorage.removeItem(TOKEN)
}

export function isLoggedIn() {
    let authToken = getAuthToken()
    return !!authToken && !isTokenExpired(authToken)
}
export async function isAdmin() {
    let authToken = getAuthToken()
    const config = { headers: { 'Authorization': `Bearer ${authToken}` } }
    const response = await axios.get('http://localhost:4000/api/token/', config)
    if (response["data"]["data"]["id"] == "5") {
        return !!authToken && !isTokenExpired(authToken)
    }
}

export function getUserInfo() {
    if (isLoggedIn()) {
        return decode(getAuthToken())
    }
}

function getTokenExpirationDate(encodedToken) {
    let token = decode(encodedToken)
    if (!token.exp) {
        return null
    }

    let date = new Date(0)
    date.setUTCSeconds(token.exp)

    return date
}

function isTokenExpired(token) {
    let expirationDate = getTokenExpirationDate(token)
    return expirationDate < new Date()
}