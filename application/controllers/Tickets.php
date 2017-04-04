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

    /**
     * 
     * @return type
     */
    public function get_used() {
        $used = $this->tickets_tb->get_used($this->input->get('date'), $this->input->get('time'));

        if ($used) {
            foreach ($used as $ticket) {
                if ($ticket['status'] != 'blocked') {
                    continue;
                }

                $time1 = strtotime(date('Y-m-d H:i:s'));
                $time2 = strtotime($ticket['status_time']);
                $interval = abs($time1 - $time2);
                $minutes = round($interval / 60);

                if ($minutes > 3) {
                    //Volver a poner el ticket como disponible
                    $dataTicket = array(
                        'status' => 'canceled'
                    );

                    $this->tickets_tb->update($dataTicket, $ticket['id_ticket']);
                }
            }
            
        }
        
        $used = $this->tickets_tb->get_used($this->input->get('date'), $this->input->get('time'));
        if (!$used) {
            return $this->ajax_response(404, FALSE, 'No hay registros');
        } else {
            return $this->ajax_response(200, TRUE, 'Hay registros', $used);
        }
    }

    /**
     * 
     */
    public function request() {
        $time = $this->input->post('time');
        $date = $this->input->post('date');
        $seats = $this->input->post('seats');
        $map = $this->map();
        $tranza = md5(date('Y-m-d h:i:s'));
        $this->session->set_userdata('transaction', $tranza);
        $this->session->set_userdata('seats_show', $time);
        foreach ($seats as $key => $seat) {

            $dataSeat = array(
                'schedule' => $time,
                'seat' => $seat,
                'num_seat' => $map[$seat],
                'status' => 'blocked',
                'dt_show' => $date,
                'transaction' => $tranza
            );

            if (!$this->tickets_tb->create($dataSeat)) {
                return $this->ajax_response(500, FALSE, 'Ocurrio un error');
            }
        }

        return $this->ajax_response(200, TRUE, 'Los asientos se apartaron', $tranza);
    }

    protected function map() {
        return $map = array(
            '1_1' => 1,
            '1_3' => 2,
            '1_5' => 3,
            '2_2' => 4,
            '2_4' => 5,
            '3_1' => 6,
            '3_3' => 7,
            '3_5' => 8,
            '4_2' => 9,
            '4_4' => 10,
            '5_1' => 11,
            '5_3' => 12,
            '5_5' => 13,
            '6_2' => 14,
            '6_4' => 15,
            '7_3' => 16,
            '7_5' => 17,
            '8_2' => 18,
            '8_4' => 19,
            '9_3' => 20,
            '9_5' => 21,
            '10_2' => 22,
            '10_4' => 23,
            '11_3' => 24,
            '11_5' => 25,
        );
    }

    public function infophp() {
        return phpinfo();
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

        return $this->output
                        ->set_content_type('application/json')
                        ->set_status_header(200)
                        ->set_output(json_encode($resTranza));
    }

}
