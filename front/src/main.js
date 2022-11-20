import { createApp } from 'vue'
import 'bootstrap'; import 'bootstrap/dist/css/bootstrap.min.css'
import "bootstrap/dist/css/bootstrap.min.css"
import 'jquery/dist/jquery.min.js';
import 'datatables.net-dt/js/dataTables.dataTables'
import 'datatables.net-dt/css/jquery.dataTables.min.css'
 
import App from './App.vue'
import router from './router';
//PrimeVue
import PrimeVue from 'primevue/config';
import 'primevue/resources/themes/bootstrap4-light-blue/theme.css';
import 'primevue/resources/primevue.min.css';
import 'primeicons/primeicons.css';
import ConfirmationService from 'primevue/confirmationservice';
import ToastService from 'primevue/toastservice';

//Datatable
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

if (typeof window !== "undefined") {
    if (localStorage.getItem("watchlist")) {
        let token = JSON.parse(localStorage.getItem('token'));
        if (token) {
            window.axios.defaults.headers.common['Authorization'] = 'Bearer ' + token;
        } else {
            localStorage.clear();
        }
    }
}

const app = createApp(App);
app.use(PrimeVue);
app.use(ConfirmationService);
app.use(ToastService);
app.use(router);
app.mount('#app');