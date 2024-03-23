<template>
    <tr>
        <td>{{ props.room.name }}</td>
        <td>{{ props.room.occupied }}</td>
        <td>{{ getOccupant(props.room.id) }}</td>
    </tr>
</template>


<script setup lang="ts">
import axios from 'axios';
import { Room } from '../../types/Room';

const props = defineProps<{
    room: Room;
}>();

const getOccupant = (roomId: number) => {
    const response = axios.get(`http://localhost:3000/rooms/${roomId}/occupant`);
};
</script>
