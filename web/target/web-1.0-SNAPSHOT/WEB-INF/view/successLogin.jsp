
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"> </c:set>
<html>
<head>
  <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="renderer" content="webkit">
  <link rel="stylesheet" href="${ctx }/layui/css/layui.css"  media="all">
  <script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
  <script src="${ctx }/layui/layui.js" charset="utf-8"></script>
  <title>登录状态</title>

  <style type="text/css">
    .layui-table-cell{
      height:auto!important;
      white-space:normal;
    }

  </style>
  <script type="text/javascript">
    $(function () {
      $("#displaytable").hide();
      var pd=${msg };
      if (pd==1){
        $("#loginPd").html("登录成功!!");
        $("#show").attr({"type":"button"});
      }else {
        $("#loginPd").html("登录失败!!");
      }

      $("#show").click(function () {
        $("#search").attr({"type":"button"});
        $("#hearcheck").attr({"type":"button"});
        $("#addNew").attr({"type":"button"});
        $("#checkall").attr({"type":"button"});
        $("#searchtext").attr({"type":"text"});
        $("#displaytable").show();

        layui.use('table', function(){
          var table = layui.table;
          table.render({
            elem: '#test'
            ,url:'${ctx}/shop/shopQuery.action?operator=page'
            ,cols: [[
               {type:'checkbox'}
              ,{field:'id', width:80, title: 'ID', sort: true}
              ,{field:'goodname', width:80, title: '商品名',edit: 'text'}
              ,{
                field: 'photo',
                title: '图片',
                width: 120,
                templet:"#imgtmp"
               }
              ,{field:'price', width:80, title: '单价', sort: true,edit: 'text'}
              ,{field:'amount', width:80, title: '总量',edit: 'text'}
              ,{fixed:'right',toolbar:'#barDemo'}
            ]]
            ,id:'testReload'
            ,page: true
            ,limit:3
          });

          $("#search").click(function () {
          var goodname=$("#searchtext").val();
          table.reload('testReload',{
            url:'${ctx}/shop/shopSearch.action?goodname='+goodname+'&operator=page'
          });
          });

        });
      });

      /*$("#search").click(function () {
        var goodname=$("#searchtext").val();
        layui.use('table', function(){
          var table = layui.table;
          table.render({
            elem: '#test'
            ,url:'${ctx}/shop/shopSearch.action?goodname='+goodname+'&operator=page'
            ,cols: [[
              {type:'checkbox'}
              ,{field:'id', width:80, title: 'ID', sort: true}
              ,{field:'goodname', width:80, title: '商品名',edit: 'text'}
              ,{
                field: 'photo',
                title: '图片',
                width: 120,
                templet:"#imgtmp"
              }
              ,{field:'price', width:80, title: '单价', sort: true,edit: 'text'}
              ,{field:'amount', width:80, title: '总量',edit: 'text'}
              ,{fixed:'right',toolbar:'#barDemo'}
            ]]
            ,page: true
            ,limit:3
          });
        });
      });*/

      $("#addNew").click(function () {
        var caozuo=$("#addNew").val();
        layui.use('table', function(){
          var table = layui.table;
          table.render({
            elem: '#test'
            ,url:'${ctx}/shop/shopAdd.action?caozuo='+caozuo+'&operator=page'
            ,cols: [[
              {type:'checkbox'}
              ,{field:'id', width:80, title: 'ID', sort: true}
              ,{field:'goodname',width:80, title: '商品名',edit: 'text'}
              ,{
                field: 'photo',
                title: '图片',
                width: 120,
                templet:"#imgtmp"
              }
              ,{field:'price', width:80, title: '单价', sort: true,edit: 'text'}
              ,{field:'amount', width:80, title: '总量',edit: 'text'}
              ,{fixed:'right',toolbar:'#barDemo'}
            ]]
            ,page:{
              curr:3
            }
            ,limit:3
          });
        });
      });

    });
  </script>
<script type="text/html" id="imgtmp">
  <img src="${ctx}\image\{{d.photourl}}"/>
</script>

</head>
<body>
<form action="${ctx}/user/login.action" method="post" id="login">
  <span id="loginPd" style="color: red"></span><br>
  <input type="hidden" class="layui-btn" id="show" value="查看"/><br><br>
  <input type="hidden" class="layui-btn" value="搜索" id="search" style="width: 70px ;height: 32px"/><input id="searchtext" style="width: 400px;height: 30px" type="hidden" name="search" placeholder="请输入内容" autocomplete="off" >

  <%----%>
  <div id="displaytable" style="width: 800px">
    <table class="layui-hide" id="test" lay-filter="demo" >
    </table>
  <%--<table id="table" class="layui-table" lay-data="{width: 892, height:330, url:'${ctx}/shop/shopQuery.action?operator=page', page:true, limit:3,id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'goodname', width:80,edit: 'text'}">商品名</th>
      <th lay-data="{field:'price', width:80, sort: true,edit: 'text'}">单价</th>
      <th lay-data="{field:'amount', width:80,edit: 'text'}">总量</th>
      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
  </table>--%>
  </div>
  <script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">提交</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">上传图片</a>
  </script>
  <input id="hearcheck" type="hidden" class="layui-btn" data-type="getCheckData" value="获取选中行数据"/>
  <input id="addNew" type="hidden" class="layui-btn" value="新建数据"/>
  <input id="checkall" type="hidden" class="layui-btn" data-type="getCheckData" value="批量删除"/><br>

  <div class="layui-upload">
    <button type="button" class="layui-btn" id="test1">上传图片</button>
    <br><button type="button" class="layui-btn" id="test2">上传图片</button>
    <div class="layui-upload-list">
      <img class="layui-upload-img" id="demo1" style="width: 80px;height: 80px">
      <p id="demoText"></p>
    </div>
  </div>

