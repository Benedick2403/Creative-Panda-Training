<?php

class Crud extends AppModel
{
    public $actsAs = array('Containable');

    //referencing the crudstatus
    public $belongsTo = array(
        'CrudStatus' => array(
            'foreignKey' => 'crudStatusID'
        ),
        'Conditions' => array(
            'foreignKey' => 'conditionId'
        ),
    );

    public $hasMany = array(
        'Beneficiary',
        'CrudFile'
    );
}
