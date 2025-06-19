<?php

use PHPMailer\PHPMailer\PHPMailer;
// use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require_once dirname(dirname(__DIR__)) . '/vendor/autoload.php';

App::uses('AppController', 'Controller');

class CrudsController extends AppController
{

    public $uses = ['Crud', 'Beneficiary', 'CrudFile', 'CrudStatus'];

    public function beforeFilter()
    {
        parent::beforeFilter();
        $this->RequestHandler->ext = 'json';
    }

    public function index()
    {
        $page = isset($this->request->query['page']) ? $this->request->query['page'] : 1;
        $conditions = [];

        // Search filter
        if (!empty($this->request->query['search'])) {
            $search = strtolower($this->request->query['search']);
            $conditions['Crud.name LIKE'] = '%' . $search . '%';
        }

        // Status/Condition filter (1=Approved, 2=Disapproved, 3=Pending)
        if (!empty($this->request->query['condition'])) {
            $conditions['Crud.conditionId'] = $this->request->query['condition'];
        }

        // Only visible items
        $conditions['Crud.visible'] = true;

        $paginatorSettings = [
            'conditions' => $conditions,
            'limit' => 10,
            'page' => $page,
            'order' => ['Crud.name' => 'ASC'],
            'contain' => ['CrudStatus'],
        ];

        $this->Paginator->settings = $paginatorSettings;
        $tmpData = $this->Paginator->paginate('Crud');
        $paginator = $this->request->params['paging']['Crud'];

        $cruds_ = [];
        foreach ($tmpData as $crud) {
            $cruds_[] = [
                'id'           => $crud['Crud']['id'],
                'name'         => properCase($crud['Crud']['name']),
                'age'          => $crud['Crud']['age'],
                'condition'    => $crud['Crud']['conditionId'],
                'status'       => $crud['CrudStatus']['name'] ?? '',
                'character'    => $crud['Crud']['charac'],
                'visible'      => $crud['Crud']['visible'],
                'date-created' => date('m/d/y', strtotime($crud['Crud']['created'])),
            ];
        }

        $response = [
            'ok'        => true,
            'msg'       => 'index',
            'data'      => $cruds_,
            'paginator' => $paginator,
        ];

        $this->set([
            'response' => $response,
            '_serialize' => 'response',
        ]);
    }


