import { Room } from './Room';
import { User } from './User';


export type RawReservation = {
    id: string;
    start: Date;
    end: Date;
    user_id: number;
    room_id: number;
};


export type Reservation = {
    id: string;
    start: Date;
    end: Date;
    user: User;
    room: Room;
};


export type ReservationNoId = Omit<Reservation, 'id'>;
