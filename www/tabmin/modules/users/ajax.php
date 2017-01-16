<?phpinclude($_SERVER['DOCUMENT_ROOT'].'/../private/includes/config.inc.php');if(@$_POST['verb']!='forgotpw' && @$_POST['verb']!='resetpw' && @$_POST['verb']!='sign-up'&& @$_POST['verb']!='contact' && @$_POST['verb']!='feedback')	include INCLUDE_ROOT.'/ajax_secure.inc.php';ErrorSet::setAJAX(true);$properties = array				(					'id'=>@$_POST['users_id'],					'role'=>array					(						'id'=>@$_POST['roles_id']					),					'email'=>trim(@$_POST['email']),					'first_name'=>trim(@$_POST['first_name']),					'last_name'=>trim(@$_POST['last_name']),					'password'=>@$_POST['password'],					'password2'=>@$_POST['password2'],					'nick_name'=>@$_POST['nick_name'],                    'referral'=>@$_POST['referral'],					'phone'=>@$_POST['phone'],					'address'=>@$_POST['address'],					'city'=>@$_POST['city'],					'state'=>@$_POST['state'],					'zip'=>@$_POST['zip']				);if (isset($_FILES['picture'])) {    $properties['picture_file'] = @$_FILES['picture'];}$controller = new UserController($properties, $currentUser, @$module);$controller->setAllRequired(array(		'first_name'=>'First Name',		'password'=>'Password',		'password2'=>'Repeated Password',		'email'=>'Email',		));$module = 'users';switch(@$_POST['verb']){	case 'add':		$controller->add();	break;	case 'edit':		$controller->removeRequired('password');		$controller->removeRequired('password2');		$controller->update();	break;	case 'member_edit':		$controller->removeRequired('password');		$controller->removeRequired('password2');        $controller->removeProperty('address');        $controller->removeProperty('city');        $controller->removeProperty('state');        $controller->removeProperty('zip');        $controller->removeProperty('phone');        $controller->removeProperty('nick_name');        $controller->removeProperty('role');        $controller->update();	break;	case 'delete':		$controller->delete();	break;	case 'sign-up':		$controller->setCheckPermissions(false);		if( AlertSet::$success && $controller->signUp() )        {            AlertSet::$success = true;            UserController::sendMail(ERROR_REPORTING_EMAIL, 'New User Sign Up - ' . htmlentitiesUTF8($_POST['email']), 'Email: ' . htmlentitiesUTF8($_POST['email']) .                ' -- First Name: ' . htmlentitiesUTF8($_POST['first_name']) . ' -- Referral: ' . htmlentitiesUTF8($_POST['referral']) . ' -- ID: ' . $controller->get_tobject()->get_id(), true);        }        $json['success'] = AlertSet::$success;        $json['alerts'] = AlertSet::$alerts;        echo json_encode($json);        die();	break;	case 'contact':        if( empty($_POST['thename'])) {            AlertSet::addValidation('Please provide your name, so I know what to call you.');        }        if( empty($_POST['email'])) {            AlertSet::addValidation('Please provide your email address, so I can get back to you.');        }        if( empty($_POST['message'])) {            AlertSet::addValidation('Please provide a question or comments.');        }        if( AlertSet::$success )        {            $usersManager = new Users();            $html .= '<strong>Name: </strong>' .  htmlentitiesUTF8($_POST['thename']) . '<br />';            $html .= '<strong>Email: </strong>' .  htmlentitiesUTF8($_POST['email']). '<br />';            $html .= '<strong>Message: </strong>' .  htmlentitiesUTF8(@$_POST['message']). '<br />';            if( UserController::sendMail(ERROR_REPORTING_EMAIL, 'StoryTracker Contact Form Submission', $html) )            {                AlertSet::addSuccess('Thank you for your request. You should expect an email response from us shortly.');            }            else            {                AlertSet::addError('Your message could not be sent at this time.');            }        }        $json['success'] = AlertSet::$success;        $json['alerts'] = AlertSet::$alerts;	break;	case 'feedback':        if( AlertSet::$success )        {            $usersManager = new Users();            $html = '<strong>Name: </strong>' .  htmlentitiesUTF8($_POST['name']) . '<br />';            $html .= '<strong>Email: </strong>' .  htmlentitiesUTF8($_POST['email']) . '<br />';            $html .= '<strong>Encounter any Problems?: </strong>' .  htmlentitiesUTF8($_POST['problems']) . '<br />';            $html .= '<strong>Plan to use StoryTracker?: </strong>' .  htmlentitiesUTF8($_POST['opinion']). '<br />';            $html .= '<strong>Questions/Comments: </strong>' .  htmlentitiesUTF8($_POST['comments']). '<br />';            if( UserController::sendMail(ERROR_REPORTING_EMAIL, 'StoryTracker Feedback Form Submission', $html) )            {                AlertSet::addSuccess('Your message has been received.');            }            else            {                AlertSet::addError('Your message could not be sent at this time.');            }        }        $json['success'] = AlertSet::$success;        $json['alerts'] = AlertSet::$alerts;        echo json_encode($json);        die();	break;	case 'forgotpw':		$controller->forgotPassword();	break;	case 'resetpw':		$controller->addProperty('key', $_POST['key']);		$controller->resetPassword();	break;	case 'export':        $properties = array(            'id'=>@$currentUser->get_id(),        );        $controller = new UserController($properties, $currentUser, @$module);		$controller->export();	break;	case 'bug-report':        $properties = array(            'user'=>array('id'=>$currentUser->get_id()),            'current_page'=>$_POST['current_page'],            'browser'=>$_POST['browser'],            'problem'=>$_POST['problem']        );        $bug_report = new BugReport($properties);        if( $bug_report->add() )        {            AlertSet::addSuccess('Bug Report added successfully.');        }        else        {            AlertSet::addError('There was a problem submitting your Bug Report. Please Try Again.');        }	break;    default:        AlertSet::addError('Verb not recognized.');    break;}ob_start();echo json_decode($controller->get_json());$contents = ob_get_contents();ob_end_clean();echo $contents;