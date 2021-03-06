<?php
$hitPayWall = false;
if(!empty($currentUser)) {
    if($currentUser->get_account_type() == UserAccountTypes::LIMITED_UNPAID) {
        $stories = (new Stories())->loadByCurrentUser($currentUser->id);
        if( count( $stories ) >= 1 ) {
            $hitPayWall = true;
        }
    }
}

if($hitPayWall) {
    $_SESSION['hitPayWall'] = true;
    if(!empty($module) && !empty($module_name)) {
        header('Location: /' . $module_name . '/list/');
        exit();
    } else {
        header('Location: /stories/list/');
        exit();
    }
}