export type ContactStatus = 'Cliente' | 'Lead' | 'Inactivo'
export type ClientType = 'Hospital/Clínica' | 'Doctor'
export type Stage = 'Prospección' | 'Propuesta' | 'Negociación' | 'Ganada' | 'Perdida'
export interface Contact { id: number; name: string; company: string; email: string; phone: string; status: ContactStatus; clientType: ClientType; specialty?: string; initials: string; color: string }
export interface Opportunity { id: number; title: string; company: string; value: number; stage: Stage; close: string }
export interface Appointment { id: number; title: string; date: string; time: string; contact?: string; type: string }

export const contacts: Contact[] = [
  { id: 1, name: 'Ana García', company: 'Acme', email: 'ana@acme.example', phone: '+34 600 000 001', status: 'Cliente', clientType: 'Hospital/Clínica', initials: 'AG', color: 'coral' },
  { id: 2, name: 'Luis Martín', company: 'Northwind', email: 'luis@northwind.example', phone: '+34 600 000 002', status: 'Lead', clientType: 'Doctor', specialty: 'Cardiología', initials: 'LM', color: 'violet' },
  { id: 3, name: 'Sofía López', company: 'Globex', email: 'sofia@globex.example', phone: '+34 600 000 003', status: 'Cliente', clientType: 'Hospital/Clínica', initials: 'SL', color: 'teal' },
  { id: 4, name: 'Carlos Ruiz', company: 'Umbrella', email: 'carlos@umbrella.example', phone: '+34 600 000 004', status: 'Lead', clientType: 'Doctor', specialty: 'Traumatología', initials: 'CR', color: 'amber' },
  { id: 5, name: 'Elena Torres', company: 'Initech', email: 'elena@initech.example', phone: '+34 600 000 005', status: 'Inactivo', clientType: 'Hospital/Clínica', initials: 'ET', color: 'blue' },
]
export const opportunities: Opportunity[] = [
  { id: 1, title: 'Renovación anual', company: 'Acme', value: 18500, stage: 'Negociación', close: '12 jun 2024' },
  { id: 2, title: 'Implantación CRM', company: 'Northwind', value: 32000, stage: 'Propuesta', close: '28 jun 2024' },
  { id: 3, title: 'Servicios de soporte', company: 'Globex', value: 12400, stage: 'Prospección', close: '06 jul 2024' },
  { id: 4, title: 'Expansión internacional', company: 'Umbrella', value: 45000, stage: 'Negociación', close: '19 jul 2024' },
]
export const appointments: Appointment[] = [
  { id: 1, title: 'Demo de producto', date: 'Hoy, 14 jun', time: '10:30', contact: 'Luis Martín', type: 'Videollamada' },
  { id: 2, title: 'Revisión de contrato', date: 'Mañana, 15 jun', time: '09:00', contact: 'Ana García', type: 'Reunión' },
  { id: 3, title: 'Seguimiento comercial', date: 'Lun, 17 jun', time: '16:00', contact: 'Carlos Ruiz', type: 'Llamada' },
]
export const euro = (value: number) => new Intl.NumberFormat('es-ES', { style: 'currency', currency: 'EUR', maximumFractionDigits: 0 }).format(value)
