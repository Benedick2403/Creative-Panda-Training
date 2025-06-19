<?php
App::uses('AppController', 'Controller');

App::import('Vendor', '/setasign/fpdf', array('file' => 'setasign/fpdf/fpdf.php'));
class PrintController extends AppController
{
  public $uses = ['Crud'];
  public $layout = null;


  public function print_all()
  {

    $this->autoRender = false;
    $tab = $this->request->query('tab');

    $conditions = array();
    $conditions = [];

    if (in_array($tab, ['1', '2', '3'])) {
      $conditions['Crud.conditionId'] = (int)$tab;
    }

    if (isset($this->request->query['search'])) {

      $search = $this->request->query['search'];

      $search = strtolower($search);

      $conditions['Crud.name LIKE'] = '%' . $search . '%';
    }

    $conditions['Crud.visible'] = true;

    $page = isset($this->request->query['page']) ? (int)$this->request->query['page'] : 1;
    $limit = 10;
    $offset = ($page - 1) * $limit;

    $cruds = $this->Crud->find('all', [
      'conditions' => $conditions,
      'order' => ['Crud.name' => 'ASC'],
      'limit' => $limit,
      'offset' => $offset
    ]);

    $pdf = new FPDF();
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'B', 14);
    $pdf->Cell(0, 10, 'List of Records', 0, 1, 'C');
    $pdf->Ln(5);

    $w = array(10, 60, 30, 50);
    $tableWidth = array_sum($w);
    $pageWidth = $pdf->GetPageWidth();
    $startX = ($pageWidth - $tableWidth) / 2;

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->SetX($startX);
    $pdf->Cell($w[0], 10, '#', 1, 0, 'C');
    $pdf->Cell($w[1], 10, 'Name', 1, 0, 'C');
    $pdf->Cell($w[2], 10, 'Age', 1, 0, 'C');
    $pdf->Cell($w[3], 10, 'Status', 1, 1, 'C');

    $pdf->SetFont('Arial', '', 10);
    $fill = false;
    $i = 1;
    foreach ($cruds as $row) {
      $status = $row['Crud']['conditionId'] == 1 ? 'APPROVED' : ($row['Crud']['conditionId'] == 2 ? 'DISAPPROVED' : 'PENDING');
      $pdf->SetX($startX);
      if ($fill) {
        $pdf->SetFillColor(230, 230, 230);
      } else {
        $pdf->SetFillColor(255, 255, 255);
      }
      $pdf->Cell($w[0], 10, $i++, 1, 0, 'C', true);
      $pdf->Cell($w[1], 10, $row['Crud']['name'], 1, 0, 'L', true);
      $pdf->Cell($w[2], 10, $row['Crud']['age'], 1, 0, 'C', true);
      $pdf->Cell($w[3], 10, $status, 1, 1, 'C', true);
      $fill = !$fill;
    }

    $pdf->Output('D', 'all_records.pdf');
  }


  public function print_one($id = null)
  {
    $this->autoRender = false;

    $cruds = $this->Crud->find(
      'first',
      array(
        'contain' => array(
          'CrudStatus',
          'Beneficiary',
          'Conditions',
        ),
        'conditions'      => array(
          'Crud.id'       => $id,
          'Crud.visible'  => true,
        )
      )
    );

    $pdf = new FPDF();
    $pdf->AddPage();


    $pdf->SetFont('Arial', 'B', 14);
    $pdf->Cell(0, 10, 'User Record', 0, 1, 'C');
    $pdf->Ln(5);

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 10, 'Name: ', 0, 0);
    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(0, 10, properCase($cruds['Crud']['name']), 0, 1);

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 10, 'Age: ', 0, 0);
    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(0, 10, $cruds['Crud']['age'], 0, 1);

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 10, 'Birthday: ', 0, 0);
    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(0, 10, $cruds['Crud']['birthdate'], 0, 1);

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 10, 'Role: ', 0, 0);
    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(0, 10, $cruds['CrudStatus']['name'], 0, 1);

    $status = $cruds['Crud']['conditionId'] == 1 ? 'APPROVED' : ($cruds['Crud']['conditionId'] == 2 ? 'DISAPPROVED' : 'PENDING');
    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 10, 'Status: ', 0, 0);
    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(0, 10, $status, 0, 1);

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 10, 'Character: ', 0, 0);
    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(0, 10, $cruds['Crud']['charac'], 0, 1);

    $visibleBeneficiaries = array_filter($cruds['Beneficiary'], function ($b) {
      return $b['visible'];
    });

    if (!empty($visibleBeneficiaries)) {
      $pdf->SetFont('Arial', 'B', 14);
      $pdf->Cell(0, 10, 'Beneficiaries', 0, 1, 'C');
      $pdf->Ln(5);

      $pdf->SetFont('Arial', '', 10);
      $pdf->Cell(10, 10, '#', 1);
      $pdf->Cell(60, 10, 'Name', 1);
      $pdf->Cell(30, 10, 'Age', 1);
      $pdf->Cell(50, 10, 'Birthday', 1);
      $pdf->Ln();

      $i = 1;
      foreach ($visibleBeneficiaries as $beneficiary) {
        $pdf->Cell(10, 10, $i++, 1);
        $pdf->Cell(60, 10, $beneficiary['name'], 1);
        $pdf->Cell(30, 10, $beneficiary['age'], 1);
        $pdf->Cell(50, 10, $beneficiary['birthdate'], 1);
        $pdf->Ln();
      }
    }

    // Output the PDF
    $pdf->Output('D', 'records.pdf');
  }
}
