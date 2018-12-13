<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>admin.html</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    <link rel="stylesheet" type="text/css"
          href="/aaa/views/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/aaa/views/easyui/themes/icon.css">

    <link rel="stylesheet" type="text/css"
          href="/aaa/views/bootstrap-3.3.7-dist/css/bootstrap.css" />
    <script type="text/javascript"
            src="/aaa/views/bootstrap-3.3.7-dist/js/jquery-2.1.0.js"></script>
    <script type="text/javascript"
            src="/aaa/views/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

    <script type="text/javascript" src="/aaa/views/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/aaa/views/easyui/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="/aaa/views/easyui/locale/easyui-lang-zh_CN.js"></script>
    <!--
        html背景图
        .datagrid-body {
            background: url('gimage/back.jpg') repeat;
        }

     -->
    <style type="text/css">

        .btn {
            padding: 1px 6px;
        }
        .panel-body {
            padding: 5px;
        }
        #ddBtn{
            margin-left:380px;
            text-align:center;
        }
        .datagrid-header .datagrid-cell span,#pp {
            font-size: 15px;
        }

        .datagrid-header-row td {

        }
        .combo-p {
            background-color:rgba(255,255,255,0.7);
        }
        .combo-panel{
            background-color:rgba(255,255,255,0.7);
        }
        .layui-btn-normal {
            background-color: #5bc0de;
        }
        .layui-btn {
            padding: 0 8px;
            margin-top:-7px;
            height:32px;
            border-radius: 0px
        }
        #agreeall {
            position: relative;
            left: -23px;
            top: 260px;
        }
        #noall {
            position: relative;
            left: -23px;
            top: 260px;
        }
    </style>

</head>

