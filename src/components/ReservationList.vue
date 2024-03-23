<template>
    <table>
        <thead>
            <tr>
                <th>Room</th>
                <th>User</th>
                <th>Start</th>
                <th>End</th>
            </tr>
        </thead>
        <tbody>
            <ReservationListElement v-for="reservation in props.reservations" :key="reservation.id" :reservation="reservation" />
        </tbody>
    </table>
</template>


<script setup lang="ts">
import ReservationListElement from './ReservationListElement.vue';
import { Reservation } from '../../types/Reservation';

const props = defineProps<{
    reservations: Reservation[];
}>();
</script>

<style scoped>
table {
    width: 100%;
    border-collapse: collapse;
}

th, td, tr {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #202020;
    min-width: 200px;
}

tr {
    border: none;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #1d1d1d;
}

tr:hover {
    background-color: #464646;
}
</style>./ReservationListElement.vue
