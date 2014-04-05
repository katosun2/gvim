<?php
define('JIEQI_MODULE_NAME','system');  //定义本页面属于那个模块
require_once('global.php'); //包含通用程序，每个页面必须高喊
//将区域设置中国
date_default_timezone_set("PRC");
//获取现在时间
$nowtime = date('Y-m-d H:i:s',time());
//将时间转为unix戳
$nowtime = strtotime($nowtime);

/** 
 * 压缩html : 清除换行符,清除制表符,去掉注释标记 
 * @param $string 
 * @return压缩后的$string 
 * */ 
function compress_html($string){ 
    $string=str_replace("\r\n",'',$string);//清除换行符 
    $string=str_replace("\n",'',$string);//清除换行符 
    $string=str_replace("\t",'',$string);//清除制表符 
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

ob_start(); //创建
include(JIEQI_ROOT_PATH."/".$active_name);
$text = ob_get_flush(); //输出并关闭
ob_clean(); //删除

$text = compress_html($text);
$ret = jieqi_writefile(JIEQI_ROOT_PATH."/".$static_name, $text);
exit;
?>