<body>
<!-- background-image: linear-gradient(to right,#5cb85c 0,#5bc0de 100%); -->

<!--
<div id="tb">
<a onclick="add()" class="easyui-linkbutton btn btn-primary" href="#" role="button">添加</a>
<a onclick="update()" class="easyui-linkbutton btn btn-success" href="#" role="button">编辑</a>
<a onclick="delete()" class="easyui-linkbutton btn btn-info" href="#" role="button">删除</a>
</div>
 -->

<div id="ctb">
    <!-- 订单编号 提交人 审核时间 审核人 状态 -->
    <!--<label id>发货时间：</label><input id="cbeginDate" type="text"
        class="easyui-datebox" data-options="editable:false" style="width:120px"></input> -&#45;&#45;&#45;&#45;&#45;&#45;
    <input id="cendDate" type="text" class="easyui-datebox"
        data-options="editable:false" style="width:120px"></input>-->

    <label id="id">状态：</label><select name="tradeId" id="tradeId">
    <option value="0">所有</option>
    <option value="1">充值</option>
    <option value="2">提现</option>
</select><br>
    从<input name="bbegintime" id="bbegintime" type="text"/>到<input name="bendtime" id="bendtime" type="text"/><br>


    <a onclick="csearch()" class="easyui-linkbutton btn btn-primary"
       data-options="" id="sea">搜索</a>
    <a onclick="clearmsg()" class="easyui-linkbutton btn btn-primary"
       data-options="" id="resett">重置</a>

</div>
<!--<form id="ff" method="post">
    <div>
        <input id="myname" class="easyui-validatebox" type="text" name="adminName" />
    </div>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="query();">过滤</a>
</form>-->
<table id="dg" class="table table-bordered" border="1"></table>

<script type="text/javascript">



    /*function query(){
        datagrid.datagrid('load', {adminid:$("#adminid").val()});
    }*/


    /*开始*/
    var msgTJ = {};
    function csearch() {
        msgTJ["tradeId"] = $("#tradeId").val();
        msgTJ["bbegintime"] = $("#bbegintime").val();
        msgTJ["bendtime"] = $("#bendtime").val();
        /*msgTJ["corder"] = $("#corder").val();
        msgTJ["csubmitter"] = $("#csubmitter").val();
        msgTJ["cbeginDate"] = $("#cbeginDate").val();
        msgTJ["cendDate"] = $("#cendDate").val();
        msgTJ["ccheckmen"] = $("#ccheckmen").val();*/
        $('#dg').datagrid("reload");

        //if($('#dg').datagrid('getRows').length==""){
        //zdalert('系统提示','没有您要找的信息',function(){
        //})
        //}
    }
    function clearmsg() {
        $('#tradeId').textbox('setValue','');
        $('#bbegintime').textbox('setValue','');
        $('#bendtime').textbox('setValue','');
        /*$('#corder').textbox('setValue','');
        $('#csubmitter').textbox('setValue','');
        $('#cbeginDate').textbox('setValue','');
        $('#cendDate').textbox('setValue','');
        $('#ccheckmen').textbox('setValue','');*/
        document.getElementById("sea").onclick();
    }
    $('#dg')
        .datagrid(
            {
                url : '/aaa/traderecord/dataGridT',
                queryParams : msgTJ,
                fit : true,
                toolbar : '#ctb',
                pagination : true,
                rownumbers : true,
                pageSize : 6,
                pageList : [ 2, 6, 9, 12 ],
                columns : [ [
                    {
                        field : '',
                        checkbox : true,
                        width : 100
                    },
                    {
                        field : 'recordtime',
                        title : '时间',
                        width : 200,
                        align : 'center',
                        formatter:function(value,row,index){
                            var unixTimestamp = new Date(value);
                            //var unixTimestamp = new Date();
                            return unixTimestamp.toLocaleString();
                        }
                    },
                    {
                        field : 'recordno',
                        title : '交易号',
                        width : 100,
                        align : 'center',
                        sortable: true,
                        sorter: function (a, b) { return (a > b ? 1 : -1) }
                    },
                    {
                        field : 'tradeName',
                        title : '类型',
                        width : 100,
                        align : 'center',
                        sortable: true,
                        sorter: function (a, b) { return (a > b ? 1 : -1) }/*,
                        formatter:function(value,row,index){
                            if(row.tradeId==1){
                                return '提现';
                            }else if (row.tradeId==2){
                                return '现金';
                            }
                        }*/
                    },
                    {
                        field : 'recordmoney',
                        title : '金额',
                        width : 100,
                        align : 'center',
                        sortable: true,
                        sorter: function (a, b) { return (a > b ? 1 : -1) }
                    },
                    {
                        field : 'recordremark',
                        title : '备注',
                        width : 100,
                        align : 'center'
                    } ] ],
                sortName:"id",
                sortOrder:"asc"
            });

    /*$('#dg')
        .datagrid(
            {
                url : '/aaa/admins/listt',
                queryParams : msgTJ,
                fit : true,
                toolbar : '#ctb',
                pagination : true,
                rownumbers : true,
                pageSize : 6,
                pageList : [ 2, 6, 9, 12 ],
                columns : [ [
                    {
                        field : '',
                        checkbox : true,
                        width : 100
                    },
                    {
                        field : 'adminid',
                        title : '用户账号',
                        width : 100,
                        align : 'center',
                        sortable: true,
                        sorter: function (a, b) { return (a > b ? 1 : -1) },
                        formatter : function (value,row,index) {
                            return row.adminid.adminid;
                        }
                    },
                    {
                        field : 'adminname',
                        title : '用户姓名',
                        width : 100,
                        align : 'center',
                        sortable: true,
                        sorter: function (a, b) { return (a > b ? 1 : -1) },
                        formatter : function (value,row,index) {
                            return row.adminid.adminname;
                        }
                    },
                    {
                        field : 'adminstatus',
                        title : '是否冻结',
                        width : 100,
                        align : 'center',
                        sortable: true,
                        sorter: function (a, b) { return (a > b ? 1 : -1) },
                        formatter : function (value,row,index) {
                            return row.adminid.adminstatus;
                        }
                    },
                    {
                        field : 'handtime',
                        title : '冻结时间',
                        width : 200,
                        align : 'center',
                        formatter:function(value,row,index){
                            if(value!=null){
                                var unixTimestamp = new Date(value);
                                return unixTimestamp.toLocaleString();
                            }else{
                                return "";
                            }
                        }
                    },
                    {
                        field : 'ooo',
                        title : '操作',
                        width : 100,
                        align : 'center',
                        formatter:function(value,row,index){
                            if(row.handtime!=null){
                                return '<a href="/aaa/admins/close?adminid="'+row.adminid+'>冻结</a>';
                            }else{
                                return '<a href="/aaa/admins/open?adminid="'+row.adminid+'>解冻</a>';
                            }
                        }
                    } ] ]
            });*/


    function close(id){
        alert(id);
        /*zdconfirm('系统确认框','确认冻结吗',function(r){
            if(r){
                $.post("/aaa/admins/close", {
                    "adminid" : id
                }, function(data) {
                    $('#dg').datagrid('reload');
                    zdalert('系统提示','冻结成功',function(){

                    })
                })
            }
        });*/
    }

    /*
                                {
                                    field:'_operate',
                                    width:80,align:'center',
                                    formatter: function(value, row, index) {
                                        return '<a href="#" onclick="editUser('+index+')">修改</a>';
                                    }
                                }
    function editUser(index){
        $('#dg').datagrid('selectRow',index);// 关键在这里
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('setTitle','修改学生信息');
            $('#fm').form('load',row);
            url = '${ctx}updateStudent.do?id='+row.id;
			}
		}
		*/

    function deletecheckchange(id){
        zdconfirm('系统确认框','确认删除吗',function(r){
            if(r){
                $.post("/ui/check/deletecheckchange", {
                    "id" : id
                }, function(data) {
                    $('#dg').datagrid('reload');
                    zdalert('系统提示','删除成功',function(){

                    })
                })
            }
        });
    }


    function detail(ordernumber) {
        $("#ordernumber").dialog("open");
        $('#dga').datagrid(
            {
                url : '/ui/check/getordernumber',
                queryParams : {"ordernumber":ordernumber},
                fit : true,
                pagination : true,
                rownumbers : true,
                pageSize : 9,
                pageList : [ 9, 18, 27, 36 ],
                columns : [ [
                    {
                        field : 'ordernumbers',
                        title : '订单编号',
                        width : 118,
                        align : 'center'
                    },
                    {
                        field : 'goodsname',
                        title : '商品名称',
                        width : 206,
                        align : 'center'
                    },
                    {
                        field : 'goodsprice',
                        title : '商品价格',
                        width : 100,
                        align : 'center'
                    },
                    {
                        field : 'goodscount',
                        title : '商品总量',
                        width : 100,
                        align : 'center'
                    },
                    {
                        field : 'purchasenum',
                        title : '状态',
                        width : 100,
                        align : 'center'
                    },
                    {
                        field : 'supplierName',
                        title : '供应商',
                        width : 183,
                        align : 'center'
                    },
                    {
                        field : 'totalAmount',
                        title : '总价',
                        width : 100,
                        align : 'center'
                    } ] ]
            });
    }

    /*$(function() {
       $.post("/ui/goods/getSe", {}, function(data) {
            $(".men").html(data);
        })
    });*/


    //----------修改alert和confirm样式
    (function($) {

        $.alerts = {
            alert: function(title, message, callback) {
                if( title == null ) title = 'Alert';
                $.alerts._show(title, message, null, 'alert', function(result) {
                    if( callback ) callback(result);
                });
            },

            confirm: function(title, message, callback) {
                if( title == null ) title = 'Confirm';
                $.alerts._show(title, message, null, 'confirm', function(result) {
                    if( callback ) callback(result);
                });
            },


            _show: function(title, msg, value, type, callback) {

                var _html = "";

                _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
                _html += '<div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
                if (type == "alert") {
                    _html += '<input id="mb_btn_ok" type="button" value="确定" />';
                }
                if (type == "confirm") {
                    _html += '<input id="mb_btn_ok" type="button" value="确定" />';
                    _html += '<input id="mb_btn_no" type="button" value="取消" />';
                }
                _html += '</div></div>';

                //必须先将_html添加到body，再设置Css样式
                $("body").append(_html); GenerateCss();

                switch( type ) {
                    case 'alert':

                        $("#mb_btn_ok").click( function() {
                            $.alerts._hide();
                            callback(true);
                        });
                        $("#mb_btn_ok").focus().keypress( function(e) {
                            if( e.keyCode == 13 || e.keyCode == 27 ) $("#mb_btn_ok").trigger('click');
                        });
                        break;
                    case 'confirm':

                        $("#mb_btn_ok").click( function() {
                            $.alerts._hide();
                            if( callback ) callback(true);
                        });
                        $("#mb_btn_no").click( function() {
                            $.alerts._hide();
                            if( callback ) callback(false);
                        });
                        $("#mb_btn_no").focus();
                        $("#mb_btn_ok, #mb_btn_no").keypress( function(e) {
                            if( e.keyCode == 13 ) $("#mb_btn_ok").trigger('click');
                            if( e.keyCode == 27 ) $("#mb_btn_no").trigger('click');
                        });
                        break;


                }
            },
            _hide: function() {
                $("#mb_box,#mb_con").remove();
            }
        }
        // Shortuct functions
        zdalert = function(title, message, callback) {
            $.alerts.alert(title, message, callback);
        }

        zdconfirm = function(title, message, callback) {
            $.alerts.confirm(title, message, callback);
        };




        //生成Css
        var GenerateCss = function () {

            $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
                filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
            });

            $("#mb_con").css({ zIndex: '999999', width: '15%', position: 'fixed',
                backgroundColor: 'White', borderRadius: '15px'
            });

            $("#mb_tit").css({ display: 'block', fontSize: '14px', color: '#444', padding: '10px 15px',
                backgroundColor: '#DDD', borderRadius: '15px 15px 0 0',
                borderBottom: '3px solid #009BFE', fontWeight: 'bold'
            });

            $("#mb_msg").css({ padding: '20px', lineHeight: '20px',
                borderBottom: '1px dashed #DDD', fontSize: '13px'
            });

            $("#mb_ico").css({ display: 'block', position: 'absolute', right: '10px', top: '9px',
                border: '1px solid Gray', width: '18px', height: '18px', textAlign: 'center',
                lineHeight: '16px', cursor: 'pointer', borderRadius: '12px', fontFamily: '微软雅黑'
            });

            $("#mb_btnbox").css({ margin: '15px 0 10px 0', textAlign: 'center' });
            $("#mb_btn_ok,#mb_btn_no").css({ width: '60px', height: '25px', color: 'white', border: 'none' });
            $("#mb_btn_ok").css({ backgroundColor: '#168bbb' });
            $("#mb_btn_no").css({ backgroundColor: 'gray', marginLeft: '20px' });


            //右上角关闭按钮hover样式
            $("#mb_ico").hover(function () {
                $(this).css({ backgroundColor: 'Red', color: 'White' });
            }, function () {
                $(this).css({ backgroundColor: '#DDD', color: 'black' });
            });

            var _widht = document.documentElement.clientWidth; //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高

            var boxWidth = $("#mb_con").width();
            var boxHeight = $("#mb_con").height();

            //让提示框居中
            $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });
        }
    })(jQuery);
    //----------修改alert和confirm样式完毕------
    //---zdconfirm('系统确认框','你确认提交该条数据吗',function(r){
    //---if(r){
    //---点确定之后执行的内容
    //---}
    //---});

    //---zdalert('系统提示','请输入正确数值',function(){
    //---要回调的方法
    //---});
    function agree(id) {
        zdconfirm('系统确认框','确认同意吗',function(r){
            if(r){
                $("#agree").attr('disabled', true);
                $("#no").attr('disabled', true);
                $.post("/ui/check/agree", {
                    "id" : id
                }, function(data) {
                    $('#dg').datagrid('reload');
                })
            }
        });
    }
    function no(id) {
        zdconfirm("系统确认框","确认驳回吗",function(r){
            if(r){
                $("#panel").dialog("open");
                $("#tpanel").form('load', '/ui/check/getCheck?id=' + id);
                //$.post("/ui/check/no", {
                //"id" : id
                //}, function(data) {
                //$("#agree").attr('disabled', true);
                //$("#no").attr('disabled', true);
                //$('#dg').datagrid('load');
                //})
            }
        });
    }

    function agreeall() {
        var s = $("#dg").datagrid("getSelections");
        alert(s.length);
        if (s.length > 0) {
            zdconfirm('系统确认框','确认同意吗',function(r){
                if(r){
                    for ( var i = 0; i < s.length; i++) {
                        $.post("/ui/check/agree", {
                            "id" : s[i]
                        }, function(data) {

                        })
                    }
                    $('#dg').datagrid('reload');
                }
            });

        } else {

            zdalert('系统提示','请至少选择一项',function(){

            })

        }
    }
    function noall() {
        zdconfirm("系统确认框","确认驳回吗",function(r){
            if(r){
                //$("#panel").css('display','block');
                $("#panel").dialog("open");
                $("#tpanel").form('load', '/ui/check/getCheck?id=' + id);
                //$.post("/ui/check/no", {
                //"id" : id
                //}, function(data) {
                //$("#agree").attr('disabled', true);
                //$("#no").attr('disabled', true);
                //$('#dg').datagrid('load');
                //})
            }
        });
    }

    function save(){
        var a = $("#paneltxt").val();
        if(a==""){

            zdalert('系统提示','内容不能为空',function(){

            })

        }else{
            $("#tpanel").form('submit', {
                url : "/ui/check/updateCheck",
                onSubmit : function() {
                    //表单验证
                },
                success : function(data) {
                    $("#panel").dialog("close");
                    $("#dg").datagrid("reload");

                    zdalert('系统提示','提交成功',function(){

                    })

                }
            });
        }
    }

    function getComment(id){
        $("#panel").dialog("open");
        $("#tpanel").form('load', '/ui/check/getCheck?id=' + id);
    }

    function doExcelChange() {
        var s = $("#dg").datagrid("getSelections");
        if (s.length > 0) {
            var ids = [];
            for ( var i = 0; i < s.length; i++) {
                ids.push(s[i].id);
            }
            $.post("/ui/send/doExcel", {
                "ids[]" : ids
            }, function(data) {

            })
        } else {

            zdalert('系统提示','请至少选择一项',function(){

            })

        }
    }

</script>

</body>
</html>
