<?php



App::uses('AppController', 'Controller');

class StatusController extends AppController
{

    public $uses = ['CrudStatus'];

    public function beforeFilter()
    {

        parent::beforeFilter();

        $this->RequestHandler->ext = 'json';
    }

    public function index($id = null)
    {
        $page = isset($this->request->query['page']) ? $this->request->query['page'] : 1;

        $conditions = [];

        if (!empty($this->request->query['search'])) {
            $search = strtolower($this->request->query['search']);
            $conditions['CrudStatus.name LIKE'] = '%' . $search . '%';
        }

        if (!empty($id)) {
            $conditions['CrudStatus.id'] = $id;
        }

        $conditions['CrudStatus.visible'] = true;

        $paginatorSettings = array(
            'conditions' => $conditions,
            'limit' => 15,
            'page' => $page,
            'order' => array('CrudStatus.name' => 'ASC'),
        );


        $this->Paginator->settings = $paginatorSettings;
        $tmpData = $this->Paginator->paginate('CrudStatus');
        $paginator = $this->request->params['paging']['CrudStatus'];

        $status_ = array();
        foreach ($tmpData as $status) {
            $status_[] = array(
                'id'            => $status['CrudStatus']['id'],
                'name'          => properCase($status['CrudStatus']['name']),
                'status'        => isset($status['CrudStatus']['name']) ? $status['CrudStatus']['name'] : '',
                'visible'       => $status['CrudStatus']['visible'],
            );
        }

        $response = array(
            'ok' => true,
            'msg' => 'index',
            'data' => $status_,
            'paginator' => $paginator,
        );

        $this->set(array(
            'response' => $response,
            '_serialize' => 'response'
        ));
    }

    public function add($id = null)
    {
        $data = $this->request->data;

        if ($this->CrudStatus->save($data)) {

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
        $data = $this->CrudStatus->find('first', array(
            'contain' => array(
                'CrudStatus',
            ),
            'conditions' => array(
                'CrudStatus.id' => $id,
                'CrudStatus.visible' => true,
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

        $data = $this->request->data;

        if ($this->CrudStatus->save($data)) {
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


    public function delete($id = null)
    {
        if ($this->CrudStatus->hide($id)) {
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
