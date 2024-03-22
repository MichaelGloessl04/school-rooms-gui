<template>
    <RoomList :rooms="rooms" />
</template>


<script setup lang="ts">
import RoomList from './components/RoomList.vue';

import { Ref, ref, onMounted } from 'vue';
import { Room } from '../types/Room';

const rooms: Ref<Room[]> = ref([]);

const fetchRooms = async () => {
    const response = await fetch('http://localhost:80/rooms/');
    rooms.value = await response.json();
    console.log(rooms.value);
};

onMounted(() => {
    fetchRooms();
});
</script>
