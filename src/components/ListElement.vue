<template>
    <tr>
        <td>{{ props.room.id }}</td>
        <td>{{ props.room.name }}</td>
        <td>{{ props.room.occupied }}</td>
    </tr>
</template>


<script setup lang="ts">
import { defineProps } from 'vue';
import { Room } from '../../types/Room';

const props = defineProps<{
    room: Room;
}>();

console.log(props);
</script>
