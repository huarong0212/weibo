<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Auth;

class AuthController extends Controller {
	
	protected function _initialize() {
		if (!session('admin')) {
			$this->redirect('Login/index');
		}
		
		//如果是超级管理员，则不需要通过权限类认证，拥有全部权限。
		//if (session('admin')['id'] == 1) {
		//	return true;
		//}
		
		$Auth = new Auth();
		if (!$Auth->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/', session('admin')['id'])) {
			echo '<p style="margin:10px;color:red;">对不起，您没有权限操作此模块！</p>';
			exit();
		}
		
	}
}