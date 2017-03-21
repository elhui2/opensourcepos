<?php

/**
 * Tickets
 * @package opensourcepos 3.0.2
 * @version 0.1
 * Controlador de tickets
 */
defined('BASEPATH') or exit('No direct script access allowed');

class Tickets extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('tickets_tb');
    }

    public function get_used() {
        $used = $this->tickets_tb->get_used($this->input->get('time'));

        if (!$used) {
            return $this->ajax_response(404, FALSE, 'Nu hay registros');
        } else {
            return $this->ajax_response(404, FALSE, 'Nu hay registros', $used);
        }
    }

    /**
     * ajax_response
     * Todas las repuestas para ajax en json
     * @version 0.1
     * @param int $code Codigo http de la transaccion
     * @param boolean $status Estatus de la operacion
     * @param string $message Mensaje de la transaccion
     * @param array $response Datos de la transaccion OPCIONAL
     * @return type
     */
    protected function ajax_response($code, $status, $message, $response = NULL) {

        $resTranza = array(
            'code' => $code,
            'status' => $status,
            'message' => $message,
            'response' => $response
        );

        error_log(json_encode($resTranza));

        return $this->output
                        ->set_content_type('application/json')
                        ->set_status_header(200)
                        ->set_output(json_encode($resTranza));
    }

}
