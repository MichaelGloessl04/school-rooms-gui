<template>
    <div class="list-box" @click="collapsed = !collapsed">
        <h2>Rooms</h2>
        <table v-if="!collapsed">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>occupied</th>
                    <th>by</th>
                </tr>
            </thead>
            <tbody>
                <RoomListElement v-for="room in props.rooms" :key="room.id" :room="room" />
            </tbody>
        </table>
    </div>
</template>


<script setup lang="ts">
import { ref, Ref } from 'vue';
import RoomListElement from './RoomListElement.vue';
import { Room } from '../../types/Room';

const collapsed: Ref<Boolean> = ref(true);

const props = defineProps<{
    rooms: Room[];
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

.list-box {
    margin-top: 20px;
    padding: 10px;
    border: 1px solid black;
    border-radius: 5px;
    background-color: #282828;
    color: white;
    cursor: pointer;
    width: max-content;
}
</style>./RoomListElement.vue
