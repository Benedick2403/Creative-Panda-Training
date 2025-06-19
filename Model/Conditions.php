<?php
class Conditions extends AppModel {
    public $actsAs = array('Containable');


    public $hasOne = array(
        'Crud' => array(
            'foreignKey' => 'conditionId'
        )
        );
}