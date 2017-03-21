<?php
/**
 * Tickets_tb
 * @package opensourcepos 3.0.2
 * @version 0.1
 * Modelo de la tabla tickets
 */
class Tickets_tb extends CI_Model {
    
    /**
     * get_used
     * @param string $time hora de la funcion
     * Obtiene un array con los asientos ocupados de una funcion
     */
    public function get_used($time = FALSE) {
        $this->db->where('dt_show', date('Y-m-d'));
        $this->db->where('status', 'active');
        if ($time) {
            $this->db->where('schedule', $time);
        }
        
        $result = $this->db->get('tickets');
        
        if($result->num_rows()){
            return $result->result_array();
        }else{
            return FALSE;
        }
    }

}
