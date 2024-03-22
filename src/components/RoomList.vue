<template>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Occupied</th>
            </tr>
        </thead>
        <tbody>
            <ListElement v-for="room in props.rooms" :room="room" />
        </tbody>
    </table>
</template>


<script setup lang="ts">
import ListElement from './ListElement.vue';
import { defineProps } from 'vue';
import { Room } from '../../types/Room';

const props = defineProps<{
    rooms: Room[];
}>();
</script>
