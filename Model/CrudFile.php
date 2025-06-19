<?php
class CrudFile extends AppModel {
    public $actsAs = array('Containable');

    public $belongsTo =['Crud']; //associate this model with Crud model
}