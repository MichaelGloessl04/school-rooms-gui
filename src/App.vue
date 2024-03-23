<template>
    <ReservationList :reservations="reservations" />
</template>


<script setup lang="ts">
import ReservationList from './components/ReservationList.vue';

import { Ref, ref, onMounted } from 'vue';
import { RawReservation, Reservation } from '../types/Reservation';
import { User } from '../types/User';
import { Room } from '../types/Room';

const rooms: Ref<Room[]> = ref([]);
const reservations: Ref<Reservation[]> = ref([]);
const users: Ref<User[]> = ref([]);

const fetchRooms = async () => {
    const response = await fetch('http://localhost:80/rooms/');
    rooms.value = await response.json();
    console.log('Fetched rooms:');
    console.log(rooms.value);
};

const fetchRoom = async (id: number) => {
    const response = await fetch(`http://localhost:80/rooms/${id}`);
    const room: Room = await response.json();
    console.log(`Fetched room with id ${id}:`);
    console.log(room);
    return room;
};

const fetchUsers = async () => {
    const response = await fetch('http://localhost:80/users/');
    users.value = await response.json();
    console.log('Fetched users:');
    console.log(users.value);
};

const fetchUser = async (id: number) => {
    const response = await fetch(`http://localhost:80/users/${id}`);
    const user: User = await response.json();
    console.log(`Fetched user with id ${id}:`);
    console.log(user);
    return user;
};

const fetchReservations = async () => {
    const response = await fetch('http://localhost:80/reservations/');
    const raw_reservations: RawReservation[] = await response.json();
    for (const raw_reservation of raw_reservations) {
        const room = await fetchRoom(raw_reservation.room_id);
        const user = await fetchUser(raw_reservation.user_id);
        reservations.value.push({
            id: raw_reservation.id,
            room: room,
            user: user,
            start: raw_reservation.start,
            end: raw_reservation.end
        });
    }
    console.log('Fetched reservations:');
    console.log(reservations.value);
};

onMounted(() => {
    fetchRooms();
    fetchUsers();
    fetchReservations();
});
</script>
