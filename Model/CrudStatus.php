<?php
class CrudStatus extends AppModel {
    // public $actsAs = array('Containable');

    public $hasMany = array(
        'Crud' => array(
            'foreignKey' => 'crudStatusID'
        )
        );
}