import { createRouter, createWebHistory, } from 'vue-router'
import Admin from './components/Admin.vue'
import Board from './components/Board.vue'
import Team from './components/Team.vue'
import Login from './components/Login.vue'
import Profile from './components/Profile.vue'
import { isLoggedIn, isAdmin } from './utils/auth'

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            name: 'home',
            component: Profile
        },
        {
            path: '/login',
            name: 'login',
            component: Login,
            meta: {
                allowAnonymous: true,
            }
        },
        {
            path: '/admin',
            name: 'admin',
            component: Admin,
        },
        {
            path: '/board',
            name: 'board',
            component: Board
        },
        {
            path: '/profile',
            name: 'profile',
            component: Profile
        },
        {
            path: '/team',
            name: 'team',
            component: Team
        }
    ]
})

router.beforeEach((to, from, next) => {
    if (to.name == 'login' && isLoggedIn()) {
        next({ path: '/' })
    }
    else if (!to.meta.allowAnonymous && !isLoggedIn()) {
        next({
            path: '/login',
            query: { redirect: to.fullPath }
        })
    }
    else {
        next()
    }
})

export default router;  