</form>
</body>
<script>
  var photoid;
  $("#test1").hide();
  layui.use(['table','upload'], function() {
    var table = layui.table;
    var $ = layui.jquery
            ,upload = layui.upload;
    //普通图片上传

    //监听表格复选框选择
    table.on('checkbox(demo)', function (obj) {
      console.log(obj)
    });

    table.on('tool(demo)', function(obj){
      var data = obj.data;
      var id=data.id;
      var goodname=data.goodname;
      var price=data.price;
      var amount=data.amount;
    if (obj.event === 'detail'){
      picupload(id,"#demo1");
      $("#test1").click();
      function picupload(id, pic) {
      upload.render({
        elem: '#test1'
        ,url: '${ctx}/shop/fileupload.action?id='+id//改成您自己的上传接口
        ,before: function(obj){
          //预读本地文件示例，不支持ie8
          obj.preview(function(index, file, result){
            $(pic).attr('src', result); //图片链接（base64）

          });
        }
        ,done: function(res){
          //如果上传失败
          if(res.code > 0){
            return layer.msg('上传失败');
          }
          //上传成功
        }
        ,error: function(){
          //演示失败状态，并实现重传
          var demoText = $('#demoText');
          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
          demoText.find('.demo-reload').on('click', function(){
            uploadInst.upload();
          });
        }
      });
      }
    }else if(obj.event === 'del'){
        layer.confirm('真的删除行么', function(index){
          $.ajax({
            url:"${ctx}/shop/shopDelete.action?id="+id,
            type:"post",
            dataType:"text",
            success:function (dataDelete) {
              layer.alert(dataDelete);
            }
          });
          obj.del();
          layer.close(index);
      });
      } else if(obj.event === 'edit'){
        layer.confirm('确认修改??', function(index){
        $.ajax({
          url:"${ctx}/shop/shopUpdate.action?",
          data:{
            id:id,
            goodname:goodname,
            price:price,
            amount:amount,
          },
          type:"post",
          dataType:"text",
          success:function (dataUpdate) {
            layer.alert(dataUpdate);
          }
        });
        /*layer.alert('编辑行：<br>'+ JSON.stringify(data))*/
        });
      }
    });



    var $ = layui.$, active = {
      getCheckData: function () { //获取选中数据
        var checkStatus = table.checkStatus('testReload')
                , data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      }
    };

    $('#hearcheck').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });

    $("#checkall").on('click',function () {
        var type = $(this).data('type');
        deleteall[type] ? deleteall[type].call(this) : '';
    });

      var $1 = layui.$, deleteall = {
          getCheckData: function () { //获取选中数据
              var checkStatus = table.checkStatus('testReload')
                  , data = checkStatus.data,shops=JSON.stringify(data);
              var json1={"shops":shops};
              $.ajax({
                  type:"post",
                  url:"${ctx}/shop/shopDeleteAll.action?",
                  data:shops,
                  dataType:"text",
                  contentType:'application/json;charset=utf-8',
                  success:function (dataUpdate) {
                      layer.alert(dataUpdate);
                    layui.use('table', function(){
                      var table = layui.table;
                      table.render({
                        elem: '#test'
                        ,url:'${ctx}/shop/shopQuery.action?operator=page'
                        ,cols: [[
                          {type:'checkbox'}
                          ,{field:'id', width:80, title: 'ID', sort: true}
                          ,{field:'goodname', width:80, title: '商品名',edit: 'text'}
                          ,{
                            field: 'photo',
                            title: '图片',
                            width: 120,
                            templet:"#imgtmp"
                          }
                          ,{field:'price', width:80, title: '单价', sort: true,edit: 'text'}
                          ,{field:'amount', width:80, title: '总量',edit: 'text'}
                          ,{fixed:'right',toolbar:'#barDemo'}
                        ]]
                        ,page: true
                        ,limit:3
                      });
                    });
                  }
              });
          }
      };

  });

  layui.use('upload', function(){
    var $ = layui.jquery
            ,upload = layui.upload;
    //普通图片上传

    var uploadInst = upload.render({
      elem: '#test2'
      ,url: '${ctx}/shop/fileupload.action?'//改成您自己的上传接口
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $("#demo1").attr('src', result); //图片链接（base64）
        });
      }
      ,done: function(res){
        //如果上传失败
        if(res.code > 0){
          return layer.msg('上传失败');
        }
        //上传成功
      }
      ,error: function(){
        //演示失败状态，并实现重传
        var demoText = $('#demoText');
        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
        demoText.find('.demo-reload').on('click', function(){
          uploadInst.upload();
        });
      }
    });

  });

</script>
</html>