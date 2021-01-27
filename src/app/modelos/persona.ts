export interface Persona {
    id?: number;
    cedula: string;
    apellidoPaterno: string;
    apellidoMaterno: string;
    primerNombre: string;
    segundoNombre: string;
    idLugar: number;
    seguro?: string;
}
