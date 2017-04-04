<?php

/**
 * Tickets_tb
 * @package opensourcepos 3.0.2
 * @version 0.1
 * Modelo de la tabla tickets
 */
class Tickets_tb extends CI_Model {

    /**
     * env
     * Caracteristicas importantes de la tabla
     * "name" => "Nombre de la Tabla"
     * @var array 
     */
    protected $env;

    public function __construct() {
        parent::__construct();
        $this->env = array(
            'name' => 'tickets'
        );
    }

    /**
     * create
     * Inserta un registro en la tabla
     * @param array $dataRegister Array asociativo con los datos del registro
     * @return mixed array con el registro o false
     */
    public function create($dataRegister) {
        if ($this->db->insert($this->env['name'], $dataRegister)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /**
     * read
     * Lee un registro de la tabla
     * @param type $idRegister Llave primaria del registro en la tabla
     * @return mixed array con el registro o false
     */
    public function read($idRegister) {
        $this->db->where('id_ticket', $idRegister);
        $result = $this->db->get($this->env['name']);
        return $result->result_array()[0];
    }

    /**
     * delete
     * Elimina un registro de la tabla
     * @param type $idRegister Llave primaria del registro en la tabla
     * @return boolean
     */
    public function delete($idRegister) {
        $this->db->where('id', $idRegister);
        if ($this->db->delete($this->env['name'])) {
            $this->db->where('id_account', $idRegister);
            if ($this->db->delete('transactions')) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

    /**
     * update
     * @param array $dataRegister Array asociativo con los datos del registro
     * @param int $idRegister Llave primaria del registro en la tabla
     */
    public function update($dataRegister, $idRegister) {
        $this->db->where('id_ticket', $idRegister);
        if ($this->db->update($this->env['name'], $dataRegister)) {
            return $this->read($idRegister);
        } else {
            return FALSE;
        }
    }

    /**
     * get_used
     * @param string $time hora de la funcion
     * Obtiene un array con los asientos ocupados de una funcion
     */
    public function get_used($date, $time = FALSE) {
        $this->db->where_in('status', array('used', 'blocked'));
        $this->db->where('dt_show', $date);


        if ($time) {
            $this->db->where('schedule', $time);
        }

        $result = $this->db->get('tickets');

        if ($result->num_rows()) {
            return $result->result_array();
        } else {
            return FALSE;
        }
    }

    public function complete_sale($transaction, $id_sale) {
        $ticketsData = array(
            'sale_id' => $id_sale,
            'status' => 'used'
        );

        $this->db->where('transaction', $transaction);
        if ($this->db->update('tickets', $ticketsData)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function sale($sale_id) {
        $this->db->where('sale_id', $sale_id);
        $result = $this->db->get('tickets');
        if ($result->num_rows()) {
            return $result->result_array();
        } else {
            return FALSE;
        }
    }

}
