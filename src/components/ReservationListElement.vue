<template>
    <tr>
        <td>{{ props.reservation.room.name }}</td>
        <td>{{ [props.reservation.user.name, props.reservation.user.surname].join(' ') }}</td>
        <td>{{ formatDate(props.reservation.start) }}</td>
        <td>{{ formatDate(props.reservation.end) }}</td>
    </tr>
</template>


<script setup lang="ts">
import { Reservation } from '../../types/Reservation';

const props = defineProps<{
    reservation: Reservation;
}>();

const formatDate = (date: Date) => {
    return new Date(date).toLocaleString();
};
</script>
