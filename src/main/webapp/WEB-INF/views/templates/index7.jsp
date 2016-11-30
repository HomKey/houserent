<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${basePath}/resources/js/bootstrap/css/bootstrap.min.css">
    <!-- datetimepicker -->
  <link rel="stylesheet" href="${basePath}/resources/js/datetimepicker/css/bootstrap-datetimepicker.min.css"">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${basePath}/resources/js/cdnjs/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${basePath}/resources/js/cdnjs/ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${basePath}/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${basePath}/resources/js/dist/css/skins/_all-skins.min.css">

  <link rel="stylesheet" href="${basePath}/resources/css/houseManage.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<style>

</style>
<body class="hold-transition sidebar-mini">





<section class="content-header">
  <h1>
    Dashboard
    <small>Control panel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Dashboard</li>
  </ol>
</section> 

<div id="addTop">
  <span class="xsd-font-size16">共<i class="xsd-color-primary">&nbsp;2&nbsp;</i>幢公寓</span>
  &nbsp;<i class="xsd-color-gray">|</i>
  <span class="xsd-font-size16 marginR21"><i class="xsd-color-primary">&nbsp;175
  &nbsp;</i>间房间</span>
  <label class="xsd-input-group xsd-select">
    <i class="iconfont"></i>
    <input id="apartmentSelect" class="xsd-input xsd-padding-l12" type="text" readonly="" placeholder="" data-value="990">
    <ul style="display: none;">
          <li data-value="990">111</li>
          <li data-value="991">1111</li>
    </ul>
  </label>
  <b>楼层</b>
  <label class="xsd-input-group xsd-select">
      <i class="iconfont"></i>
      <input id="floorSelect" class="floor xsd-input xsd-padding-l12" data-value="" type="text" readonly="" value="全部" placeholder="选择楼层">
      <ul style="display: none;">
          <li data-value="">全部</li>
            <li data-value="8169">1楼</li>
            <li data-value="8170">2楼</li>
            <li data-value="8171">3楼</li>
            <li data-value="8172">4楼</li>
            <li data-value="8173">5楼</li>
      </ul>
  </label>
  <a class="xsd-pull-right btn xsd-btn-primary apartment xsd-text-center xsd-margin-r16" data-toggle="xsd-modal" data-target="#addHouse">添加公寓</a>
</div>

<!--  <div id="tools" class="xsd-clearfix">
      <div class="xsd-pull-left xsd-margin-r64">
          <a class="xsd-font-size18 iconfont" data-toggle="xsd-drawer" data-target="#houseDetail">
              &nbsp;111</a>
                   </div>
      <div class="xsd-pull-left xsd-margin-r24">
          <span class="xsd-color-gray xsd-font-size12">房间数</span>
          <p><span class="xsd-color-primary xsd-font-size20">15</span>
          </p>
      </div>
      <div class="xsd-pull-left">
          <span class="xsd-color-gray xsd-font-size12">在租数</span>
          <p><span class="xsd-color-yellow xsd-font-size20">0</span>
          </p>
      </div>
          <a class="xsd-pull-right btn" data-toggle="xsd-modal" data-target="#rentalHouse">添加托管合同</a>
          <a class="xsd-pull-right btn">添加楼层</a>
          <a class="xsd-pull-right btn">添加房间</a>
  </div>

      <div class="xsd-margin-t22" id="oneFloor">
          <div class="floorNum">
              <span class="xsd-pull-left xsd-btn-primary floor">1<br>楼</span>
              <table class="oneFloor">
                  <tr>
                      <td>
                            <a>编辑</a>
                      </td>
                  </tr>
                  <tr>
                      <td>
                            <a data-toggle="xsd-modal" data-target="#delFloor">删除</a>
                      </td>
                  </tr>
              </table>
          </div>
          <div class="xsd-clearfix">
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0101室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0102室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0103室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0104室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0105室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0106室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0107室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0108室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0109室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0110室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0111室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0112室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0113室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0114室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left xsd-margin-r16">
                    <a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
                          <div class="not-rent"></div>
                        <div class="Details xsd-font-size12">
                            <p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0115室</p>
                              <p class="xsd-color-gray empty">未出租</p>
                        </div>
                        <div class="roomDetails">
                                <a class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">出租</a>
                        </div>
                    </a>
                </div>
                <div class="xsd-pull-left addRoom">
                    <div class="add">
                        <a class="btn">
                            <span class="iconfont xsd-color-gray"></span>
                            <p>添加房间</p>
                        </a>
                    </div>
                </div>


          </div>
      </div>
    <div id="pagination">
                  </div>
</div>--> 

</body>
</html>














