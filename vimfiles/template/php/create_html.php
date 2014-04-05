<?php
define('JIEQI_MODULE_NAME','system');  //���屾ҳ�������Ǹ�ģ��
require_once('global.php'); //����ͨ�ó���ÿ��ҳ�����ߺ�
//�����������й�
date_default_timezone_set("PRC");
//��ȡ����ʱ��
$nowtime = date('Y-m-d H:i:s',time());
//��ʱ��תΪunix��
$nowtime = strtotime($nowtime);

/** 
 * ѹ��html : ������з�,����Ʊ��,ȥ��ע�ͱ�� 
 * @param $string 
 * @returnѹ�����$string 
 * */ 
function compress_html($string){ 
    $string=str_replace("\r\n",'',$string);//������з� 
    $string=str_replace("\n",'',$string);//������з� 
    $string=str_replace("\t",'',$string);//����Ʊ�� 
    $pattern=array( "/> *([^ ]*) *</", "/[\s]+/", "/<!--[^!]*-->/", "/\" /", "/ \"/", "'/\*[^*]*\*/'" ); 
    $replace=array ( ">\\1<", " ", "", "\"", "\"", ); 
    return preg_replace($pattern, $replace, $string); 
} 

if(isset($_GET["action"]) && $_GET["action"] == "old"){
    $static_name = "old_index.html";
    $active_name = "index.php";
}else{
    $static_name = "test_index.html";
    $active_name = "index2014.php";
}

if(file_exists($static_name) && ($nowtime - filemtime(JIEQI_ROOT_PATH."/".$static_name > 1800))){
    header("Location: " . $static_name);
    exit;
}

ob_start(); //����
include(JIEQI_ROOT_PATH."/".$active_name);
$text = ob_get_flush(); //������ر�
ob_clean(); //ɾ��

$text = compress_html($text);
$ret = jieqi_writefile(JIEQI_ROOT_PATH."/".$static_name, $text);
exit;
?>
