<?phpsession_start();function __autoload($classname){    if (file_exists("c/$classname.php")){        include_once("c/$classname.php");    }    if (file_exists("m/$classname.php")){        include_once("m/$classname.php");    }}$action = 'action_';$action .= (isset($_GET['act'])) ? $_GET['act'] : 'index';switch ($_GET['c']){	case 'user':		$controller = new C_User();		break;	case 'order':		$controller = new C_Order();		break;	default:		$controller = new C_Page();}$controller->Request($action);