    public function add($id = null)
    {
        //to get view folder
        App::uses('View', 'View');
        $data = $this->request->data;

        if ($this->Crud->saveAssociated($data)) {
            $crudId = $this->Crud->id;

            // Get the latest saved data
            $crud = $this->Crud->find('first', [
                'conditions' => ['Crud.id' => $crudId],
                'contain' => ['CrudStatus', 'Beneficiary']
            ]);

            $userInformation = new View(null, false);

            //setting variables for the email template
            $id = isset($crud['Crud']['id']) ? $crud['Crud']['id'] : null;
            $recipientEmail = isset($crud['Crud']['email']) ? $crud['Crud']['email'] : '';
            $recipientName = isset($crud['Crud']['name']) ? properCase($crud['Crud']['name']) : '';
            $recipientAge = isset($crud['Crud']['age']) ? $crud['Crud']['age'] : '';
            $recipientBirthday = isset($crud['Crud']['birthdate']) ? $crud['Crud']['birthdate'] : '';
            $recipientCharacter = isset($crud['Crud']['charac']) ? $crud['Crud']['charac'] : '';
            $recipientRole = isset($crud['CrudStatus']['name']) ? $crud['CrudStatus']['name'] : '';

            $beneficiaryNames = array();
            if (!empty($crud['Beneficiary'])) {
                foreach ($crud['Beneficiary'] as $b) {
                    $beneficiaryNames[] = $b['name'];
                }
            }
            $beneficiaryList = implode(', ', $beneficiaryNames);

            // Set the variables for the email template
            $userInformation->set(array(
                'id'                    => $id,
                'recipientName'         => properCase($recipientName),
                'recipientAge'          => $recipientAge,
                'recipientBirthday'     => $recipientBirthday,
                'recipientRole'         => properCase($recipientRole),
                'recipientCharacter'    => $recipientCharacter,
                'recipientEmail'        => $recipientEmail,
                'beneficiaries'         => $beneficiaryList,
            ));

            $emailNewlyAdded = $userInformation->element('emailNewlyAdded');

            $mail = new PHPMailer(true);


            // Handle multiple file uploads
            if (!empty($_FILES['file']['name'][0])) {
                $files = $_FILES['file'];
                $uploadPath = WWW_ROOT . 'uploads' . DS;
                for ($i = 0; $i < count($files['name']); $i++) {
                    if (!empty($files['name'][$i])) {
                        $fileName = time() . '_' . basename($files['name'][$i]);
                        $fullPath = $uploadPath . $fileName;
                        if (move_uploaded_file($files['tmp_name'][$i], $fullPath)) {
                            $this->CrudFile->create();
                            $this->CrudFile->save([
                                'crud_id'   => $crudId,
                                'file_path' => 'uploads/' . $fileName,
                                'file_name' => $files['name'][$i]
                            ]);
                        }
                    }
                }
            }

            // Send email notification
            try {
                // Server settings
                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com';
                $mail->SMTPAuth = true;
                $mail->Username = 'mercadobenedick024@gmail.com';
                $mail->Password = 'bjta euxv wmwt sjby';
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Port = 587;

                // Email
                $mail->setFrom('mercadobenedick024@gmail.com', 'Notifier');
                $mail->addAddress('eltonzafra88@gmail.com');

                $mail->isHTML(true);
                $mail->Subject = 'Current Status';
                $mail->msgHTML($emailNewlyAdded);

                $mail->send();
            } catch (Exception $e) {
                // Handle error if needed
            }

            $response = array(
                'ok' => true,
                'msg' => 'Saved!',
                'data' => $data,
            );
        } else {
            $response = array(
                'ok' => false,
                'msg' => 'Not Saved!',
                'data' => $data,
            );
        }
        $this->set(array(
            'response' => $response,
            '_serialize' => 'response'
        ));
    }
    
    public function view($id = null)
    {

        $data = $this->Crud->find('first', array(
            'contain' => array(
                'CrudStatus',
                'Beneficiary' => array(
                    'conditions' => array(
                        'Beneficiary.visible' => true,
                    )
                ),
                'Conditions',
                'CrudFile' => array(
                    'conditions' => array(
                        'CrudFile.visible' => true,
                    )
                ),
            ),
            'conditions' => array(
                'Crud.id' => $id,
                'Crud.visible' => true,

            )
        ));

        $response = array(
            'ok' => true,
            'msg' => 'Viewed!',
            'data' => $data,
        );

        $this->set(array(
            'response' => $response,
            '_serialize' => 'response'
        ));
    }

