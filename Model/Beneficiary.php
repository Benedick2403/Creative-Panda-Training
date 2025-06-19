<?php

class Beneficiary extends AppModel{
    public $actsAs = array('Containable');
    
    public $belongsTo = ['Crud']; //associate this model with Crud model
}