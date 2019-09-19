<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('session');
        $this->load->library('form_validation');
        $this->load->Model('MainModel');
        date_default_timezone_set('Asia/Kolkata');

    }
    public function mainpage($data = '')
    {
        $this->load->view('dataplay/index',$data);
    }
    public function course() 
    {
        $this->load->view('dataplay/course');
    }
    public function coursepage()
    {
        // $this->load->Model('NotesModel');
        if($this->session->userdata('isUserLoggedIn')){
            // $sheet = $this->MainModel->coursedata($this->session->userdata('usersecondId'));
            //redirect(CTRL."Main/".$this->session->userdata('usersecondid'));
            $user_id = $this->session->userdata['usersecondId'];
            $course_data = $this->MainModel->coursedatamodel($user_id);
            if ($course_data['status']) {
                $this->load->view('dataplay/courses',$course_data);
            } else {
                redirect(CTRL."Main/mainpage");
            }
            
        }
        else{
            redirect(CTRL."Main/mainpage");
        }
        
    }
    public function new_register(){
        if(isset($_POST['submit']))
        {
            $data=array();
            $data['user_second_id'] = md5($_POST['first_name'].$_POST['email']);
            $data['fname']= $_POST['first_name'];
            $data['sname'] = $_POST['last_name'];
            $data['email'] = $_POST['email'];
            $data['password'] = hash(sha256 , $_POST['password']);
            //$this->load->Model('MainModel');
            $sheet = $this->MainModel->newregistermodel($data);
            if($sheet['status_1']==1){
                redirect(CTRL."Main/mainpage");
            }
                   
        }
    }
    public function main_login(){
        if($this->input->post('submit')){
            $this->form_validation->set_rules('email', 'email', 'required|valid_email');
            $this->form_validation->set_rules('password', 'password', 'required');
            if ($this->form_validation->run() == true) {
                $data=array();
                $data['email'] = $this->input->post('email');
                $data['password'] = hash(sha256 , $this->input->post('password'));
                $checkLogin = $this->MainModel->logincheckmodel($data);
                if($checkLogin['login_status']){
                    $this->session->set_userdata('isUserLoggedIn',TRUE);
                    $this->session->set_userdata('usersecondId',$checkLogin['data'][0]['user_second_id']);
                    redirect(CTRL."Main/coursepage", $course_data['course']);
                    
                    // $enrolled=array();
                    // $enrolled = $this->MainModel->enrolledcheckmodel($user_id);

                    // $course_data = array();
                    // $course_data['course_1'] = $this->MainModel->coursedatamodel($enrolled);
                    // echo "<script>console.log('aaa')</script>";
                    
                    // echo "<script>console.log('" . $enrolled . "');</script>";
                    // echo "<script>console.log('" . json_encode($enrolled) . "');</script>";
                }else{
                    $data['error_msg'] = 'Wrong email or password, please try again.';
                    redirect(CTRL."Main/wrongpage");
                }
            }
        }
    }
}

?>
