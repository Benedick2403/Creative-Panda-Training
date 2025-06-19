<?php ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?php echo $title_for_layout ?></title>
</head>

<body style="font-family: Arial, sans-serif; background: #f7f7f7; margin:0; padding:0;">
    <table width="100%" cellpadding="0" cellspacing="0" style="background: #f7f7f7; padding: 30px 0;">
        <tr>
            <td align="center">
                <table width="600" cellpadding="0" cellspacing="0" style="background: #fff; border-radius: 8px; box-shadow:0 2px 8px #e0e0e0; padding: 30px;">
                    <tr>
                        <td align="center" style="padding-bottom: 20px;">
                            <h2 style="color: #2c3e50; margin: 0;">User Information Update</h2>
                            <p style="color: #888; margin: 5px 0 0 0; font-size: 14px;">Status Notification</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" cellpadding="6" cellspacing="0" style="font-size: 15px;">
                                <tr>
                                    <td style="color: #555; width: 180px;">ID:</td>
                                    <td style="color: #222;"><?php echo $id ?></td>
                                </tr>
                                <tr>
                                    <td style="color: #555;">Registered by:</td>
                                    <td style="color: #222;"><?php echo $recipientName ?></td>
                                </tr>
                                <tr>
                                    <td style="color: #555;">Email:</td>
                                    <td style="color: #222;"><?php echo $recipientEmail ?></td>
                                </tr>
                                <tr>
                                    <td style="color: #555;">Age:</td>
                                    <td style="color: #222;"><?php echo $recipientAge ?></td>
                                </tr>
                                <tr>
                                    <td style="color: #555;">Date of Birth:</td>
                                    <td style="color: #222;"><?php echo $recipientBirthday ?></td>
                                </tr>
                                <tr>
                                    <td style="color: #555;">Role:</td>
                                    <td style="color: #222;"><?php echo $recipientRole ?></td>
                                </tr>
                                <tr>
                                    <td style="color: #555;">Character:</td>
                                    <td style="color: #222;"><?php echo $recipientCharacter ?></td>
                                </tr>

                                <?php if (!empty($beneficiaries)): ?>
                                    <tr>
                                        <td style="color: #555; vertical-align: top;">Beneficiaries:</td>
                                        <td style="color: #222;"><?php echo nl2br(h($beneficiaries)); ?></td>
                                    </tr>
                                <?php endif; ?>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 25px 0;">
                            <?php
                            $currentStatus = '';
                            $changeTo = '';
                            if ($oldStatus == 1) $currentStatus = 'APPROVED';
                            elseif ($oldStatus == 2) $currentStatus = 'DISAPPROVED';
                            else $currentStatus = 'PENDING';

                            if ($newStatus == 1) $changeTo = 'APPROVED';
                            elseif ($newStatus == 2) $changeTo = 'DISAPPROVED';
                            else $changeTo = 'PENDING';
                            ?>
                            <div style="background: #f1f8e9; border-left: 5px solid #4caf50; padding: 18px 20px; border-radius: 4px; color: #333; font-size: 16px;">
                                We want to inform you that your status has been updated from
                                <strong style="color: #1976d2;"><?php echo $currentStatus ?></strong>
                                to
                                <strong style="color: #d32f2f;"><?php echo $changeTo ?></strong>.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="color: #888; font-size: 13px; padding-top: 10px;">
                            <hr style="border: none; border-top: 1px solid #eee; margin: 20px 0;">
                            <span>Notifier</span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>