    public function edit($id = null)
    {
        // to get view folder
        App::uses('View', 'View');
        $data = $this->request->data;

        $userInformation = new View(null, false);

        $original = $this->Crud->find('first', array(
            'conditions' => array('Crud.id' => $id),
            'contain' => array(
                'CrudStatus',
                'Beneficiary',
                'CrudFile' => array(
                    'conditions' => array(
                        'CrudFile.visible' => true,
                    )
                ),
            )
        ));
        //set variables for the email template
        $id = isset($original['Crud']['id']) ? $original['Crud']['id'] : '';
        $oldConditionId = isset($original['Crud']['conditionId']) ? $original['Crud']['conditionId'] : null;
        $newConditionId = isset($data['Crud']['conditionId']) ? $data['Crud']['conditionId'] : null;
        $recipientEmail = isset($original['Crud']['email']) ? $original['Crud']['email'] : '';
        $recipientName = isset($original['Crud']['name']) ? properCase($original['Crud']['name']) : '';
        $recipientAge = isset($original['Crud']['age']) ? $original['Crud']['age'] : '';
        $recipientBirthday = isset($original['Crud']['birthdate']) ? $original['Crud']['birthdate'] : '';
        $recipientRole = isset($original['CrudStatus']['name']) ? $original['CrudStatus']['name'] : '';
        $recipientCharacter = isset($original['Crud']['charac']) ? $original['Crud']['charac'] : '';
        $emailNeeded = $oldConditionId != $newConditionId;


        $beneficiaryNames = array();

        if (!empty($original['Beneficiary'])) {
            foreach ($original['Beneficiary'] as $b) {
                $beneficiaryNames[] = $b['name'];
            }
        }

        $beneficiaryList = implode(', ', $beneficiaryNames);

        // Set the variables for the email templat
        $userInformation->set(array(
            'id'                    => $id,
            'oldStatus'             => $oldConditionId,
            'newStatus'             => $newConditionId,
            'recipientName'         => properCase($recipientName),
            'recipientAge'          => $recipientAge,
            'recipientBirthday'     => $recipientBirthday,
            'recipientRole'         => properCase($recipientRole),
            'recipientCharacter'    => $recipientCharacter,
            'recipientEmail'        => $recipientEmail,
            'beneficiaries'         => $beneficiaryList,
        ));

        $emailBody = $userInformation->element('emailBody');
        $mail = new PHPMailer(true);

        if ($this->Crud->saveAssociated($data)) {

            //file upload
            $crudId = $this->Crud->id;

            // Handle multiple file uploads
            if (!empty($_FILES['file']['name'][0])) {
                $files = $_FILES['file'];
                $uploadPath = WWW_ROOT . 'uploads' . DS;
                for ($i = 0; $i < count($files['name']); $i++) {
                    if (!empty($files['name'][$i])) {
                        $fileName = time() . '_' . basename($files['name'][$i]);
                        $fullPath = $uploadPath . $fileName;
                        if (move_uploaded_file($files['tmp_name'][$i], $fullPath)) {
                            // Save each file to the crud_files table
                            $this->CrudFile->create();
                            $this->CrudFile->save([
                                'crud_id'   => $crudId,
                                'file_path' => 'uploads/' . $fileName, //so we can get the unique id and their file
                                'file_name' => $files['name'][$i]
                            ]);
                        }
                    }
                }
            }

            // If the status has changed, send an email notification
            if ($emailNeeded) {
                try {
                    // Server settings
                    $mail->isSMTP();
                    $mail->Host = 'smtp.gmail.com';
                    $mail->SMTPAuth = true;
                    $mail->Username = 'mercadobenedick024@gmail.com';
                    $mail->Password = 'bjta euxv wmwt sjby';
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                    $mail->Port = 587;

                    // Email
                    $mail->setFrom('mercadobenedick024@gmail.com', 'CRUD');
                    $mail->addAddress('eltonzafra88@gmail.com');

                    $mail->isHTML(true);
                    $mail->Subject = 'Status Updated';
                    $mail->msgHTML($emailBody);
                    // The status for the account $recipientName has changed to: $statusText";

                    $mail->send();

                } catch (Exception $e) {

                }
            }

            $response = array(
                'ok' => true,
                'msg' => 'Updated!',
                'data' => $data,
            );
        } else {
            $response = array(
                'ok' => false,
                'msg' => 'Not Updated!',
                'data' => $data,
            );
        }

        $this->set(array(
            'response' => $response,
            '_serialize' => 'response'
        ));
    }

    // hide for possible retrieve
    public function delete($id = null)
    {
        if ($this->Crud->hide($id)) {
            $response = array(
                'ok' => true,
                'msg' => 'Deleted!',
                'data' => $id,
            );
        } else {
            $response = array(
                'ok' => false,
                'msg' => 'Not Deleted!',
                'data' => $id,
            );
        }

        $this->set(array(
            'response' => $response,
            '_serialize' => 'response'
        ));
    }
}
